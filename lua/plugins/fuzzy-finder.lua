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
			{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<leader>fh", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer Fuzzy" },
			{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
			{ "<leader>fn", "<cmd>Telescope notify<CR>", desc = "Notifications" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git", ".env" },
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							mirror = true,
							preview_height = 0.7,
							prompt_position = "bottom",
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
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
