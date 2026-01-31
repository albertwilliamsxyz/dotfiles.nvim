# The Theoretical Framework: The Cognitive Interface

## 1. Core Philosophy: The Editor as Extension

The fundamental premise of this configuration ("Synapse") is that the text editor should not be a tool you *operate*, but a space you *inhabit*. The goal is to minimize the **translation cost** between a thought ("I want to change the authentication logic") and the action (navigating, editing, verifying).

We define this through three pillars:

### I. Immediacy (Zero Latency)
Traditional editing involves a "search-locate-act" loop.
*   *Old Way*: "Where is that file?" -> Open File Tree -> Scroll -> Click -> Scan for function.
*   *New Way (Teleportation)*: "The Authentication File" -> `<Key>` -> There.
*   *Mechanism*: **Harpoon** (Working Set) and **Leap** (Visual Teleportation).

### II. Symbiosis (AI as Cortex)
The AI is not a "clipper" or a "generator"; it is a **reasoning engine**.
*   The configuration treats AI (`codecompanion`) not as a plugin, but as a layer of the interface.
*   High-contrast, specific highlighting for AI actions (`CodeCompanionChatDiffAdd`) creates a distinct visual language for "synthetic thought" vs "organic thought".
*   The **Agentic Chain** allows the editor to act autonomously, effectively giving the user a "second pair of hands" that can navigate the file system and execute commands.

### III. Composition over Manipulation
We move from manipulating *characters* (insert mode, backspace) to manipulating *structures* (treesitter limits, semantic selections).
*   Code is not text; code is an Abstract Syntax Tree (AST) visualized as text.
*   **Treesitter** and **TreeSJ** allow us to reshape the AST (split/join blocks, swap parameters) directly, aligning the editing physics with the mental model of the code structure.

---

## 2. The Mental Model

### The "No-Buffer" Paradigm
The concept of "Tabs" or extensive "Buffer Lists" is a relic of print media (pages in a book).
*   **Cognitive Load**: Scanning a list of 10 open tabs requires O(n) mental effort.
*   **The Solution**: **Harpoon**.
    *   Human working memory holds ~4 items (Miller's Law adjusted for complexity).
    *   Harpoon limits you to ~4-5 active files (slots 1-4 + generic).
    *   This forces *context discipline*. You are forced to declare "These are the 4 files relevant to my current thought process."

### Spatial Navigation (Teleportation)
*   **HJKL** (Relative Motion) is for micro-adjustments.
*   **Leap** (Absolute Motion) is for travel.
*   *Principle*: If you can see it, you should be able to touch it instantly. `s` + `char` + `char` creates a direct neural mapping between your eye's focus point and the cursor's location.

### The Feedback Loop
*   **LSP** and **Diagnostics** are not "errors" but "guardrails".
*   **Noice.nvim** moves notifications and command lines out of the way, preserving the "Deep Work" center stage.
*   The goal is a **Heads-Up Display (HUD)** where information appears only when relevant, maintaining a high signal-to-noise ratio.
