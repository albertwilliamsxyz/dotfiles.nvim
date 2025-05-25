return {
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		opts = {
			case_sensitive = false,
		},
		keys = {
			{ "<leader>s", "<Plug>(leap-forward)", mode = { "n", "x", "o" }, desc = "Leap forward" },
			{ "<leader>S", "<Plug>(leap-backward)", mode = { "n", "x", "o" }, desc = "Leap backward" },
			{
				"<leader>gs",
				"<Plug>(leap-from-window)",
				mode = { "n", "x", "o" },
				desc = "Leap forward (from window)",
			},
		},
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
}
