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
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
					},
					inline = {
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
}