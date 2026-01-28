## 1. The Vision: Composition
**To create code in the same way you think about code.**
The goal is to bridge the gap between abstract thought and digital expression. You should be able to "compose ideas" and have the frameworks to express those ideas generally, without fighting the tool.

### 1.1. The Philosophy: Symbiosis
*   **Immediacy**: Zero latency between *Thought* (composition) and *Expression* (code).
*   **Fluidity**: The editor follows your mental state, not the other way around.
*   **Abstraction**: Manipulating concepts (functions, classes, ideas), not just characters.

### 1.2. The Methodology: Cognitive Mapping
*   **Navigation**: Teleport to where you are looking (Leap).
*   **Context**: Hold your working set in "short-term memory" (Harpoon - *Planned*).
*   **Recall**: Retrieve any file or string instantly (Telescope).

---

## 2. The Experience (Current State)

### 2.1. Teleportation (Leap)
**"Visual Connection"**
Your eyes are the cursor. If you look at it, you are connected to it.
*   **Move**: `<leader>s` / `<leader>S` (Forward/Backward).
*   **Cross-Window**: `<leader>gs`.

### 2.2. Modal File Management (Oil)
**"The File System is Content"**
Directories are just another form of text to be manipulated.
*   **Open**: `<leader>ee` (Float).
*   **Edit Current**: `<leader>er`.

### 2.3. Structural Editing (Treesitter)
**"Semantic Manipulation"**
Edit the *Concept* (Function, Class), not the *Syntax* (Characters).
*   **Select**: `v` + `af` / `ic`.
*   **Split/Join**: `<leader>trt`.

---

## 3. The Roadmap: Towards "Fun, Fast, Better"

We are evolving Synapse to be more "fun" (Joyful), "fast" (Efficient), and "better" (Intelligent).

### 3.1. Phase 1: Friction Removal (Immediate)
*   **Fix Latency**: Tune `timeoutlen` to make keymaps snappy (Currently too high).
*   **Smart Folds**: Improve folding release (currently `foldclose=all` might be aggressive).
*   **Theme Joy**: Explore "warm" or "high-contrast" themes to reduce eye strain and induce "hacker joy".

### 3.2. Phase 2: Spatial & Mental Tools (Short Term)
*   **Harpoon Integration**: Mark frequently visited files to jump between them without "searching". (Reduces mental stack).
*   **Hydra Modes**: "Sticky" keymaps for repetitive tasks (e.g., resizing windows, git hunks) to save keystrokes.
*   **Flash.nvim**: Upgrade from Leap? Flash offers "jump scenes" which might be faster for some users.

### 3.3. Phase 3: The Neural Link (Long Term)
*   **Context Agents**: Use MCP (Model Context Protocol) to give the AI generic access to your *intent*, not just your file.
*   **Generative UI**: Allow the AI to draw diagrams or generate ephemeral UIs for specific tasks.
*   **Gamified Mastery**: A system to track your "APM" (Actions Per Minute) or "Flow State duration" to encourage mastery.

---

## 4. The Mnemonic Keymap Reference

### `<leader>f` - Find (Telescope)
| Binding | Action |
| :--- | :--- |
| `ff` | Find Files |
| `fg` | Live Grep (Code) |
| `fb` | Buffers |
| `fc` | Colorscheme (Live Preview) |
| `fk` | Keymaps |
| `fh` | Fuzzy Find in Buffer |
| `fa` | All Pickers |

### `<leader>c` - Code / Config
| Binding | Action |
| :--- | :--- |
| `cr` | Reload Config |
| `crf` | Reload Current File |

### `<leader>o` - Operations
| Binding | Action |
| :--- | :--- |
| `ee` | Edit Directory (Float) |
| `er` | Edit Current Directory |

### `<leader>l` - LSP (Language Server)
| Binding | Action |
| :--- | :--- |
| `lgd` | Go to Definition |
| `lgD` | Go to Declaration |
| `lgi` | Go to Implementation |
| `lgr` | References |
| `lrn` | Rename Symbol |
| `lca` | Code Action |
| `lft` | Format File |
| `lh` | Hover Documentation |
| `ld` | Show Diagnostics (Float) |
| `<C-S>` | Signature Help (Insert Mode) |

### `<leader>t` - Treesitter / Editing
| Binding | Action |
| :--- | :--- |
| `trt` | Toggle Split/Join |
| `trs` | Split Block |
| `trj` | Join Block |

### `<leader>w` - Window
| Binding | Action |
| :--- | :--- |
| `w` | Save File |
| `wq` | Save & Quit |
| `ya` | Yank Whole File |
| `qq` | Quit |
| `qa` | Quit All |

### Global Motion / Navigation
| Binding | Action |
| :--- | :--- |
| `<leader>s` / `<leader>S` | Leap (Forward/Backward) |
| `]]` / `[[` | Next/Prev Class |
| 	`][` / `[]` | Next/Prev Class End |

### Artificial Intelligence
| Binding | Action |
| :--- | :--- |
| `<leader>a` | Toggle Chat |
| `<C-a>` | Accept Ghost Text |
| `<C-]>` | Dismiss Ghost Text |
| `<leader>cc` | AI Actions Menu |
