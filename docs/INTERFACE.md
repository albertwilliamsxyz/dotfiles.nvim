# The Concrete Interface: Structure & Workflows

## 1. The Hierarchy of Control

The interface is built on a strict hierarchy of access, originating from the **Leader Key (`<Space>`)**.

| Level | Input | Scope | Example |
| :--- | :--- | :--- | :--- |
| **0. Instant** | `<char>` | Immediate, Modal | `h`, `j`, `k`, `l`, `v`, `i` |
| **1. Reflex** | `<C-char>` | High-Frequency, Non-Modal | `<C-h/j/k/l>` (Window), `<C-1/2/3/4>` (Harpoon) |
| **2. Command** | `<Space>` + `<char>` | Intentional Actions | `<Space>f` (Find), `<Space>w` (Save) |
| **3. Deep** | `<Space>` + `<char>` + `<char>` | Specific Operations | `<Space>lgd` (LSP Goto Def), `<Space>cca` (CodeCompanion Actions) |

## 2. Core Workflows

### A. The "Working Set" Flow (Harpoon)
*Concept*: You are working on a feature touching 3 files: `Model`, `View`, `Controller`.
1.  **Pin**: Open each file -> `<leader>ha`.
2.  **Context**: You are in `View`. Need to check `Model`? -> `<leader>h1` (assuming Model is 1).
-- *Wait, I forgot what property X is.*
3.  **Reflex**: `<leader>h1` -> Glance -> `<leader>h2` (Back to View).
-- *Contrast with Buffers*: `bp`, `bn` (blind cycling) or `:b Model` (typing). Harpoon is O(1).

### B. The "Teleportation" Flow (Leap)
*Concept*: You see a typo on line 45, character 10. You are on line 20.
*Old Way*: `25j` -> `10l` (or some combination of `}` and `w`).
*New Way*:
1.  **Sight**: Look at the character.
2.  **Trigger**: Press `s`.
3.  **Target**: Type the two chars you see (e.g., `fn`).
4.  **Arrival**: If unique, you are there. If duplicates, press the label (e.g., `a`).
*Result*: Your eyes never left the target. The cursor caught up to your vision.

### C. The "Synthetic" Flow (AI)
*Concept*: You need to refactor a function but are feeling lazy/uninspired.
1.  **Select**: Visual mode select the function.
2.  **Trigger**: `<leader>ccc` (Chat) or `<leader>cca` (Actions).
3.  **Instruction**: "Refactor this to use specific types."
4.  **Review**: See changes in Green/Red Diff.
5.  **Accept**: Apply.

## 3. Configuration Analysis: Keymap Reality

### Discrepancies & Diagnostics
*   **<leader>w vs <leader>q**:
    *   `keymaps.lua` defines `<leader>qq` (Quit Win) and `<leader>qw` (Save & Quit).
    *   `keymaps.lua` also defines `<leader>w` (Save).
    *   *Critique*: Good consistency. `q` is the "Exit" namespace. `w` is the "Write" namespace.
*   **LSP Namespacing**:
    *   `README` claims `<leader>l` namespace (`lgd`, `lca`).
    *   *Check*: This needs verification in `lsp.lua` (we haven't deeply audited `lsp.lua` mappings yet, but assumed they exist).
    *   *Recommendation*: Ensure `lsp.lua` maps exactly to `<leader>l...`.
*   **Treesitter**:
    *   `treesitter.lua` defines incremental selection on `<leader>t...`.
    *   `editing.lua` (TreesJ) uses `<leader>tr...`.
    *   *Consistency*: High. The `t` namespace is effectively "Tree/Structure".

## 4. Option Settings (The Physics)
*   **`timeoutlen = 500`**: Defines the "reflex window". 500ms is a balanced choice allowing for compound chords without feeling sluggish.
*   **`autowrite = false`**: Manual control. Safe, but perhaps antiquated.
    *   *Challenge*: Consider `autowrite = true` or `autosave.nvim` for "Thought Speed" (removing the need to `<leader>w`).
*   **`scrolloff = 2`**: Keeps context above/below cursor.
    *   *Recommendation*: Increase to `8` or `999` (Center) for better vertical context awareness.
