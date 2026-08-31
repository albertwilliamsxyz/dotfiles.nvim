return {
	{
		-- this plugin can be more useful if I set it up to manage local config files
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier", stop_after_first = true },
				typescript = { "prettier", stop_after_first = true },
				javascriptreact = { "prettier", stop_after_first = true },
				typescriptreact = { "prettier", stop_after_first = true },
				json = { "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
				css = { "prettier", stop_after_first = true },
				-- purescript = { "purs-tidy" },
			},
		},
	},
}
