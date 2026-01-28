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
		},
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"cssls",
					"cssmodules_ls",
					"ts_ls",
					"jsonls",
					"emmet_language_server",
					"pyright",
					"stylua",
					"eslint_d",
					"prettierd",
					"codespell",
					"js-debug-adapter",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
									workspace = { library = vim.api.nvim_get_runtime_file("", true) },
								},
							},
						})
					end,

					["emmet_language_server"] = function()
						lspconfig.emmet_language_server.setup({
							capabilities = capabilities,
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
					
					["cssls"] = function()
						lspconfig.cssls.setup({
							capabilities = capabilities,
							settings = {
								css = { lint = { unknownAtRules = "ignore" } },
							},
						})
					end,

                    ["pyright"] = function()
                        lspconfig.pyright.setup({
                            capabilities = capabilities,
                            before_init = function(_, config)
                                -- Automatically find the virtualenv
                                local function get_venv_path(root_dir)
                                    local match = vim.fn.glob(root_dir .. "/.venv")
                                    if match ~= "" then return match end
                                    match = vim.fn.glob(root_dir .. "/.env")
                                    if match ~= "" then return match end
                                    match = vim.fn.glob(root_dir .. "/venv")
                                    if match ~= "" then return match end
                                    return nil
                                end

                                local root_dir = config.root_dir or vim.fn.getcwd()
                                local venv = get_venv_path(root_dir)
                                if venv then
                                    config.settings.python.pythonPath = venv .. "/bin/python"
                                end
                            end,
                            settings = {
                                python = {
                                    analysis = {
                                        autoSearchPaths = true,
                                        useLibraryCodeForTypes = true,
                                        autoImportCompletions = true,
                                    },
                                },
                            },
                        })
                    end,
				},
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					local buffer = event.buf
					local options = { buffer = buffer, silent = true }

					-- Navigation
					vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, options)
					vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, options)
					vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, options)
					vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, options)

					-- Actions
					vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, options)
					vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, options)
					vim.keymap.set("n", "<leader>lft", vim.lsp.buf.format, options)

					-- Diagnostics
					vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, options)
					vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, options)
				end,
			})
		end,
	},
}
