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

---

## 5. The Art of Context (Harpoon)
Harpoon is your **Short-Term Memory**. Unlike buffers (History), Harpoon is for the **Working Set**.

### Essential Keymaps
*   `<leader>a`: **Append** file to Harpoon (Pin it).
*   `<C-e>`: **Edit** the list (Quick Menu).
*   `<C-1>` / `<C-2>` / `<C-3>` / `<C-4>`: **Jump** to file 1-4 instantly.

### 10 Tips for Effective Usage
1.  **The "Rule of 4"**: Only pin 4 files max. If you need 5, you are doing too much at once.
2.  **Mental Mapping**: Bind the slot to the mental concept. File 1 = Interface, File 2 = Implementation, File 3 = Tests. Always.
3.  **Muscle Memory**: Stop reading filenames. Train your fingers to know that `<C-1>` is *The Model*.
4.  **Clear Often**: When the task is done, clear the list. Start fresh. Do not let Harpoon become a dusty backlog.
5.  **The "Anchor"**: Keep one file (usually Main or Config) always in Slot 1. It grounds you.
6.  **Context Switching**: Use Harpoon to switch contexts entirely. Working on Backend? Pin those 3 files. Switch to Frontend? Clear and pin the UI components.
7.  **No Searching**: If you are searching (`<leader>ff`) for the same file twice in 5 minutes, you have failed. Harpoon it.
8.  **The Toggle**: Use `<C-e>` to visualize your mental stack. If it looks cluttered, your mind is cluttered.
9.  **Project Hopping**: Harpoon lists are per-project. Trust that when you return to a project, your "mind" is exactly where you left it.
10. **Flow State**: The goal is to move at the speed of thought. "I need to check the test" -> `<C-3>`. No "Check test" -> "Search file" -> "Type name" -> "Enter".
