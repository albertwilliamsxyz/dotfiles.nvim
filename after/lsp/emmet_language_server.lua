return {
	-- Narrowed from the default: emmet also attaches to css/scss/less, where it
	-- only adds noise next to cssls.
	filetypes = { "html", "javascriptreact", "typescriptreact" },
	-- Default is { ".git" } alone, which attaches almost anywhere.
	root_markers = { "package.json", ".git" },
}
