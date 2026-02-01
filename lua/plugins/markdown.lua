return {
	-- reviewed
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
					"RenderMarkdownHeadingBg",
					"RenderMarkdownHeadingBg",
					"RenderMarkdownHeadingBg",
					"RenderMarkdownHeadingBg",
					"RenderMarkdownHeadingBg",
					"RenderMarkdownHeadingBg",
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_set_hl(0, "RenderMarkdownHeadingBg", { bg = "#e8f5e8" })
			require("render-markdown").setup(opts)
		end,
	},
	-- not reviewed
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npx --yes yarn install",
		keys = {
			{ "<leader>mp", ":MarkdownPreview<CR>", desc = "Markdown Preview" },
		},
	},
}
