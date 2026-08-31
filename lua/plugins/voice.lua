return {
	{
		"kyza0d/vocal.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			delete_recordings = true,
			local_model = {
				model = "base.en",
				path = "~/whisper",
				args = {
					"--threads",
					"8",
					"--output_format",
					"txt",
					"--fp16",
					"False",
					"--language",
					"en",
					"--device",
					"cpu",
				},
			},
		},
		config = function(_, opts)
			local whisper_python_path = vim.fn.expand("~/.local/pipx/venvs/openai-whisper/bin")
			vim.env.PATH = whisper_python_path .. ":" .. vim.env.PATH
			require("vocal").setup(opts)
		end,
	},
}
