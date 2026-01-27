return {
	{
		"Exafunction/codeium.nvim",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("codeium").setup({
				enable_cmp_source = false,
				enable_chat = true,
				virtual_text = {
					enabled = true,
					key_bindings = {
						accept = "<C-a>",
						next = "<M-]>",
						prev = "<M-[>",
					},
				},
			})
		end,
	},
}
