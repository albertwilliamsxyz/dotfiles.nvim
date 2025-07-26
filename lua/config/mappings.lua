local utils = require('config.utils')

vim.g.mapleader = " "

-- Basics

vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>qq", ":quit<CR>")
vim.keymap.set("n", "<leader>qw", ":wq<CR>")
vim.keymap.set("n", "<leader>qa", ":qa<CR>")
vim.keymap.set("n", "<leader>qf", ":qa!<CR>")

-- Copying the whole file

vim.keymap.set("n", "<leader>ya", ":%y+<CR>")

-- Reloads

vim.keymap.set("n", "<leader>rc", utils.reload_configuration)
vim.keymap.set("n", "<leader>rf", ":e!<CR>")

-- Show and hide

vim.keymap.set("n", "<leader>hh", ":nohl<CR>", { silent = true })

-- Tabs

vim.keymap.set("n", "<leader>tae", ":Texplore<CR>")
vim.keymap.set("n", "<leader>tao", ":tabo<CR>")
vim.keymap.set("n", "<leader>tah", ":tabe %<CR>")
