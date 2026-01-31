# Mini.nvim vs The World

This document evaluates specific `mini` modules against your current or potential stack.

## 1. Completion: Blink.cmp vs Mini.completion + Mini.snippets

### The Contenders
*   **`blink.cmp`**: Rust-based (blazingly fast), native LSP integration, native snippets, fuzzy matching. It is the sophisticated choice for "Symbiosis" (zero latency).
*   **`mini.completion`**: Pure Lua, lightweight, simpler features. Good, but not "state-of-the-art" speed for massive codebases compared to Blink.
*   **`mini.snippets`**: A snippet engine.

### Verdict
**Keep Blink.cmp**.
*   **Why?**: You want "Zero Latency". Blink is built for that. `mini.completion` is great for distinct "lightweight" setups, but you are building a "Cognitive Interface" that needs to handle AI, LSP, and heavy completions instantly.

## 2. Git: Fugitive vs Mini.git

### The Contenders
*   **`vim-fugitive`**: The "Git God". Commands like `:Gwc`, `:G blame` are industry standards. Handles complex merges, worktrees, and obscure git commands flawlessly.
*   **`mini.git`**: A Lua wrapper for Git. Clean integration, but less "battle-tested" for deep git wizardry.

### Verdict
**Keep Fugitive**.
*   **Why?**: Fugitive *is* Git inside Vim. `mini.git` is nice, but if you need to do serious version control operations (interactive rebase, partial staging, complex diffs), Fugitive remains unbeaten.

## 3. Package Management: Lazy.nvim vs Mini.deps

### The Contenders
*   **`lazy.nvim`**: Parallel downloading, lockfiles, advanced profiling, UI for updates, lazy-loading logic is impeccable.
*   **`mini.deps`**: Simpler. Uses Git CLI.

### Verdict
**Keep Lazy.nvim**.
*   **Why?**: Lazy.nvim is the gold standard. It allows you to debug startup time (Symbiosis requires fast startup), manage versions effectively, and has a rich UI. `mini.deps` is for minimalists who don't want a UI.

## 4. Buffer Management: Why Mini.bufremove?

### The Problem
In standard Vim, `:q` or `:bd` often closes the *window* (split) along with the buffer, ruining your layout.

### The Solution
*   **`mini.bufremove`**: It deletes the buffer from memory but *keeps the window open* (switching to an alternate buffer or [No Name]).
*   **Value**: It preserves your "Spatial Layout". If you have a 3-column split and close the middle file, `mini.bufremove` ensures you still have a 3-column split, just with an empty middle.

## 5. Treesitter Context (Status Check)

*   **Plugin**: `nvim-treesitter-context`.
*   **Status**: Listed in dependency of `treesitter.lua` but currently using **Default Configuration**.
*   **Action Needed**: We can explicitly configure it to refine behavior (max lines, trim, mode).

## 6. Aerial vs Outline
(Covered in EVALUATIONS.md, but reiterated)
*   **Aerial**: Better data structure view, integrates with Telescope/Lualine.
*   **Recommendation**: Install `aerial.nvim`.
