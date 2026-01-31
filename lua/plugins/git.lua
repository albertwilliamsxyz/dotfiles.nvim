return {
	-- reviewed, create documentation for this one
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
		end,
	},
	{
		-- reviewed, create documentation for this one
		"lewis6991/gitsigns.nvim",
		opts = {},
	},
}
