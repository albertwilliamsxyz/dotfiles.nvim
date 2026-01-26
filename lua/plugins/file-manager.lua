return {
	{
		"stevearc/oil.nvim",
		opts = {
            view_options = {
                show_hidden = true,
                is_always_hidden = function(name, bufnr)
                    return name == ".." or name == ".git"
                end,
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
            }
        },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>oil", "<CMD>Oil --float<CR>", desc = "Edit Directory (Float)" },
			{ "<leader>or", "<CMD>Oil --float .<CR>", desc = "Resume Directory" },
		},
	},
}
