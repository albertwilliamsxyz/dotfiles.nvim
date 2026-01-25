# LSP & Coding Implementation

This section details how to implement robust language support.

## 1. LSP (Language Server Protocol)
We use the following stack:
- **Mason**: Installs LSP servers, DAP servers, linters, and formatters.
- **Mason-LSPConfig**: Bridges Mason with lspconfig.
- **nvim-lspconfig**: Configures the LSP client in Neovim.

### Configuration (`lua/plugins/lsp.lua`)
```lua
{
  "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({ automatic_installation = true })
    
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim-lsp").default_capabilities()
    
    -- Setup specific servers
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    -- Add python, tsserver, etc.
  end
}
```

## 2. Formatting
We recommend **conform.nvim** for formatting. It's lightweight and easy to configure.

### Configuration
```lua
{
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
    },
    format_on_save = { timeout_ms = 500 },
  }
}
```

## 3. Autocompletion
**nvim-cmp** is the standard completion engine.
- Sources: `nvim_lsp` (LSP), `luasnip` (Snippets), `buffer`, `path`.
- Map `<Tab>`, `<CR>`, and arrows for navigation.

## 4. Syntax Highlighting
**nvim-treesitter** provides AST-based highlighting.
Enable `highlight = { enable = true }` and `indent = { enable = true }` in `lua/plugins/treesitter.lua`.
