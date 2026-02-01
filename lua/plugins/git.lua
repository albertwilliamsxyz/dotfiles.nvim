return {
	-- reviewed, create documentation for this one
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
		end,
	},
	-- reviewed, create documentation for this one
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
	-- reviewed
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
