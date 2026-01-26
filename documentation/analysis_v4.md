# Plugin Analysis (Branch v4)

A highly opinionated "Power User" configuration with significant "Infrastructure" automation and structural editing capabilities.

## Key Findings (vs v3 & v7)

### Infrastructure (The "Auto-Everything" Layer)
*   **`WhoIsSethDaniel/mason-tool-installer.nvim`**:
    *   **Feature**: Enforces installation of tools (`eslint_d`, `stylua`, `codespell`, `chrome-debug-adapter`).
    *   **Why**: Ensures your environment is consistent whenever you install Nvim.
*   **`jay-babu/mason-null-ls.nvim`**:
    *   **Feature**: Bridges `mason` and `none-ls` (formatter/linter injection).
    *   **Config**: Explicitely sets up `eslint_d` (faster linting) and `stylua`.
*   **`emmet_language_server`**:
    *   **Feature**: First-class support for Emmet (HTML/CSS expansions) via LSP.

### Treesitter (The "Structural" Layer)
*   **`nvim-treesitter-textobjects`**: **Major Feature Match**.
    *   **Selection**: `af` (function outer), `if` (function inner), `ac` (class), etc.
    *   **Swapping**: `<leader>mp` (swap parameters).
    *   **Movement**: `]f` (next function start), `[f` (previous function).
    *   **Repeat**: `;` and `,` to repeat movements.

### Visuals
*   **Theme**: `base16-grayscale-light`. Indicates a past preference for light mode or high contrast monochrome.

## Recommendations for v7
1.  **Adopt Treesitter Textobjects**: This is a "superpower" feature. v7 has basic treesitter, but missing the `textobjects` module that makes Vim movements "understand" code structure.
2.  **Add Emmet**: `emmet-language-server` is crucial for web dev (if you do HTML/JSX).
3.  **Linting/Formatting Strategy**: v7 relies on LSP. v4 forced `eslint_d` via `none-ls`. We should decide if `conform.nvim` + `nvim-lint` is the modern equivalent to add to Phase 2.
