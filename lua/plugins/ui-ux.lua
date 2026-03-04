return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		opts = {
			override = {
				css = {
					icon = "",
					color = "#563d7c",
					cterm_color = "65",
					name = "Css",
				},
			},
		},
	},
	{
		"rktjmp/lush.nvim",
		lazy = true,
	},
	{
		"RRethy/base16-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("base16-0x96f")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "auto",
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"3rd/image.nvim",
		ft = { "markdown", "norg" },
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					only_render_image_at_cursor = false,
				},
			},
		},
	},
	{
		"folke/twilight.nvim",
		keys = {
			{ "<leader>zm", ":Twilight<CR>", desc = "Toggle Twilight (Focus Mode)" },
		},
		opts = {},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		opts = {
			options = {
				user_default_options = {
					css = true,
					tailwind = true,
					mode = "background",
				},
			},
		},
	},
}
