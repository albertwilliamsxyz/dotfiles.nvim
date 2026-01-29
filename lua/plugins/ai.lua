return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		keys = {
			{ "<leader>ccc", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI: Toggle Chat" },
			{ "<leader>cca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI: Actions" },
		},
		config = function()
			-- Better highlight groups for diffs on light colorschemes
			vim.api.nvim_set_hl(0, "CodeCompanionChatDiffAdd", { fg = "#116611", bg = "#d0f0d0", bold = true })
			vim.api.nvim_set_hl(0, "CodeCompanionChatDiffDelete", { fg = "#881111", bg = "#f0d0d0" })
			vim.api.nvim_set_hl(0, "CodeCompanionChatDiffChange", { fg = "#886611", bg = "#f0f0d0" })
			-- Also override standard Diff highlight groups for inline diffs
			vim.api.nvim_set_hl(0, "DiffAdd", { fg = "#116611", bg = "#c8e6c8", bold = true })
			vim.api.nvim_set_hl(0, "DiffDelete", { fg = "#991111", bg = "#f0d0d0" })
			vim.api.nvim_set_hl(0, "DiffChange", { fg = "#886611", bg = "#f5f5d0" })
			vim.api.nvim_set_hl(0, "DiffText", { fg = "#116611", bg = "#a0d0a0", bold = true })

			require("codecompanion").setup({
				display = {
					diff = {
						enabled = true,
						close_chat_at = 240,
						layout = "vertical",
						opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
						provider = "default",
					},
				},
				interactions = {
					chat = {
						tools = {
							opts = {
								auto_submit_errors = true,
								auto_submit_success = true,
							},
							["cmd_runner"] = {
								opts = {
									require_approval_before = true,
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
			})
		end,
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
