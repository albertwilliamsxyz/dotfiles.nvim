# Editing & Manipulation

## 1. The Parser (Treesitter)
*   **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)**:
    *   *Role*: It builds a concrete syntax tree of your code, allowing the editor to understand "What is a function?" rather than just "What is this line?".
    *   *Powers*: Syntax Highlighting, Indentation, and Structural Selection.

## 2. Structural Editing
*   **[treesj](https://github.com/Wansmer/treesj)**:
    *   *Role*: Toggle Split/Join.
    *   *Action*: Turn a one-line object `{ a = 1, b = 2 }` into a multi-line block, and vice-versa.
    *   *Why*: Removes the manual labor of hitting Enter/Delete/Comma repeatedly.
*   **[nvim-surround](https://github.com/kylechui/nvim-surround)**:
    *   *Role*: Handle "Surroundings" (Parentheses, Brackets, Quotes, Tags).
    *   *Actions*: `ysiw"` (Add quotes), `ds"` (Delete quotes), `cs"{` (Change quotes to braces).
*   **[ultimate-autopair](https://github.com/altermo/ultimate-autopair.nvim)**:
    *   *Role*: Automatically closes brackets/quotes as you type.

## 3. Debugging
*   **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**:
    *   *Role*: The Debug Adapter Protocol client (like LSP but for Debugging).
*   **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)**:
    *   *Role*: Provides the UI (Watches, Stacks, Scopes, Breakpoints).
*   **[nvim-nio](https://github.com/nvim-neotest/nvim-nio)**:
    *   *Role*: Asynchronous IO library required by `nvim-dap-ui`.
