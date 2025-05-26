return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>pmm", ":Mason<CR>" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"mason-org/mason-lspconfig.nvim",
				dependencies = {
					"mason-org/mason.nvim",
					"neovim/nvim-lspconfig",
				},
				config = function()
					local mason = require("mason")
					mason.setup()

					local mason_lspconfig = require("mason-lspconfig")
					mason_lspconfig.setup({
						automatic_installation = true,
						ensure_installed = {
							"lua_ls",
							"html",
							"cssls",
							"cssmodules_ls",
							"ts_ls",
							"jsonls",
							"emmet_language_server",
						},
					})

					local lspconfig = require("lspconfig")
					local capabilities = require("cmp_nvim_lsp").default_capabilities()

					mason_lspconfig.setup_handlers({
						function(server_name)
							lspconfig[server_name].setup({ capabilities = capabilities })
						end,
						["lua_ls"] = function()
							lspconfig.lua_ls.setup({
								capabilities = capabilities,
								settings = {
									Lua = {
										runtime = { version = "Lua 5.4", path = package.path },
										workspace = {
											library = {
												[vim.fn.expand("$VIMRUNTIME/lua")] = true,
												[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
											},
										},
										telemetry = { enable = false },
									},
								},
							})
						end,
						["cssls"] = function()
							lspconfig.cssls.setup({
								capabilities = capabilities,
								settings = {
									css = {
										lint = {
											unknownAtRules = "ignore",
										},
									},
								},
							})
						end,
						["emmet_language_server"] = function()
							lspconfig.emmet_language_server.setup({
								filetypes = {
									"html",
									"css",
									"javascript",
									"javascriptreact",
									"typescriptreact",
									"less",
									"sass",
									"scss",
									"pug",
								},
								init_options = {
									includeLanguages = {},
									excludeLanguages = {},
									extensionsPath = {},
									preferences = {},
									showAbbreviationSuggestions = true,
									showExpandedAbbreviation = "always",
									showSuggestionsAsSnippets = true,
									variables = {},
								},
							})
						end,
						["cssmodules_ls"] = function()
							lspconfig.cssmodules_ls.setup({ capabilities = capabilities })
						end,
					})
				end,
			},
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"nvimtools/none-ls.nvim",
				},
				config = function()
					local mason = require("mason")
					mason.setup()

					local mason_null_ls = require("mason-null-ls")
					mason_null_ls.setup({
						automatic_installation = true,
						ensure_installed = {
							"pyright",
							"stylua",
							"eslint_d",
							"eslint-lsp",
							"jq-lsp",
						},
					})
					local null_ls = require("null-ls")

					null_ls.setup({
						sources = {
							null_ls.builtins.formatting.stylua,
						},
					})
				end,
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = {
					"williamboman/mason.nvim",
					"mfussenegger/nvim-dap",
				},
			},
		},
		opts = {
			ensure_installed = {
				"misspell",
				"codespell",
				"chrome-debug-adapter",
			},
			run_on_start = true,
		},
	},
}
