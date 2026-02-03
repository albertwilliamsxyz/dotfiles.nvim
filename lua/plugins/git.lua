return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", ":DiffviewOpen<CR>", desc = "Open Diffview" },
			{ "<leader>gh", ":DiffviewFileHistory %<CR>", desc = "File History (current)" },
			{ "<leader>gH", ":DiffviewFileHistory<CR>", desc = "File History (repo)" },
			{ "<leader>gq", ":DiffviewClose<CR>", desc = "Close Diffview" },
		},
		opts = {},
	},
}
