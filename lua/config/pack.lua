-- Registered before add() so it also fires for fresh installs
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("config.pack", { clear = true }),
	callback = function(ev)
		if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
			vim.schedule(function()
				vim.cmd("TSUpdate")
			end)
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/RRethy/base16-nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://codeberg.org/andyg/leap.nvim" },
	{ src = "https://github.com/tpope/vim-repeat" },
	{ src = "https://github.com/chrisgrieser/nvim-spider" },
	{ src = "https://github.com/monaqa/dial.nvim" },
}, { confirm = false })

require("plugins.colorscheme")
require("plugins.treesitter")
require("plugins.fzf")
require("plugins.oil")
require("plugins.leap")
require("plugins.spider")
require("plugins.dial")
