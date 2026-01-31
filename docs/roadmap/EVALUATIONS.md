# Plugin Evaluations & Strategic Decisions

This document analyzes specific plugin choices to refine the Synapse configuration.

## 1. The AI Cortex: Avante vs. CodeCompanion

### Comparison
| Feature | **Avante.nvim** | **CodeCompanion** |
| :--- | :--- | :--- |
| **Philosophy** | "Cursor-like" experience. Deep integration with the editor UI. | Agentic Tool Use. A platform for AI efficiency. |
| **Strengths** | Extremely polished UI. "Apply" feature is often smoother. Feels like a native app. | **Tools**. Can run terminal commands, read files, and chain thoughts. Flexible adapters (Ollama, Anthropic, etc). |
| **Weaknesses** | Less "Agentic" (cannot autonomous fix the filesystem as easily). | UI is slightly more utilitarian (though you have customized it well). |

### Recommendation
*   **Keep CodeCompanion** if your goal is *Symbiosis* and *Agentic capabilities* (e.g., "Fix the tests in this folder").
*   **Switch to Avante** if your goal is purely *Code Generation* and *Refactoring* with a slick interface and you don't care about the AI running terminal commands for you.
*   **Verdict**: **CodeCompanion** serves the "Cognitive Interface" vision better because of its tool use. Avante is just a really good chat.
*   **Persistence**: For CodeCompanion, sessions can be saved using the `save_chat` action or by configuring the adapter to persist history to a file (requires custom config).

## 2. Visual Media & UI

### Render-markdown, Image.nvim, Nui
*   **The Vision**: You want to preview assets without leaving the "Code" mindset.
*   **The Stack**:
    *   **`render-markdown.nvim`**: **Essential**. Replaces `headlines.nvim` or legacy tools. Renders bullet points, tables, and callouts beautifully in the buffer.
    *   **`image.nvim`**: **Essential** for the "Media" layer. It enables actual image rendering in Neovim (via Kitty/Uberzug/Sixel).
        *   *Integration*: It works out of the box with `markdown`.
        *   *Popup Workflow*: You can use `nui.nvim` to create a custom "Preview" command that, when hovering an image path string, opens a popup containing the rendered image. This requires custom Lua glue code.

### UI Polish
*   **`twilight.nvim`**: **Install**. "Zen Mode" for code. Dims inactive blocks. Excellent for flow state.
*   **`indent-blankline.nvim`**: **Keep**. Essential for scope context.
*   **`rainbow-delimiters`**: **Install**. Reduces cognitive load matching parens.
*   **`colorizer`**: **Install**. `NvChad/nvim-colorizer.lua` is the fastest.
*   **`dressing.nvim`**: **Install**. Upgrades `vim.ui.select` and `vim.ui.input` to use `telescope` or nicely styled floats. Makes the whole editor feel premium.
*   **`nvim-notify` / `nui.nvim`**:
    *   *Pro Config*: You already use `noice.nvim` which wraps these. To go "Pro", disable Noice's default routes and create custom "min-width", "transparency", and "animation" styles in `nvim-notify`.

## 3. The "Mini" Revolution

**`mini.nvim`** is a library of independent modules. It can replace a massive amount of bloat.

### Replacement Table
| Current Plugin | Mini Replacement | Trade-off |
| :--- | :--- | :--- |
| `nvim-surround` | `mini.surround` | Mini is slightly less "vim-surround" compliant but powerful. |
| `ultimate-autopair` | `mini.pairs` | `mini.pairs` is simpler. `ultimate` has better "inhibit" logic (e.g. don't pair if next char is text). |
| `vim-commentary` | `mini.comment` | Seamless replacement. |
| `indent-blankline` | `mini.indentscope` | Indentscope focuses on *current* pair animations. |
| `vim-startify` / `alpha` | `mini.starter` | Minimal, fast dashboard. |
| `cursorword` | `mini.cursorword` | Simple highlighting of word under cursor. |
| `bdelete` | `mini.bufremove` | Safe buffer closing. |
| `nvim-tree` / `oil` | `mini.files` | **Controversial**. `mini.files` is a column view (Miller columns) like Finder. `oil` is a buffer view. *Keep Oil* for your philosophy. |

### Recommendation
*   **Install `mini.nvim`**.
*   Start by replacing low-risk utilities: `comment`, `bufremove`, `cursorword`.
*   **Autopairs**: Stick with `ultimate-autopair`. You specifically asked about "not generating a pair". `ultimate` has better configuration for this (`cond` function). `mini.pairs` is very basic.

## 4. Motion & Editing

### Flash.nvim vs Leap
*   **Leap**: "I see it, I go there." (2 chars). Direct connection.
*   **Flash**: "I search, then I jump." Label-based navigation.
    *   *Pros*: Omnidirectional, works with search, standardizes "jumping".
    *   *Cons*: Can feel more "noisy" with labels everywhere.
    *   *Verdict*: **Stick with Leap** for now. It aligns with "Symbiosis". Flash is more "Gamified".

### Text Manipulation
*   **`spider`**: **Install**. Enhances `w`, `e`, `b` to handle CamelCase and snake_case sub-words. Critical for coding navigation.
*   **`dial.nvim`**: **Install**. Smart increment/decrement. Date toggling, boolean toggling (`true` -> `false`).
*   **`yanky.nvim`**: **Install**. "Clipboard Manager" for Neovim. Cycle through yank history with `p` / `<C-p>` / `<C-n>`.
*   **`substitute.nvim`**: **Install**. Adds a "Swap" operator. `s{motion}` swaps the yanked text with the motion. High value.

## 5. Version Control Ecosystem

### The Showdown
*   **`vim-fugitive`**: The God-Tier Git wrapper. **Keep**. Nothing beats `:Git blame` and `:Gwrite`.
*   **`gitsigns.nvim`**: The God-Tier Gutter wrapper. **Keep**. Interactive hunk management.
*   **`neogit`**: A "Magit" clone. Great for commit composition (staging individual lines visually).
    *   *Verdict*: Use **Fugitive + Gitsigns** as the base. Add **Neogit** ONLY if you prefer a TUI for committing over `:Git commit`.
*   **`git-worktree.nvim`**: Specialized. Only needed if you use bare repos/worktrees. (Cognitive load is high if you don't).
*   **`octo.nvim`**: GitHub focused. View PRs/Issues.
    *   *Verdict*: Install if you review PRs inside Neovim.

### Diffing
*   **`diffview.nvim`**: **Install**. It provides a dedicated "Merge Tool" UI and file history explorer that is vastly superior to Fugitive's split diffs for complex merges.
*   *Strategy*: Fugitive for commands, Gitsigns for hunks, Diffview for Code Review.

## 6. Code Intelligence

### Structure
*   **`aerial.nvim`** vs **`outline.nvim`**:
    *   **Aerial**: Better integration with Telescope and Lualine. Prioritizes rigid structure.
    *   **Outline**: More "VSCode-like" sidebar.
    *   *Verdict*: **Aerial**. It fits the "Data" mindset and integrates into your statusline.

### Context
*   **`nvim-treesitter-context`**: Shows the function signature at the top when scrolling.
    *   *Status*: You have it installed.
    *   *vs `lsp_lines.nvim`*: `lsp_lines` shows *virtual text diagnostics* on new lines. They are unrelated.
    *   *Recommendation*: Keep `treesitter-context` for reading flow. Be careful with `lsp_lines`; it can clutter the view.

### Snippets
*   **`luasnip`** vs **`blink.cmp`**:
    *   `blink.cmp` has a built-in snippet engine. It parses VSCode-style snippets natively.
    *   *Verdict*: **Drop Luasnip**. Use Blink's native capabilities to reduce complexity.

## 7. Workflow & Testing

*   **`overseer.nvim`**: A task runner (like VSCode tasks).
    *   *Pros*: Good for complex build pipelines (C++, Rust).
    *   *Cons*: Overkill for interpreted languages (JS, Py, Lua) where `:!node %` suffices.
*   **`neotest`**: **Install**. A unified testing UI.
    *   *Benefit*: Run individual tests, debug tests (dap integration), watch mode. Transforms testing from "Batch" to "Interactive".
*   **`undotree`**: **Install**. Visualizes the undo history as a tree. Essential for recovering lost states.
