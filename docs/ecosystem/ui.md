# User Interface & Experience

## 1. Visual Foundation
*   **[lush.nvim](https://github.com/rktjmp/lush.nvim)**: A colorscheme creation aid.
    *   *Usage*: It allows for programmatic definition of colors. You mentioned wanting to create your own colorscheme; Lush is the industry standard for this in Neovim.
    *   *Relation*: It acts as the "compiler" for robust themes.
*   **[base16-nvim](https://github.com/RRethy/base16-nvim)**: The current palette engine.
    *   *Configuration*: Currently loading `base16-grayscale-light`.
    *   *Note*: Ensure `vim.opt.background` in `options.lua` matches this (set to "light").

## 2. HUD & Notifications
*   **[noice.nvim](https://github.com/folke/noice.nvim)**: The message and command line UI.
    *   *Configuration*: It replaces the standard command line with a floating window and manages notification popups.
    *   *Dependencies*:
        *   **nui.nvim**: UI Component library.
        *   **nvim-notify**: The notification bubble engine.
    *   *Goal*: To reduce eye movement to the bottom-left corner and present information contextually.

## 3. Status
*   **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)**: The status line.
    *   *Potential*: Use this to display Harpoon status (which file info slot 1 is holding) or AI Agent status (Thinking/Idle).

## 4. Key Discovery
*   **[which-key.nvim](https://github.com/folke/which-key.nvim)**: The cheat sheet.
    *   *Role*: Helps discover keymaps. Press `<leader>` and wait to see available options.

## 5. Icons
*   **[nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)**:
    *   *Role*: Provides filetype icons for Telescope, Oil, Lualine, etc.
    *   *Review*: Check `NvimWebDeviconsHiTest` to verify icon loading.

## 6. Dashboard
*   **[alpha-nvim](https://github.com/goolord/alpha-nvim)**: The greeter.
    *   *Idea*: Configure this to show "Last Session", "Most Used Projects", or "Harpoon List" immediately on startup.
