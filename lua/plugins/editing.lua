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
	-- not reviewed
	{
		"monaqa/dial.nvim",
		keys = {
			{
				"<C-a>",
				function()
					require("dial.map").manipulate("increment", "normal")
				end,
				desc = "Increment",
			},
			{
				"<C-x>",
				function()
					require("dial.map").manipulate("decrement", "normal")
				end,
				desc = "Decrement",
			},
			{
				"g<C-a>",
				function()
					require("dial.map").manipulate("increment", "gnormal")
				end,
				desc = "Increment (additive)",
			},
			{
				"g<C-x>",
				function()
					require("dial.map").manipulate("decrement", "gnormal")
				end,
				desc = "Decrement (additive)",
			},
			{
				"<C-a>",
				function()
					require("dial.map").manipulate("increment", "visual")
				end,
				mode = "v",
				desc = "Increment (visual)",
			},
			{
				"<C-x>",
				function()
					require("dial.map").manipulate("decrement", "visual")
				end,
				mode = "v",
				desc = "Decrement (visual)",
			},
		},
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.date.alias["%Y-%m-%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
				},
			})
		end,
	},
	-- not reviewed
	{
		"gbprod/yanky.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		keys = {
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put after" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put before" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put after (leave cursor)" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put before (leave cursor)" },
			{ "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Cycle yank history (previous)" },
			{ "<C-n>", "<Plug>(YankyNextEntry)", desc = "Cycle yank history (next)" },
		},
		opts = {
			ring = {
				history_length = 100,
				storage = "sqlite",
			},
		},
	},
	-- not reviewed
	{
		"gbprod/substitute.nvim",
		keys = {
			{ "s", function() require("substitute").operator() end, desc = "Substitute" },
			{ "ss", function() require("substitute").line() end, desc = "Substitute line" },
			{ "S", function() require("substitute").eol() end, desc = "Substitute to EOL" },
			{ "s", function() require("substitute").visual() end, mode = "x", desc = "Substitute (visual)" },
			{ "sx", function() require("substitute.exchange").operator() end, desc = "Exchange" },
			{ "sxx", function() require("substitute.exchange").line() end, desc = "Exchange line" },
			{ "X", function() require("substitute.exchange").visual() end, mode = "x", desc = "Exchange (visual)" },
		},
		opts = {},
	},
	-- not reviewed
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", ":UndotreeToggle<CR>", desc = "Toggle Undotree" },
		},
		cmd = { "UndotreeToggle", "UndotreeShow" },
	},
}
