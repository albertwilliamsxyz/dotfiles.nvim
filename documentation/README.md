# Custom Neovim Distribution Guide

This documentation outlines how to build a maintainable, high-performance Neovim distribution.

## 1. Core Philosophy
- **Modular Structure**: Keep configuration split into logical components (options, keymaps, plugins).
- **Lazy Loading**: Use `lazy.nvim` to load plugins only when needed for startup speed.
- **Native Lua**: Leverage Neovim's native Lua API for all configuration.

## 2. Recommended Components
- **Plugin Manager**: lazy.nvim
- **Language Server Protocol (LSP)**: nvim-lspconfig + Mason
- **Completion**: nvim-cmp or blink.cmp
- **Highlighting**: nvim-treesitter
- **Fuzzy Finder**: Telescope or fzf-lua
- **File Explorer**: Neo-tree or Oil.nvim

## 3. Directory Structure
See [structure.md](./structure.md) for the detailed layout.

## 4. Next Steps
- Review the [structure.md](./structure.md) to set up your folders.
- Follow [plugins.md](./plugins.md) to configure the plugin manager.
- Implement language support using [lsp.md](./lsp.md).
