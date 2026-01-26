return {
	-- 1. Tool Installer (Ensures everything is downloaded)
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
					-- LSPs
					"lua_ls",
					"html",
					"cssls",
					"cssmodules_ls",
					"ts_ls",
					"jsonls",
					"emmet_language_server",
					"pyright",

					-- Formatters/Linters (used by conform.nvim)
					"stylua",
					"eslint_d",
					"prettierd",
					"codespell",

					-- Debuggers
					"chrome-debug-adapter",
					"js-debug-adapter",
				},
			})
		end,
	},

	-- 2. Completion (Blink.cmp - Faster than nvim-cmp)
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = { 
                preset = "default",
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
            cmdline = {
                sources = function()
                    local type = vim.fn.getcmdtype()
                    if type == "/" or type == "?" then return { "buffer" } end
                    if type == ":" then return { "cmdline", "path" } end
                    return {}
                end,
            },
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
                list = { selection = { preselect = false, auto_insert = true } },
            },
		},
	},

	-- 3. LSP Configuration (The Brain)
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

			-- Setup LSPs via Mason Handlers
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {}, -- handled by mason-tool-installer
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
				},
			})

			-- 4. Keymaps (Restoring the "Old" robustness)
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
					vim.keymap.set("n", "<leader>lft", vim.lsp.buf.format, options) -- Manual format fallback

					-- Diagnostics
					vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
					vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, options)
					vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, options)
				end,
			})
		end,
	},
}
