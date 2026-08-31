require("leap").setup({ case_sensitive = false })

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
	require("leap").leap({})
end, { desc = "Leap Forward" })

vim.keymap.set({ "n", "x", "o" }, "<leader>S", function()
	require("leap").leap({ backward = true })
end, { desc = "Leap Backward" })

vim.keymap.set({ "n", "x", "o" }, "<leader>gs", function()
	require("leap").leap({
		target_windows = vim.tbl_filter(function(win)
			return vim.api.nvim_win_get_config(win).relative == ""
		end, vim.api.nvim_tabpage_list_wins(0)),
	})
end, { desc = "Leap from Window" })
