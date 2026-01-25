# Directory Structure

Your Neovim configuration should follow this modular structure to ensure maintainability.

```text
~/.config/nvim/
├── init.lua              # Entry point: Loads core config and bootstraps plugins
├── documentation/        # (This folder) - Explains the setup
├── lua/
│   ├── config/           # Core configuration module
│   │   ├── lazy.lua      # Plugin manager bootstrap logic
│   │   ├── options.lua   # Vim options (vim.opt)
│   │   ├── keymaps.lua   # Global keymappings
│   │   └── autocmds.lua  # Auto-commands (event handlers)
│   └── plugins/          # Plugin specifications (lazy.nvim)
│       ├── ui.lua        # UI plugins (colorscheme, statusline, icons)
│       ├── editor.lua    # Editor utilities (file explorer, fuzzy finder, git)
│       ├── coding.lua    # Coding assistants (completion, snippets, pairs)
│       ├── lsp.lua       # LSP configuration & formatting
│       └── treesitter.lua# Syntax highlighting & parsing
```

## detailed Breakdown

### `init.lua`
The single entry point. It should strictly only `require` other modules.
```lua
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
```

### `lua/config/`
Contains the "vanilla" Neovim settings.
- `options.lua`: Settings like `relativenumber`, `tabstop`, `termguicolors`.
- `keymaps.lua`: Mappings that don't depend on plugins (e.g., window movement).

### `lua/plugins/`
Contains plugin specifications returned as Lua tables.
`lazy.nvim` will automatically merge all files returned by `{ import = "plugins" }`.
