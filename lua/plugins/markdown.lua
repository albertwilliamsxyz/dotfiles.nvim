return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "codecompanion" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			heading = {
				backgrounds = {
					"Visual",
				},
				foregrounds = {
					"RenderMarkdownH1",
				},
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "markdown", "codecompanion" },
		build = "cd app && npx --yes yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown", "codecompanion" }
		end,
		keys = {
			{ "<leader>mm", ":MarkdownPreview<CR>", desc = "Markdown Preview" },
		},
	},
}
