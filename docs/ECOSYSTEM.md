# The Ecosystem: Plugin Architecture

The configuration organizes plugins not by function name, but by **Cognitive Role**.

## 1. The Physics Engine (Core & UI)
*Role*: Defines the laws of the universe (colors, shapes, windows).
*   **`rktjmp/lush.nvim`**: The engine for color creation.
*   **`RRethy/base16-nvim`**: The palette application.
    *   *Diagnostic*: **Conflict Detected**. `options.lua` sets `background = "dark"`, but `ui-ux.lua` applies `base16-grayscale-light`. This creates a schism between the editor's internal flag and its visual reality.
    *   *Recommendation*: Align them. If using light mode, set `vim.opt.background = "light"`.
*   **`folke/noice.nvim`**: The "Atmosphere". Smooths out the rough edges of command lines and messages using specific UI overrides.

## 2. Navigation & Motion (Spatial Tools)
*Role*: Movement through the codebase.
*   **`ThePrimeagen/harpoon` (v2)**: **Critical**. Implements the "Working Set" memory.
    *   *Assessment*: Correctly configured with `<leader>h[1-5]`. Essential for the "No-Buffer" paradigm.
*   **`andyg/leap.nvim`**: **Critical**. Implements "Teleportation".
    *   *Assessment*: High-value tool. Replaces the O(n) scan of `f/t` with O(1) direct targeting.
*   **`nvim-telescope/telescope.nvim`**: **Critical**. Implements "Recall" (Long-term memory search).
    *   *Assessment*: Good vertical layout. `fzf-native` ensures speed.
*   **`stevearc/oil.nvim`**: **Critical**. Implements "Filesystem as Content".
    *   *Assessment*: Replaces sidebar explorers (NvimTree) with a buffer-based approach, maintaining the modal editing philosophy even for file ops.

## 3. Intellect (The Cortex)
*Role*: Reasoning, understanding, and generation.
*   **`olimorris/codecompanion.nvim`**: The AI Agent.
    *   *Assessment*: Highly advanced configuration. Using `copilot` adapter implies a reliance on GitHub's model access. The custom highlights for diffs show a dedication to visual clarity in AI interactions.
*   **`zbirenbaum/copilot.lua`**: The Autocomplete Reflex.
    *   *Assessment*: configured for ghost text.

## 4. Manipulation (The Hands)
*Role*: Modifying the structure of the code.
*   **`nvim-treesitter`**: The Parser. Understands the AST.
    *   *Assessment*: Extensive ensure_installed list. Textobjects configured for function/class selection (`af`, `ic`).
*   **`Wansmer/treesj`**: Structural Toggle.
    *   *Assessment*: Perfect for splitting/joining arrays or dicts without manual formatting.
*   **`kylechui/nvim-surround`**: Wrapping physics.
    *   *Assessment*: Essential for editing quotes/brackets.

## 5. Temporal (Git)
*Role*: Time travel.
*   **`tpope/vim-fugitive`**: The classic.
*   **`lewis6991/gitsigns.nvim`**: Margin indicators.

---

## 6. Gap Analysis
1.  **LSP Integration**: While `lsp.lua` exists (file size ~5KB), we haven't detailed its contents in the docs. The `README` mentions comprehensive `<leader>l` maps. Assuming they exist, the stack is solid.
2.  **Status Line**: `lualine` is present but looks "default".
    *   *Opportunity*: Customize Lualine to show "Harpoon State" or "AI Status".
3.  **Dashboard**: `dashboard.lua` exists but wasn't deep-dived. A good dashboard anchors the start of the session.
