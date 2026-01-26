
### 🎨 Visuals & UI
*   **`ui.lua`**:
    *   **Plugin**: `catppuccin/nvim`.
    *   **Config**: Sets theme to "Mocha" (Dark) and enables integrations for other plugins (Treesitter, Gitsigns, etc.).
*   **`statusline.lua`**:
    *   **Plugin**: `nvim-lualine/lualine.nvim` (The bottom status bar).
    *   **Plugin**: `folke/which-key.nvim` (The popup key helper).

### 🧠 Intelligence (The "Brain")
*   **`lsp.lua`**:
    *   **Role**: Manages Language Servers (LSP).
    *   **Plugins**:
        *   `mason.nvim`: Installs servers (`lua_ls`, `ts_ls`, `emmet_language_server`).
        *   `nvim-lspconfig`: Configures them to talk to Neovim.
*   **`completion.lua`**:
    *   **Plugin**: `saghen/blink.cmp` (Modern, fast completion engine).
    *   **Config**: Auto-shows completion menu; supports LSP snippets.
*   **`treesitter.lua`**:
    *   **Plugin**: `nvim-treesitter` (Syntax Highlighting).
    *   **Extension**: `nvim-treesitter-textobjects`.
    *   **Power Config**: Adds "Structural" keys:
        *   **Select**: `af` (Function), `ac` (Class).
        *   **Swap**: `<leader>a` (Swap arguments).
        *   **Move**: `]f` (Next function).
*   **`formatting.lua`**:
    *   **Plugin**: `stevearc/conform.nvim`.
    *   **Config**: "Format on Save" enabled. uses `prettier` for JS/Web and `stylua` for Lua.

### 🚀 Workflow Tools
*   **`file-manager.lua`**:
    *   **Plugin**: `stevearc/oil.nvim`.
    *   **Key**: `-` opens the file manager (editable buffer style).
*   **`fuzzy-finder.lua`**:
    *   **Plugin**: `nvim-telescope/telescope.nvim`.
    *   **Keys**: `<leader>ff` (Files), `<leader>fg` (Grep), `<leader>fb` (Buffers).
*   **`git.lua`**:
    *   **Plugins**:
        *   `vim-fugitive`: The Git command wrapper (`:Git`).
        *   `gitsigns.nvim`: Shows diff markers in the gutter.

### 🛠️ Pro Tools
*   **`debugger.lua`**:
    *   **Plugin**: `nvim-dap` (Debug Adapter Protocol).
    *   **UI**: `nvim-dap-ui` (The debug sidebar).
    *   **Keys**: `<leader>db` (Breakpoint), `<leader>dc` (Continue).
    *   **Config**: Pre-configured for **Chrome** debugging on port 9222.
