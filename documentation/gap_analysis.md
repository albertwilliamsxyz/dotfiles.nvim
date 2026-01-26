# Gap Analysis: v3/v4 vs v7-Foundation

This document outlines powerful features found in your previous branches (`v3`, `v4`) that are currently **missing** from your new `v7-foundation`.

## 🚨 Critical Gaps (High Impact)

### 1. Debugging (DAP)
*   **Status**: ❌ Missing in v7.
*   **Found in**: v3, v4.
*   **Details**: You had a full `nvim-dap` setup with `nvim-dap-ui` and `mason-nvim-dap`.
*   **Specifics**: You had a custom configuration for **Chrome Debugging** (`chrome-debug-adapter`), which is essential for your web development workflow.

### 2. Structural Editing (Treesitter Textobjects)
*   **Status**: ❌ Missing in v7.
*   **Found in**: v4.
*   **Details**: v7 has syntax highlighting, but v4 had the **Textobjects** module.
*   **Missed Features**:
    *   `af`/`if`: Select function outer/inner.
    *   `<leader>mp`: Swap parameters (argument switching).
    *   `]f`: Jump to next function.

### 3. Formatting & Linting
*   **Status**: ⚠️ Partial/Different in v7.
*   **Found in**: v3, v4 (`none-ls`).
*   **Details**: v4 enforced `eslint_d` and `stylua` installation. v7 currently relies only on LSP for diagnostics. You might miss the speed and specific rules of `eslint_d`.

## 🛠️ Nice-to-Have Gaps

### 4. Emmet (HTML Expansion)
*   **Status**: ❌ Missing in v7.
*   **Found in**: v4 (`emmet_language_server`).
*   **Details**: Critical for fast HTML/CSS coding.

### 5. Telescope Enhancements
*   **Status**: ⚠️ Basic in v7.
*   **Found in**: v3.
*   **Details**: v3 used `telescope-fzf-native` (faster sorting) and `telescope-ui-select` (better UI for code actions).

---

## 📋 Action Plan for v7 (Phase 4?)

To reach "Feature Parity" with your best previous setup, we should apply these "Legacy Upgrades":

1.  **[ ] Restore DAP**: Copy the `dap.lua` config, updated for `lazy.nvim`.
2.  **[ ] Upgrade Treesitter**: Add `nvim-treesitter-textobjects` dependency to `treesitter.lua`.
3.  **[ ] Add Conform/Lint**: Implement `stevearc/conform.nvim` (modern `none-ls` replacement) to handle `eslint_d` and `prettier`.
4.  **[ ] Add Emmet**: Add `emmet_language_server` to `lsp.lua` (via Mason).
