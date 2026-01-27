vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set({ "i", "n" }, "<Esc>", "<cmd>nohlsearch<cr><Esc>", { desc = "Escape and clear hlsearch" })

vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

vim.keymap.set("n", "<leader>qq", "<cmd>quit<cr>", { desc = "Quit current window" })
vim.keymap.set("n", "<leader>qw", "<cmd>wq<cr>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>qa", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>qf", "<cmd>qa!<cr>", { desc = "Force quit all" })

vim.keymap.set("n", "<leader>crf", "<cmd>e!<cr>", { desc = "Config: Reload File" })

vim.keymap.set("n", "<leader>ya", "<cmd>%y+<cr>", { desc = "Yank: Whole File" })
