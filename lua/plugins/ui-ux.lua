return {
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "markdown", "vimwiki" },
				},
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					filetypes = { "norg" },
				},
			},
			max_width = 100,
			max_height = 12,
			max_width_window_percentage = nil,
			max_height_window_percentage = 50,
			window_overlap_clear_enabled = false, 
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
	{
		"folke/twilight.nvim",
		opts = {},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
    {   
        -- reviewed, I might need to create my own colorscheme
        "rktjmp/lush.nvim",
        lazy = true,
    },
    {
        -- current color palette
        "RRethy/base16-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("base16-grayscale-light")
        end,
    },
    {
        -- EXPLAIN CONFIGURATION
        -- reviewed, I saw that I'm using also nvim-notify and nui.nvim but
        -- I want to configure them in this file but not necessarily
        -- declaring them here, I want to have specific configurations
        -- for nvim-notify and nui.nvim but keeping them all under
        -- this file for centralization
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
                lsp_doc_border = false,
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
        -- reviewed
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "auto", 
                section_separators = { left = "", right = "" },
                component_separators = { left = "|", right = "|" },
            }
        }
    },
    {
        -- reviewed
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
    }
}