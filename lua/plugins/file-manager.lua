return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = false,
			cleanup_delay_ms = 2000,
			watch_for_changes = true,
			view_options = {
				show_hidden = true,
			},
			float = {
				padding = 2,
				max_width = 90,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
			},
			keymaps = {
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
			},
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ee", "<CMD>Oil<CR>", desc = "Edit Directory" },
			{ "<leader>er", "<CMD>Oil .<CR>", desc = "Edit Current Directory" },
		},
	},
}
