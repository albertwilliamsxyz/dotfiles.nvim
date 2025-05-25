-- General settings

vim.opt.title = true

vim.opt.autochdir = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.debug = "msg"

-- Formatting

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.breakindent = true
vim.opt.copyindent = true

vim.opt.endofline = false
vim.opt.fixendofline = false

-- Display information

vim.opt.showtabline = 2
vim.opt.expandtab = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.colorcolumn = { 80 }

-- Completion

-- vim.opt.completeopt = { "menu", "menuone", "popup", "noselect" }
vim.opt.completeopt = {}

-- Appearance

vim.opt.termguicolors = true
vim.opt.background = "light"

-- Timeouts

vim.opt.timeout = true
vim.opt.timeoutlen = 10000

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

-- Folding

vim.opt.foldclose = "all"
vim.opt.foldcolumn = "auto"

-- Search

vim.opt.ignorecase = true

-- Split

vim.opt.splitright = true

-- Functions

local function reload_configuration()
    vim.cmd(vim.fn.expand("source $MYVIMRC"))
    print(vim.fn.expand("$MYVIMRC sourced successfully"))
end

-- Mappings

vim.g.mapleader = " "

-- Basics

vim.keymap.set("n", "<leader>e", ":Explore<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q<space>", ":quit<CR>")
vim.keymap.set("n", "<leader>qw", ":wq<CR>")
vim.keymap.set("n", "<leader>qa", ":qa<CR>")
vim.keymap.set("n", "<leader>qf", ":qa!<CR>")

-- Copying the whole file
vim.keymap.set("n", "<leader>ca", ":%y+<CR>")

-- Reloads

vim.keymap.set("n", "<leader>rc", reload_configuration)
vim.keymap.set("n", "<leader>rf", ":e!<CR>")

-- Show and hide

vim.keymap.set("n", "<leader>hh", ":nohl<CR>", { silent = true })

-- Tabs

vim.keymap.set("n", "<leader>tae", ":Texplore<CR>")
vim.keymap.set("n", "<leader>tao", ":tabo<CR>")
vim.keymap.set("n", "<leader>tah", ":tabe %<CR>")

-- Netrw

vim.g.netrw_keepdir = 0

-- Setup lazy.nvim

require("config.lazy")
