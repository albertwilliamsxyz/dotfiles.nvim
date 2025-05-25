return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		opts = {},
		keys = {
			{ "<leader>pmm", ":Mason<CR>" },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			{
				"williamboman/mason-lspconfig.nvim",
				dependencies = {
					"mason-org/mason.nvim",
					"neovim/nvim-lspconfig",
				},
			},
			{
				"jay-babu/mason-null-ls.nvim",
				event = { "BufReadPre", "BufNewFile" },
				dependencies = {
					"williamboman/mason.nvim",
					"nvimtools/none-ls.nvim",
				},
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = {
					"williamboman/mason.nvim",
					"mfussenegger/nvim-dap",
				},
			},
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"stylua",
				"ts_ls",
				"pyright",
				"jsonls",
				"eslint_d",
				"emmet-language-server",
				"misspell",
				"codespell",
				"chrome-debug-adapter",
			},
			run_on_start = true,
		},
	},
}
