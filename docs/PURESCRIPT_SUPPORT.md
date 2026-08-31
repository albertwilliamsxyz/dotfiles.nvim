# PureScript Support Plan

## Current State Analysis
- **Tree-sitter**: `purescript` parser is installed but selection/textobjects are reported as weak. This is likely due to missing or incomplete query files (`textobjects.scm`) in the installed grammar.
- **LSP**: `purescript-language-server` is installed via Mason. Basic functionality works, but "rename" is reported as not working. Renaming is mapped to `<leader>lrn`.
- **Formatting**: Autoformatting is desired but not currently configured in `conform.nvim`.

## Implementation Plan

### 1. Enhance Tree-sitter (Better Selection)
The "weak" selection usually means the `purescript` grammar lacks the `textobjects.scm` queries that `nvim-treesitter-textobjects` relies on (like `@function.outer`).

**Action Items:**
1.  **Update Parser**: Run `:TSUpdate purescript` to ensure the latest version.
2.  **Verify Queries**: Check `<nvim-data-dir>/lazy/nvim-treesitter/queries/purescript/` for `textobjects.scm`. If missing, we may need to contribute them or define custom queries in `~/.config/nvim/queries/purescript/textobjects.scm`.

### 2. Fix LSP (Renaming & Intelligence)
The `purescript-language-server` supports renaming. If it fails, it's often due to:
- The project root not being detected correctly (needs `spago.dhall`, `spago.yaml`, or `purs.json`).
- The project not being built (run `spago build`). The LS often relies on build artifacts.

**Action Items:**
1.  **Verify Keymap**: Ensure you are using `<leader>lrn` for rename (as defined in `lua/plugins/lsp.lua`).
2.  **Check LSP Status**: Open a `.purs` file and run `:LspInfo` to ensure the client is attached to `purescriptls`.
3.  **Build Project**: Ensure the project is built via Spago so the Language Server has access to the externs/types.

### 3. Enable Autoformatting
We will use `purs-tidy`, the standard PureScript formatter.

**Action Items:**
1.  **Install Formatter**: Add `purs-tidy` to `mason-tool-installer` in `lua/plugins/lsp.lua`.
2.  **Configure Conform**: Update `lua/plugins/formatting.lua` to enable `purs-tidy` for PureScript files.

## Proposed Code Changes

### Step 1: Install `purescript-tidy`
Modify `lua/plugins/lsp.lua`:
```lua
ensure_installed = {
    -- ... existing tools ...
    "purescript-language-server",
    "purescript-tidy", -- Correct Mason package name
},
```

### Step 2: Configure Formatter
Modify `lua/plugins/formatting.lua`:
```lua
formatters_by_ft = {
    -- ... existing formatters ...
    -- Conform uses the binary name 'purs-tidy'
    purescript = { "purs_tidy" }, 
},
```

### Step 3: (Optional) Custom Tree-sitter Queries
If the default grammar is still weak, create `after/queries/purescript/textobjects.scm` with custom captures:
```scm
(value_declaration) @function.outer
(value_declaration
  (guarded_equation
    (expression) @function.inner))
```
