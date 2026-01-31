# Visual Guides: Indent vs Blanks

## 1. indent-blankline.nvim
*   **Purpose**: To visualize **Structure** (Scope).
*   **What it does**: It draws a vertical line connecting the `if` to the `end`, or the `{` to the `}`.
*   **Value**: It helps you understand "What block am I in?".
*   **Context**: It supports "Scope Highlight", illuminating the current block brighter than the rest.

## 2. "Seeing Blanks" (Listchars)
*   **Purpose**: To visualize **Whitespace** (Sanity).
*   **What it does**: It turns invisible characters (Space, Tab, EOL) into visible glyphs (e.g., `·`, `→`).
*   **Mechanism**: This is a native Neovim feature configured via `vim.opt.list` and `vim.opt.listchars`.
*   **Value**: Essential for Python (tabs vs spaces) or exact alignment.

### Comparison
| Feature | `indent-blankline` | `listchars` |
| :--- | :--- | :--- |
| **Draws** | Vertical lines at indent levels | Points/Arrows at every white char |
| **Goal** | Logic Structure | Text Layout |
| **Config** | Lua Plugin | `vim.opt` in `options.lua` |

## 3. Other Visual Plugins to Plan
*   **Rainbow Delimiters**: Colors parenthesis pairs `()` individually. Excellent for Lisp/Lua.
*   **Colorizer**: Highlights `#ff0000` with a red background.
*   **Dressing.nvim**: Makes `vim.ui.select` (code actions) look like Telescope.
    *   *Note*: If you use `noice.nvim`, it *can* handle `vim.ui.input`. However, `dressing` is often superior for `select` menus. We will check your current setup.
