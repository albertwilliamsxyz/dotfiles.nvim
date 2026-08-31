local group = vim.api.nvim_create_augroup("config", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = group,
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- 0.12 has no fs-watcher reload: freshness comes from timestamp checks on
-- these events; 'autoread' then reloads buffers without local changes (W12
-- warns on conflict). Keeps buffers current while the agent edits on disk.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "TermLeave" }, {
	group = group,
	callback = function()
		if vim.fn.getcmdwintype() == "" then
			vim.cmd.checktime()
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})
