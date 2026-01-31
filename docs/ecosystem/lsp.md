# Language Server Protocol (LSP) & Intelligence

## 1. The Installer (Mason)
*   **[mason.nvim](https://github.com/williamboman/mason.nvim)**:
    *   *Role*: The package manager for external tools (LSPs, Linters, Formatters). It downloads the binaries.
*   **[mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)**:
    *   *Role*: The bridge. It tells Neovim "When Mason installs `ts_ls`, automatically set it up with lspconfig."
    *   *Relation*:
        *   `mason`: Installs the tool (e.g., `pyright` binary).
        *   `lspconfig`: Knows how to talk to `pyright` (flags, init options).
        *   `mason-lspconfig`: Automates the connection between the two.
*   **[mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)**:
    *   *Role*: Ensures a specific list of tools is always installed (Declarative setup).

## 2. The Client (LSPConfig)
*   **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**:
    *   *Role*: The official Neovim configuration repo for connecting to Language Servers.
    *   *Handlers*: You asked about handlers. These are functions that define "What happens when the Server sends a message?"
        *   `textDocument/hover`: Displays the hover floating window.
        *   `textDocument/signatureHelp`: Displays function parameters.
        *   `textDocument/publishDiagnostics`: Updates the red squiggles in the gutter.

## 3. Completion (Blink)
*   **[blink.cmp](https://github.com/saghen/blink.cmp)**:
    *   *Role*: The Autocompletion Engine.
    *   *Why*: Fast, modern alternative to `nvim-cmp`.
    *   *Sources*: It aggregates suggestions from:
        *   LSP (Semantic knowledge)
        *   Buffer (Strings in file)
        *   Path (Filesystem)
        *   Snippets

## 4. Formatting
*   **[conform.nvim](https://github.com/stevearc/conform.nvim)**:
    *   *Role*: The Formatter.
    *   *Workflow*: Auto-formats on save (if configured) or via `<leader>lft`. It standardizes code style (Prettier, Stylua, Black).
