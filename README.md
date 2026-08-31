# Synapse v11

> A mechanism to manipulate software with the same ease as manipulating ideas.

Eleventh iteration, rebuilt for an agent-first workflow: an AI harness writes
most of the code, so the editor's job is **reading, reviewing agent diffs, and
surgical edits**. The config is 11 plugins on top of Neovim 0.12 natives —
everything else was reviewed one by one and deliberately dropped.

## The Idea-First Grammar

Keymaps are organized around semantic units — function, class, block,
parameter, assignment, return, statement — not cursor movement. Implemented
with treesitter textobjects (`main` branch):

| Action | Keys | Unit |
|---|---|---|
| Select | `af`/`if` `ac`/`ic` `ab`/`ib` `ap`/`ip` `aa`/`ia` `ar`/`ir` `as` | outer/inner of each unit |
| Move | `]f` `[f` … (`s r p b f c`, uppercase = end) | jump between units |
| Swap | `<leader>m{p,a,b,f,s}` / uppercase = previous | reorder units |
| Repeat | `;` `,` (also wraps `f F t T`) | repeat any grammar move |

## Plugins (11)

| Concern | Plugin |
|---|---|
| Syntax/grammar | nvim-treesitter, nvim-treesitter-textobjects, nvim-treesitter-context (`main`) |
| LSP defaults | nvim-lspconfig (data only — `vim.lsp.enable` drives everything) |
| Picker | fzf-lua (+ `vim.ui.select`) |
| Files | oil.nvim |
| Motion | leap.nvim (codeberg) + vim-repeat, nvim-spider |
| Micro-edits | dial.nvim |
| Theme | base16-nvim (`base16-grayscale-light`) |

## Covered by Neovim 0.12 natives

`vim.pack` (plugin manager + lockfile) · `'autocomplete'` + omnifunc-first
`'complete'` + fuzzy (completion) · `vim.lsp.config`/`enable` (LSP) ·
`:Undotree` (`<leader>u`) · statusline · `gc` comments · `an`/`in`
incremental selection · buffer freshness via `'autoread'` + checktime autocmd
(the agent edits files on disk; unmodified buffers reload on focus).

## External binaries (nix)

```sh
nix profile install nixpkgs#tree-sitter nixpkgs#lua-language-server \
  nixpkgs#typescript-language-server nixpkgs#vscode-langservers-extracted
```

Day-1 languages: TypeScript/JS + web (ts_ls, html, cssls, jsonls) and Lua
(lua_ls). Adding a language = one `lsp/<name>.lua` delta (optional), one name
in `vim.lsp.enable`, one nix install.

## Install

```sh
git clone -b v11 git@github.com:albertwilliamsxyz/dotfiles.nvim.git ~/.config/nvim
nvim   # vim.pack installs plugins and parsers on first boot
```

## Open slots

Deliberately undecided, pending evaluation:

- **Diff review** — diffview-plus fork vs codediff.nvim (+ review.nvim) vs
  native `:DiffTool`. Carries the whole agent-diff review loop.
- **Markdown rendering** — render-markdown.nvim vs markview.nvim.

## Structure

```
init.lua            four requires, nothing else
lsp/                per-server deltas over nvim-lspconfig defaults
lua/config/         options · keymaps · autocmds · pack (vim.pack) · lsp
lua/plugins/        one plain-lua module per plugin
```
