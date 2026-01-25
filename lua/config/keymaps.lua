-- Keymaps

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear search with <Esc>
map({ "i", "n" }, "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Save file
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
