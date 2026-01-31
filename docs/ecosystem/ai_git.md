# Artificial Intelligence & Version Control

## 1. The AI Agent
*   **[codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)**:
    *   *Role*: A full AI interface directly in Neovim.
    *   *Capabilities*:
        *   **Chat**: Discuss code, ask questions (`<leader>ccc`).
        *   **Inline**: Edit code via prompts directly in the buffer.
        *   **Agentic**: It can run tools (list files, read content) to solve complex tasks.
    *   *Configuration*: You reviewed the highlight groups. Ensuring they match your chosen theme (Light/Dark) is critical for readability of the diffs.

*   **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)**:
    *   *Role*: The "Ghost Text" autocompleter.
    *   *Usage*: It provides gray text suggestions as you type. fast, low-latency, "dumb" completion compared to the "smart" reasoning of CodeCompanion.

## 2. Version Control (Git)
*   **[vim-fugitive](https://github.com/tpope/vim-fugitive)**:
    *   *Role*: The Git Wrapper.
    *   *Power*: `:Git blame` (via `<leader>gb`), `:Gdiffsplit`. It allows full use of Git CLI commands from within Vim.
*   **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**:
    *   *Role*: The Gutter Informant.
    *   *Visuals*: Shows added (+), modified (~), or deleted (-) lines in the sidebar.
    *   *Actions*: Stage hunks, reset hunks, preview hunks directly from the buffer.
