# UI & Theming

A modern Neovim distribution requires a distinct look and feel.

## 1. Colorscheme
Load the colorscheme plugin and `vim.cmd.colorscheme()` in its config.
Note: Set `priority = 1000` to ensure it loads before other UI elements.

```lua
{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

## 2. Statusline
**lualine.nvim** is the most popular choice.
It supports themes and integrates with LSP/Git status out of the box.

## 3. UI Enhancements
- **Noice.nvim**: Replaces the command line and messages with nice overlays.
- **Nvim-web-devicons**: Provides file icons (requires Nerd Font).

## 4. Key Components
For a full editor experience, include:
- **Telescope**: For finding files and text (`<leader>f`).
- **Neo-tree**: For managing the file system (`<leader>e`).
- **Which-Key**: For discovering keymaps.
