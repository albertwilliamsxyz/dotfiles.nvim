return {
	-- reviewed
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	-- reviewed
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	-- reviewed, I love these kind of plugins
	{
		"Wansmer/treesj",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
		},
		keys = {
			{
				"<leader>trt",
				":TSJToggle<CR>",
				mode = { "n" },
				desc = "Toggle split/join in a node in the tree",
			},
			{
				"<leader>trs",
				":TSJSplit<CR>",
				mode = { "n" },
				desc = "Toggle split in a node in the tree",
			},
			{
				"<leader>trj",
				":TSJJoin<CR>",
				mode = { "n" },
				desc = "Toggle join in a node in the tree",
			},
		},
	},
}
