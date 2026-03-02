return {
	{
		"kyza0d/vocal.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			local_model = {
				model = "base",
				path = "~/whisper",
			},
		},
		config = function(_, opts)
			local whisper_python_path = vim.fn.expand("~/.local/pipx/venvs/openai-whisper/bin")
			vim.env.PATH = whisper_python_path .. ":" .. vim.env.PATH
			require("vocal").setup(opts)
		end,
	},
}
