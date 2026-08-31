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
			vim.cmd.colorscheme("base16-grayscale-light")
		end,
	},
	{
		-- requires validation
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = false,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:Normal,FloatBorder:FloatBorder",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
					},
				},
			},
			config = function(_, opts)
				require("noice").setup(opts)
				vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
				vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { link = "Normal" })
				vim.api.nvim_set_hl(0, "NoiceConfirmBorder", { link = "FloatBorder" })
				vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { link = "Normal" })
			end,
		},
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
			sections = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
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
					only_render_image_at_cursor = true,
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
