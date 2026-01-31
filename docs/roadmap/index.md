# The Roadmap: Diagnostics & Evolution

## 1. Diagnostic Report

### Critical Findings
*   **[CONFLICT] Visual Schism**:
    *   `lua/config/options.lua`: Sets `vim.opt.background = "dark"`.
    *   `lua/plugins/ui-ux.lua`: Sets `vim.cmd.colorscheme("base16-grayscale-light")`.
    *   *Result*: Neovim may render UI elements (like borders or floats) assuming a dark background while the content is light, potentially causing contrast issues or illegible text.
    *   *Fix*: Standardize on one mode. If Light Mode is the goal, update `options.lua`.

*   **[GAP] Hydra / Sub-modes**:
    *   The `README.md` mentions "Hydra Modes" as a Phase 2 goal.
    *   *Status*: **Missing**. No implementation found.
    *   *Impact*: Operations like window resizing or git hunks still require repeated key presses (`<C-w>>`, `<C-w>>`) instead of a sticky mode.

*   **[RISK] AI Configuration Complexity**:
    *   `lua/plugins/ai.lua` contains ~30 lines of manual highlight group definitions.
    *   *Risk*: If the colorscheme changes (especially switching between light/dark), these hardcoded hex values (`#116611`, `#d0f0d0`) will likely break or look terrible.
    *   *Fix*: Link these to standard highlight groups (`DiffAdd`, `DiffDelete`) or use `TelescopeNormal` style links instead of hard references.

## 2. Strategic Next Steps

### Phase 1: Consistency (The Polish)
1.  **Resolve the Dark/Light War**: Decide on the theme. Update `options.lua`.
2.  **Harmonize Keymaps**:
    *   Ensure `<leader>qa` (Quit All) and `<leader>w` (Save) are favored over legacy `:wq`.
    *   Audit `lsp.lua` (assumed based on README) to ensure it strictly follows the `<leader>l` mnemonic.

### Phase 2: The Cognitive Layer (The Expansion)
1.  **Implement Sticky Modes (Hydra)**:
    *   Create a "Window Mode": Enter with `<leader>w`. Keys `h/j/k/l` resize. `q` exits.
    *   Create a "Git Mode": Enter with `<leader>g`. Keys `j/k` traverse hunks. `s` stages.
2.  **Refine the status line**:
    *   Update `lualine` to show **Harpoon Status**. Knowing "File 2 is main.go" at a glance reinforces the mental map.
3.  **Dashboard Evolution**:
    *   `lua/plugins/dashboard.lua`: Improve `alpha-nvim` to allow immediate jump to Harpoon or recent project sessions.

### Phase 3: The Neural Link (The Future)
1.  **Context Agents**:
    *   You have `agentic_chain` enabled. The next step is **Tool Creation**.
    *   Write a custom MCP tool or Lua function that allows the AI to "Run Tests" or "Check Browser".
2.  **Generative UI**:
    *   Consider `nui.nvim` to let the AI render ephemeral choices. E.g., "I found 3 ways to refactor this. Choose one: [ A | B | C ]".
