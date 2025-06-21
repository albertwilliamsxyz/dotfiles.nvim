# TODO

- ~/Notes/nvim-configuration

---

1. Configurar lsp para lua
2. Configurar lsp para python
3. Configurar lsp para typescript/javascript 
4. Configurar lsp para html/css/cssmodules

5. Configurar herramientas


---

Antes tenia configuracion de ciertas dependencias utilizando mason-tool-installer, luego
Tengo mason null ls para manejar las dependencias de null-ls (ahora none-ls)
Mi configuracion de mason requiere la instalacion de ciertas dependencias como (garantizar que esten instaladas):
- "pyright"
- "stylua"
- "eslint_d"
- "eslint-lsp"
Luego tengo una serie de dependencias como:
- "codespell"
- "chrome-debug-adapter"
Que quedaban fuera de los instalados por los otros plugins
Luego el setup de mason-lspconfig
- "lua_ls",
- "html",
- "cssls",
- "cssmodules_ls",
- "ts_ls",
- "jsonls",
- "emmet_language_server",
De cmp_nvim_lsp saco las capacidades del motor de complecion
Luego la asigno a cada configuracion de cada cliente de lsp
Configurar un clinte lsp no lo activa, tienes que activarlo
Si llamas a la funcion de activar sin argumentos creo que se llama para todo

vim.lsp.config('lua_ls', {
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

vim.lsp.config('html', { capabilities = capabilities })

vim.lsp.config('ts_ls', { capabilities = capabilities })

vim.lsp.config('jsonls', { capabilities = capabilities })

vim.lsp.config('pyright', { capabilities = capabilities })

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

---

infrastructure.lua:

Dependencies:

I might wanna configure the border to make it match lazy
I might wanna configure the border to make it match mason

---



infrastructure.lua:

Dependencies:
"codespell"
"chrome-debug-adapter"

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

vim.lsp.config('html', { capabilities = capabilities })

vim.lsp.config('ts_ls', { capabilities = capabilities })

vim.lsp.config('jsonls', { capabilities = capabilities })

vim.lsp.config('pyright', { capabilities = capabilities })

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

I might wanna configure the border to make it match lazy
I might wanna configure the border to make it match mason
