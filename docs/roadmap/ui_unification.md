# UI Unification: Noice & Telescope

## The Goal
To achieve visual parity between the Telescope interface (referenced image) and the Noice command line/popup interface.

## 1. Telescope "Reference" Style
Based on typical highly-customized Telescope setups (like the image provided):
*   **Border**: Rounded or Double, often with a specific highlight (e.g., specific hex color).
*   **Header**: A distinct "Title" highlight (e.g., `TelescopeTitle`).
*   **Backdrop**: Often distinct from the normal editor background.

## 2. Configuring Noice to Match
Noice is highly configurable but defaults to its own style. To match Telescope, we need to override the `views` table in `ui-ux.lua`.

### Implementation Strategy
We need to align the **Highlights** and the **Border Characters**.

#### A. Highlights
Map Noice's highlights to Telescope's.
```lua
-- In ui-ux.lua -> noice -> config function:
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "TelescopeBorder" })
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "TelescopeTitle" })
vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "TelescopePromptPrefix" })
```

#### B. Position & Size
Telescope is usually a centered float. Noice's `cmdline_popup` is also centered, but we can tune it:
```lua
views = {
  cmdline_popup = {
    position = {
      row = "50%",
      col = "50%",
    },
    size = {
      width = "60%", -- Match Telescope width
      height = "auto",
    },
    border = {
      style = "rounded", -- Or matching characters
      padding = { 0, 1 },
    },
    win_options = {
      winhighlight = "NormalFloat:TelescopeNormal,FloatBorder:TelescopeBorder",
    },
  },
}
```

## 3. Creating the Plan
In the execution phase, we will modify `ui-ux.lua` to inject these `win_options` and `link` commands.
