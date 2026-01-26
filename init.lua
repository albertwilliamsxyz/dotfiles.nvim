-- Bootstrap lazy.nvim
require("config.lazy")

-- Load options and keymaps BEFORE loading plugins
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- Setup lazy.nvim
require("lazy").setup("plugins")

vim.keymap.set("n", "<leader>pml", ":Lazy<CR>")
