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
                        "mason-org/mason.nvim",
                        {
                                "mason-org/mason-lspconfig.nvim",
                                dependencies = {
                                        "mason-org/mason.nvim",
                                        "neovim/nvim-lspconfig",
                                },
                                config = function()
                                        local mason_lspconfig = require("mason-lspconfig")
                                        mason_lspconfig.setup({
                                                automatic_enable = true,
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

                                        vim.lsp.config('lua_ls', {
                                                capabilities = capabilities,
                                                settings = {
                                                        Lua = {
                                                                runtime = { version = "LuaJit" },
                                                                diagnostics = { globals = { 'vim', 'require' } },
                                                                workspace = {
                                                                        library = vim.api.nvim_get_runtime_file('', true),
                                                                },
                                                                telemetry = { enable = false },
                                                        },
                                                },
                                        })

                                        vim.lsp.config('cssls', {
                                                capabilities = capabilities,
                                                settings = {
                                                        css = {
                                                                lint = {
                                                                        unknownAtRules = "ignore",
                                                                },
                                                        },
                                                },
                                        })

                                        vim.lsp.config('cssmodules_ls', { capabilities = capabilities })

                                        vim.lsp.config('emmet_language_server', {
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
                        },
                        {
                                "jay-babu/mason-null-ls.nvim",
                                event = { "BufReadPre", "BufNewFile" },
                                dependencies = {
                                        "mason-org/mason.nvim",
                                        "nvimtools/none-ls.nvim",
                                },
                                config = function()
                                        local mason_null_ls = require("mason-null-ls")
                                        mason_null_ls.setup({
                                                automatic_installation = true,
                                                ensure_installed = {
                                                        "pyright",
                                                        "stylua",
                                                        "eslint_d",
                                                        "eslint-lsp",
                                                },
                                        })

                                        local null_ls = require("null-ls")
                                        null_ls.setup()
                                end,
                        },
                        {
                                "jay-babu/mason-nvim-dap.nvim",
                                dependencies = {
                                        "mason-org/mason.nvim",
                                        "mfussenegger/nvim-dap",
                                },
                        },
                },
                opts = {
                        ensure_installed = {
                                "codespell",
                                "chrome-debug-adapter",
                        },
                        run_on_start = true,
                },
        },
}
