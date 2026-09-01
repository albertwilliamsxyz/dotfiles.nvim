-- Server binaries come from nix profile; nvim-lspconfig only provides the
-- default configs that lsp/<name>.lua files override.
vim.lsp.enable({ "lua_ls", "ts_ls", "jsonls", "html", "cssls", "emmet_language_server" })

vim.diagnostic.config({ virtual_text = true })

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

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Diagnostics: Float" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("config.lsp", { clear = true }),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		-- Resolve popups and additionalTextEdits (auto-imports) on accept;
		-- autotrigger stays off because 'autocomplete' already drives the menu
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
		end

		-- 0.12 maps grr/gri/grt/gra/grn/gO/K globally, and points 'tagfunc' at
		-- the LSP so CTRL-] jumps and CTRL-T returns. Only the list-producing
		-- ones are worth overriding: fzf-lua previews and filters them, and
		-- jump1 makes a single result jump straight through as before.
		local fzf = require("fzf-lua")
		local function map(lhs, fn, desc, mode)
			vim.keymap.set(mode or "n", lhs, fn, { buffer = ev.buf, silent = true, desc = desc })
		end
		map("grr", fzf.lsp_references, "LSP: References")
		map("gri", fzf.lsp_implementations, "LSP: Implementations")
		map("grt", fzf.lsp_typedefs, "LSP: Type definitions")
		map("gra", fzf.lsp_code_actions, "LSP: Code actions", { "n", "x" })
		map("gO", fzf.lsp_document_symbols, "LSP: Document symbols")
		map("<leader>lft", vim.lsp.buf.format, "LSP: Format buffer")
	end,
})
