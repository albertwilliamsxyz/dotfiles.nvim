# Synapse v1.0

> *"A mechanism to manipulate software with the same ease as manipulating ideas"*

## Theoretical Framework

### The Platonic Interface

Programming is fundamentally the process of **translating ideas from the ideal realm into an executable representation**. This configuration embodies a Platonic approach where:

1. **Ideas exist first** — The mental model precedes the code
2. **Code is merely representation** — Syntax is a shadow of the underlying concept
3. **The editor must vanish** — The interface should be transparent, not a barrier

The goal is simple: **reduce the friction between cognition and implementation** until the two become nearly indistinguishable.

### The Bottleneck Principle

In this paradigm, domain knowledge (understanding *what* to build) is the true bottleneck—not the mechanical act of typing. Therefore:

- Keymaps are designed around **semantic concepts** (functions, parameters, classes)
- Navigation operates at the **idea level**, not the character level
- Editing commands express **intentions**, not cursor movements

### Idea-First Grammar

Commands follow a semantic grammar where you express your intent in terms of the **ideas you're manipulating**:

```
[Verb] + [Concept]

Examples:
- "change function"      → cif (change inner function)
- "delete parameter"     → dap (delete around parameter)  
- "select class"         → vac (visual around class)
- "next function"        → ]f  (jump to next function)
- "swap parameter"       → <leader>mp (move parameter forward)
```

The vocabulary mirrors thought, not keystrokes.

---

## Architecture

```
~/.config/nvim/
├── init.lua                 # Bootstrap: loads config then plugins
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # Plugin manager initialization
│   │   ├── options.lua      # Editor behavior & aesthetics
│   │   ├── keymaps.lua      # Core keymaps (leader = Space)
│   │   └── autocmds.lua     # Automatic behaviors
│   └── plugins/
│       ├── ai.lua           # AI symbiosis (Copilot, CodeCompanion)
│       ├── completion.lua   # Semantic completion (blink.cmp)
│       ├── dashboard.lua    # Entry point (Alpha)
│       ├── debugger.lua     # Debugging interface (DAP)
│       ├── editing.lua      # Text manipulation primitives
│       ├── file-manager.lua # File navigation
│       ├── formatting.lua   # Code formatting (Conform)
│       ├── fuzzy-finder.lua # Conceptual search (Telescope)
│       ├── git.lua          # Version control interface
│       ├── harpoon.lua      # Working set navigation
│       ├── lsp.lua          # Language intelligence
│       ├── markdown.lua     # Documentation rendering
│       ├── motion.lua       # Spatial navigation (Leap, Spider)
│       ├── treesitter.lua   # Structural understanding
│       └── ui-ux.lua        # Visual interface
```

---

## Semantic Keymaps

### Idea Objects (Text Objects via Treesitter)

These allow you to operate on **concepts**, not characters:

| Object | Meaning | Usage Example |
|--------|---------|---------------|
| `af` / `if` | Function (around/inner) | `daf` = delete function, `cif` = change function body |
| `ac` / `ic` | Class | `vac` = select entire class |
| `ab` / `ib` | Block | `dib` = delete block contents |
| `ap` / `ip` | Parameter | `cap` = change parameter |
| `aa` / `ia` | Assignment | `dia` = delete assignment value |
| `ar` / `ir` | Return statement | `var` = select return |
| `as` | Statement | `das` = delete statement |
| `lhsa` / `rhsa` | Assignment LHS/RHS | Select left or right side of `=` |

### Idea Navigation (Structural Movement)

Jump between ideas, not lines:

| Keymap | Target | Description |
|--------|--------|-------------|
| `]f` / `[f` | Function | Next/previous function |
| `]c` / `[c` | Class | Next/previous class |
| `]b` / `[b` | Block | Next/previous block |
| `]p` / `[p` | Parameter | Next/previous parameter |
| `]r` / `[r` | Return | Next/previous return |
| `]s` / `[s` | Statement | Next/previous statement |
| `;` / `,` | Repeat | Repeat last movement forward/backward |

### Idea Manipulation (Swap & Transform)

Rearrange ideas with a single command:

| Keymap | Action |
|--------|--------|
| `<leader>mp` / `<leader>mP` | Move parameter right/left |
| `<leader>mf` / `<leader>mF` | Move function right/left |
| `<leader>mb` / `<leader>mB` | Move block right/left |
| `<leader>ms` / `<leader>mS` | Move statement right/left |
| `<leader>trt` | Toggle split/join node |
| `<leader>trs` | Split node into multiple lines |
| `<leader>trj` | Join node into single line |

### Spatial Navigation (Leap & Spider)

Move through space with precision:

| Keymap | Action |
|--------|--------|
| `<leader>s` | Leap forward to any visible character pair |
| `<leader>S` | Leap backward |
| `<leader>gs` | Leap across all windows |
| `w` / `e` / `b` | Smart word motion (respects CamelCase, snake_case) |
| `f` / `F` / `t` / `T` | Enhanced character search (repeatable with `;`) |

### Knowledge Navigation (Telescope)

Search your codebase semantically:

| Keymap | Action |
|--------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search content) |
| `<leader>fb` | Browse open buffers |
| `<leader>fh` | Fuzzy find in current buffer |
| `<leader>fk` | Search keymaps |
| `<leader>fc` | Preview colorschemes |

### Working Set (Harpoon)

Mark and navigate your active mental context:

| Keymap | Action |
|--------|--------|
| `<leader>ha` | Add file to working set |
| `<leader>hh` | Show working set |
| `<leader>h1-5` | Jump to file 1-5 |
| `<leader>hp` / `<leader>hn` | Previous/next in working set |
| `<leader>hc` | Clear working set |

### Language Intelligence (LSP)

Understand and refactor code semantically:

| Keymap | Action |
|--------|--------|
| `<leader>lgd` | Go to definition |
| `<leader>lgD` | Go to declaration |
| `<leader>lgi` | Go to implementation |
| `<leader>lgr` | Find references |
| `<leader>lrn` | Rename symbol |
| `<leader>lca` | Code actions |
| `<leader>lh` | Hover documentation |
| `<leader>ld` | Show diagnostics |
| `<C-S>` (insert) | Signature help |

### AI Symbiosis

Collaborative intelligence:

| Keymap | Action |
|--------|--------|
| `<leader>ccc` | Toggle AI chat |
| `<leader>cca` | AI actions menu |
| `<C-a>` (insert) | Accept Copilot suggestion |
| `<M-]>` / `<M-[>` | Next/previous Copilot suggestion |

### Version Control (Git)

Track the evolution of ideas:

| Keymap | Action |
|--------|--------|
| `<leader>gb` | Git blame |
| `<leader>gd` | Open diff view |
| `<leader>gh` | File history (current) |
| `<leader>gH` | File history (repo) |
| `<leader>gq` | Close diff view |

### Editor Control

Meta-operations:

| Keymap | Action |
|--------|--------|
| `<leader>w` | Save file |
| `<leader>qq` | Quit window |
| `<leader>qa` | Quit all |
| `<leader>u` | Toggle undo tree |
| `<leader>ya` | Yank entire file |
| `<leader>zm` | Toggle focus mode (Twilight) |

---

## Evolutionary Roadmap

This configuration exists to evolve. Future potential directions (for a more evolved version):

1. **Voice Integration** — Dictating ideas directly into code
2. **Gesture Recognition** — Spatial manipulation of code structures
3. **Predictive Intent** — AI that anticipates the next transformation
4. **Semantic Refactoring** — "Extract concept" as a first-class operation
5. **Multi-modal Editing** — Seamlessly combining text, diagrams, and code

---

## Philosophy

> *"The programmer who can manipulate software with the same fluidity as thought has achieved the ultimate interface: none at all."*

This configuration is not about memorizing keymaps. It's about building **muscle memory for ideas**. Over time, the barrier between thinking and coding dissolves—you stop translating and start expressing.

The commands here are designed to match how you *think* about code:
- You don't think "move cursor to line 47, delete 3 words"
- You think "delete this parameter" → `dap`
- You think "change this function's implementation" → `cif`
- You think "move this function after the next one" → `<leader>mf`

When your editor understands ideas, **you stop editing text and start sculpting software**.
