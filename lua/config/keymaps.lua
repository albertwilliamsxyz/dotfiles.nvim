local utils = require("config.utils")

-- Keymaps

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Search
vim.keymap.set({ "i", "n" }, "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Escape and clear hlsearch" })

-- File operations
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>", { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>ya", "<cmd>%y+<cr>", { desc = "Copy whole file" })

-- Quit operations
vim.keymap.set("n", "<leader>qq", "<cmd>quit<cr>", { desc = "Quit current window" })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<cr>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "Force quit all" })

-- Reloads
vim.keymap.set("n", "<leader>rc", utils.reload_configuration, { desc = "Reload configuration" })
vim.keymap.set("n", "<leader>rf", "<cmd>e!<cr>", { desc = "Reload current file" })

-- Tabs
vim.keymap.set("n", "<leader>tae", "<cmd>Texplore<cr>", { desc = "Open explorer in new tab" })
vim.keymap.set("n", "<leader>tao", "<cmd>tabo<cr>", { desc = "Close other tabs" })
vim.keymap.set("n", "<leader>tah", "<cmd>tabe %<cr>", { desc = "Open current file in new tab" })