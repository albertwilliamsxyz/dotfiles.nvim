vim.opt.debug = "msg"

vim.opt.termguicolors = true

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true
-- vim.opt.colorcolumn = { 80 }

vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.autochdir = false

vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undo"

vim.opt.wrap = true
vim.opt.wrapscan = false

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.copyindent = true

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showtabline = 1

vim.opt.completeopt = {}

vim.opt.scrolloff = 10

vim.opt.splitbelow = false
vim.opt.splitright = false


vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

vim.opt.endofline = false
vim.opt.fixendofline = false
vim.opt.endoffile = false

vim.opt.foldlevel = 99
vim.opt.foldcolumn = "auto"

vim.opt.ignorecase = true
vim.opt.wildignorecase = true

vim.opt.timeout = true
vim.opt.timeoutlen = 500

vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
