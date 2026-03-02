return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = {
			"CodeCompanion",
			"CodeCompanionActions",
			"CodeCompanionChat",
			"CodeCompanionCmd",
		},
		keys = {
			{
				"<leader>ccc",
				"<cmd>CodeCompanionChat Toggle<cr>",
				mode = { "n", "v" },
				desc = "AI: Toggle Chat",
			},
			{
				"<leader>cca",
				"<cmd>CodeCompanionActions<cr>",
				mode = { "n", "v" },
				desc = "AI: Actions",
			},
			{
				"<leader>ccb",
				"<cmd>CodeCompanionChat Add<cr>",
				mode = { "n", "v" },
				desc = "AI: Add content to chat",
			},
		},
		opts = {
			display = {
				chat = {
					window = {
						layout = "horizontal",
						position = "bottom",
						height = 0.5,
					},
					fold_context = true,
				},
				diff = {
					enabled = true,
					layout = "horizontal",
					ratio = 0.5,
				},
			},
			interactions = {
				chat = {
					adapter = "copilot",
					tools = {
						opts = {
							auto_submit_errors = false,
							auto_submit_success = true,
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
				cmd = {
					adapter = "copilot",
				},
				background = {
					adapter = "copilot",
				},
			},
			adapters = {
				http = {
					opts = {
						show_presets = false,
						show_model_choices = false,
					},
				},
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-a>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				panel = { enabled = false },
			})
		end,
	},
}
