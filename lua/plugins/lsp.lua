return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvimtools/none-ls-extras.nvim" },
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		-- Add dependencies for the required used here
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local buffer = event.buf
					local options = { noremap = true, silent = false, buffer = buffer }

					-- Jumping
					vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, options)
					vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, options)
					vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, options)
					vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, options)

					-- Actions
					vim.keymap.set("n", "<leader>lft", vim.lsp.buf.format, options)
					vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, options)
					vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, options)

					-- Diagnostics and Information
					vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, options)

					-- Insert mode
					vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, options)

					-- Autocommands / Autogroups
					vim.api.nvim_create_autocmd({ "BufWritePre" }, {
						buffer = buffer,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end,
			})
		end,
	},
}
