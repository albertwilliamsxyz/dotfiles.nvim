return {
	-- reviewed, I want to revisit the keybindings to check if this is the best option
	{
		url = "https://codeberg.org/andyg/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		opts = {
			case_sensitive = false,
		},
		keys = {
			{
				"<leader>s",
				function()
					require("leap").leap({})
				end,
				mode = { "n", "x", "o" },
				desc = "Leap Forward",
			},
			{
				"<leader>S",
				function() 
					require("leap").leap({ backward = true })
				end,
				mode = { "n", "x", "o" },
				desc = "Leap Backward",
			},
			{
				"<leader>gs",
				function()
					require("leap").leap({
						target_windows = vim.tbl_filter(function(win)
							return vim.api.nvim_win_get_config(win).relative == ""
						end, vim.api.nvim_tabpage_list_wins(0)),
					})
				end,
				mode = { "n", "x", "o" },
				desc = "Leap from Window",
			},
		},
	},
	{
		"chrisgrieser/nvim-spider",
		keys = {
			{
				"w",
				"<cmd>lua require('spider').motion('w')<CR>",
				mode = { "n", "o", "x" },
			},
			{
				"e",
				"<cmd>lua require('spider').motion('e')<CR>",
				mode = { "n", "o", "x" },
			},
			{
				"b",
				"<cmd>lua require('spider').motion('b')<CR>",
				mode = { "n", "o", "x" },
			},
		},
	},
}
