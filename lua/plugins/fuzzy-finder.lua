return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"nvim-telescope/telescope-ui-select.nvim",
			},
		},
		keys = {
			{ "<leader>fa", "<cmd>Telescope<CR>", desc = "Telescope All" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fh", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer Fuzzy" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git", ".env" },
				},
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
		end,
	},
}
