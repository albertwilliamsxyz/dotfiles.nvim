-- Server binaries come from nix profile; nvim-lspconfig only provides the
-- default configs that lsp/<name>.lua files override.
vim.lsp.enable({ "lua_ls", "ts_ls", "jsonls", "html", "cssls" })

vim.diagnostic.config({
	virtual_text = true,
	float = { border = "rounded" },
})

-- Native as-you-type completion (0.12): LSP via omnifunc first, then buffer
-- sources capped at 5 candidates each. "fuzzy" covers what blink.cmp did.
vim.o.autocomplete = true
vim.o.complete = "o,.^5,w^5,b^5"
vim.o.completeopt = "menuone,noselect,popup,fuzzy"

vim.keymap.set("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true, desc = "Next completion item" })
vim.keymap.set("i", "<S-Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, desc = "Previous completion item" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("config.lsp", { clear = true }),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		-- Resolve popups and additionalTextEdits (auto-imports) on accept;
		-- autotrigger stays off because 'autocomplete' already drives the menu
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
		end

		local function map(lhs, fn, desc)
			vim.keymap.set("n", lhs, fn, { buffer = ev.buf, silent = true, desc = desc })
		end
		map("<leader>lgd", vim.lsp.buf.definition, "LSP: Go to definition")
		map("<leader>lgD", vim.lsp.buf.declaration, "LSP: Go to declaration")
		map("<leader>lgi", vim.lsp.buf.implementation, "LSP: Go to implementation")
		map("<leader>lgr", vim.lsp.buf.references, "LSP: References")
		map("<leader>lrn", vim.lsp.buf.rename, "LSP: Rename")
		map("<leader>lca", vim.lsp.buf.code_action, "LSP: Code action")
		map("<leader>lft", vim.lsp.buf.format, "LSP: Format buffer")
		map("<leader>lh", vim.lsp.buf.hover, "LSP: Hover")
		map("<leader>ld", vim.diagnostic.open_float, "Diagnostics: Float")
	end,
})
