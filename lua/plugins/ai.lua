return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat", "CodeCompanionCmd" },
		keys = {
			{ "<leader>ccc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI: Toggle Chat" },
			{ "<leader>cca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI: Actions" },
		},
		opts = {
			display = {
				chat = {
					window = {
						layout = "vertical",
						position = "bottom",
						width = 0.45,
					},
				},
				diff = {
					enabled = true,
					close_chat_at = 240,
					layout = "horizontal",
					ratio = 0.5,
				},
			},
			interactions = {
				chat = {
					tools = {
						opts = {
							auto_submit_errors = false,
							auto_submit_success = true,
						},
						["cmd_runner"] = {
							opts = {
								requires_approval = true,
							},
						},
						["files"] = {
							opts = {
								requires_approval = false,
							},
						},
					},
				},
				agentic_chain = {
					description = "Autonomous agentic chain: plans, executes, and reflects on multi-step tasks to improve your config.",
					tools = {
						opts = {
							allow_autonomous = true,
							memory = true,
							max_steps = 10,
							reflection = true,
						},
						["cmd_runner"] = {
							opts = {
								require_approval_before = false,
							},
						},
					},
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
				},
				inline = {
					adapter = "copilot",
				},
				agent = {
					adapter = "copilot",
				},
			},
			adapters = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {})
				end,
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
