# Navigation & Motion

## 1. The File System (Oil)
*   **[oil.nvim](https://github.com/stevearc/oil.nvim)**:
    *   *Philosophy*: "Edit your filesystem like you edit text."
    *   *Workflow*: `<leader>ee` opens the directory. You can delete files by deleting lines, rename by editing text, and move by cutting/pasting lines.
    *   *Why*: It keeps you in the "Editing" mindset rather than the "Tree Navigation" mindset.

## 2. The Working Set (Harpoon)
*   **[harpoon](https://github.com/ThePrimeagen/harpoon) (v2)**:
    *   *Concept*: A "Working Set" of active files.
    *   *Keymaps*:
        *   `<leader>ha`: Add current file.
        *   `<leader>hh`: View Menu.
        *   `<leader>h1-5`: Teleport to file.
    *   *Question*: "Can I have multiple lists?"
        *   *Answer*: Yes, Harpoon v2 supports list management (e.g., separate lists for "Git Work" vs "Feature Work"), but the default setup typically uses one global list per project. You can define custom lists in the configuration if needed.

## 3. Teleportation (Leap)
*   **[leap.nvim](https://codeberg.org/andyg/leap.nvim)**:
    *   *Physics*: Eye-guided motion.
    *   *Workflow*: Look at target -> Press `s` -> Type 2 chars -> You are there.
    *   *Review*: You mentioned revisiting keybindings. The default `s` (forward) and `S` (backward) are powerful but conflict with the native `s` (substitute) key. If you use substitute often, you might move Leap to `gs`.

## 4. Recall (Telescope)
*   **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)**:
    *   *Role*: Fuzzy Finder for everything (Files, Grep, Help, Keymaps).
    *   *Extensions*:
        *   **Telescope Notify**: You added `<leader>fn`. This will show the history of notifications.
        *   **Plugin Management**: You can install `telescope-lazy` to manage plugins from Telescope.
