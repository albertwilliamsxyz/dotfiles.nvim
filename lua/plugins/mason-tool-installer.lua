return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	lazy = false,
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
}
