return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"Synapse v2.0",
			}

			dashboard.section.buttons.val = {
				dashboard.button("f", "Find File", ":Telescope find_files<CR>"),
				dashboard.button("n", "New File", ":ene <BAR> startinsert <CR>"),
				dashboard.button("r", "Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("g", "Git Status", ":Telescope git_status<CR>"),
				dashboard.button("q", "Quit", ":qa<CR>"),
			}

			alpha.setup(dashboard.config)
		end,
	},
}
