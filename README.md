# Synapse: The Cognitive Interface

> "The boundary between mind and medium should not exist."

## 1. The Vision

**Synapse** is not just a Neovim configuration; it is a **High-Level Cognitive Interface** designed for the manipulation of abstract concepts (text/code).

*   **The Problem**: Traditional editors force a translation layer: *Thought* -> *Command* -> *Action*. This breaks Flow.
*   **The Mission**: To establish a direct feedback loop between your neural intent and the state of the content to be edited.
*   **The Goal**: **Symbiosis**. To make the editor an extension of your own cognitive process, allowing you to manipulate text structure as intuitively as you manipulate ideas in your mind.

---

## 2. Experience & Usage Guide

### 2.1. Teleportation (Leap)
**"Visual Connection"**
Your eyes are the cursor. If you look at it, you are connected to it.
*   **Move**: `s` + two chars.
*   **Cross-Window**: `<leader>gs`.

### 2.2. Modal File Management (Oil)
**"The File System is Content"**
Directories are just another form of text to be manipulated.
*   **Open**: `<leader>oil` (Float).
*   **Edit**: Rename/Move by editing the buffer.

### 2.3. Structural Editing (Treesitter)
**"Semantic Manipulation"**
Edit the *Concept* (Function, Class), not the *Syntax* (Characters).
*   **Select**: `v` + `af` / `ic`.
*   **Split/Join**: `<leader>trt`.

---

## 3. The Mnemonic Keymap Reference

### `<leader>f` - Find (Telescope)
| Binding | Action |
| :--- | :--- |
| `ff` | Find Files |
| `fg` | Live Grep (Code) |
| `fb` | Buffers |
| `fc` | Colorscheme (Live Preview) |
| `fa` | All Pickers |

### `<leader>c` - Code / Config
| Binding | Action |
| :--- | :--- |
| `cr` | Reload Config |
| `crf` | Reload Current File |

### `<leader>o` - Open / Operations
| Binding | Action |
| :--- | :--- |
| `oil` | Edit Directory (Float) |
| `or` | Resume Last Directory |
| `od` | Open Dashboard |

### `<leader>l` - LSP (Language Server)
| Binding | Action |
| :--- | :--- |
| `lgd` | Go to Definition |
| `lgr` | References |
| `lrn` | Rename Symbol |
| `lca` | Code Action |
| `lft` | Format File |
| `ld` | Show Diagnostics (Float) |

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
| `qq` | Quit |
| `qa` | Quit All |

### Global Motion / Navigation
| Binding | Action |
| :--- | :--- |
| `s` / `S` | Leap (Teleport) |
| `]]` / `[[` | Next/Prev Class |
| 	`][` / `[]` | Next/Prev Class End |

---

## 4. Artificial Intelligence (Synapse AI)

Your cognitive interface is augmented by **GitHub Copilot** or **Codeium**, integrated directly into the editor. Based on your machine

### 4.1. Ghost Text (Autocompletion)
**"Anticipating Intent"**
As you type, the AI predicts your next thought.
*   **Trigger**: Automatic (Grey text overlay).
*   **Accept**: `<C-a>` (Control + A).
*   **Cycle**: `<Alt>+[` / `<Alt>+]` (Prev/Next).

### 4.2. Cognitive Chat (CodeCompanion Agent)
**"The Partner"**
A conversational interface to discuss logic, refactor code, or generate complex structures.
*   **Toggle Chat**: `<leader>a` (Space + A).
*   **Inline Assist**: `:CodeCompanion` (Select text -> Ask).
*   **Actions**: `<leader>cc` (Refactor/Explain menus).
