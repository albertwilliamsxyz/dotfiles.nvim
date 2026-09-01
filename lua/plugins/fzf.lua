local fzf = require("fzf-lua")

fzf.setup({
	-- No icon plugins installed; plain text listings
	defaults = { file_icons = false, git_icons = false },
	winopts = {
		width = 0.87,
		height = 0.80,
		preview = { layout = "vertical", vertical = "up:50%" },
	},
})

-- Code actions and other vim.ui.select prompts go through fzf
fzf.register_ui_select()

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find Buffers" })
vim.keymap.set("n", "<leader>fh", fzf.blines, { desc = "Buffer Fuzzy" })
vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })

-- LSP-backed pickers (need an attached client)
vim.keymap.set("n", "<leader>fa", fzf.lsp_finder, { desc = "All about symbol" })
vim.keymap.set("n", "<leader>fs", fzf.lsp_live_workspace_symbols, { desc = "Workspace Symbols" })
vim.keymap.set("n", "<leader>fd", fzf.diagnostics_document, { desc = "Diagnostics: buffer" })
vim.keymap.set("n", "<leader>fD", fzf.diagnostics_workspace, { desc = "Diagnostics: workspace" })
