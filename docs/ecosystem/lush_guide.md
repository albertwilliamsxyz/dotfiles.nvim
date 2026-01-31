# Lush.nvim: The Color Engine

## When is Lush useful?
`lush.nvim` is a **colorscheme creation tool**. It is useful when:
1.  **You are unsatisfied with off-the-shelf themes**: You find existing themes too "noisy" or lacking contrast in specific areas (like diffs or completion menus).
2.  **You want programmatic control**: You want to define relationships (e.g., "Comments should be 50% opacity of Normal text") rather than hardcoding hex values.
3.  **You want real-time feedback**: Lush enables a "Hot Reload" workflow where you see color changes instantly as you type.

## How to Create a Colorscheme

### 1. Setup
Create a file at `lua/lush_theme/my_theme.lua`.

### 2. The Skeleton
```lua
local lush = require('lush')
local hsl = lush.hsl

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- 1. Base Colors
    Normal { bg = hsl(0, 0, 10), fg = hsl(0, 0, 90) }, -- Dark grey bg, light text

    -- 2. Derived Colors
    Comment { fg = Normal.fg.darken(40).desaturate(20) }, -- Auto-calculated

    -- 3. UI Elements
    CursorLine { bg = Normal.bg.lighten(5) },
  }
end)

return theme
```

### 3. Activation
In your `ui-ux.lua` or `init.lua`:
```lua
require('lush')(require('lush_theme.my_theme'))
```

### Key Concepts
*   **HSL**: Define colors by Hue, Saturation, Lightness (`hsl(220, 100, 50)`).
*   **Operators**: `.lighten(x)`, `.darken(x)`, `.saturate(x)`, `.mix(OtherColor, 50)`.
*   **Inheritance**: `Function { Normal }` makes functions look like Normal text.
