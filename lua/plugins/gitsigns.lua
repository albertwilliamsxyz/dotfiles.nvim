local gitsigns = require("gitsigns")

-- Changed lines get a background, not only a sign: agent diffs read at a glance
gitsigns.setup({ linehl = true })

vim.keymap.set("n", "]h", function()
	gitsigns.nav_hunk("next")
end, { desc = "Next Hunk" })
vim.keymap.set("n", "[h", function()
	gitsigns.nav_hunk("prev")
end, { desc = "Previous Hunk" })
vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk_inline, { desc = "Hunk: Preview Inline" })
vim.keymap.set("n", "<leader>hw", gitsigns.toggle_word_diff, { desc = "Hunk: Toggle Word Diff" })
