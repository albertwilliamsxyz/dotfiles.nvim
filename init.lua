-- Options

vim.opt.debug = "msg"

vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.colorcolumn = { 80 }

vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.autochdir = false

vim.opt.wrap = true
vim.opt.wrapscan = false

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.copyindent = true

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showtabline = 2

vim.opt.completeopt = {}

vim.opt.scrolloff = 2

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

vim.opt.endofline = false
vim.opt.fixendofline = false
vim.opt.endoffile = false

vim.opt.foldclose = "all"
vim.opt.foldcolumn = "auto"

vim.opt.ignorecase = true
vim.opt.wildignorecase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 10000

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0

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

vim.g.netrw_keepdir = 1

-- Setup lazy.nvim

require("config.lazy")
