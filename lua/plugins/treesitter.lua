local parsers = {
	"bash",
	"c",
	"css",
	"gitcommit",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"query",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("config.treesitter", { clear = true }),
	callback = function(ev)
		-- pcall: buffers without an installed parser stay on regex highlighting
		if not pcall(vim.treesitter.start, ev.buf) then
			return
		end
		vim.wo[0][0].foldmethod = "expr"
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

-- The idea grammar: keymaps organized around semantic units (function, class,
-- block, parameter, assignment, return, statement), not cursor movement.
require("nvim-treesitter-textobjects").setup({
	select = { lookahead = true },
	move = { set_jumps = true },
})

local select_maps = {
	{ "af", "@function.outer" },
	{ "if", "@function.inner" },
	{ "ac", "@class.outer" },
	{ "ic", "@class.inner" },
	{ "ab", "@block.outer" },
	{ "ib", "@block.inner" },
	{ "ap", "@parameter.outer" },
	{ "ip", "@parameter.inner" },
	{ "aa", "@assignment.outer" },
	{ "ia", "@assignment.inner" },
	{ "ar", "@return.outer" },
	{ "ir", "@return.inner" },
	{ "as", "@statement.outer" },
}

for _, map in ipairs(select_maps) do
	local lhs, capture = map[1], map[2]
	vim.keymap.set({ "x", "o" }, lhs, function()
		require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects")
	end, { desc = "Select " .. capture })
end

local swap_maps = {
	{ "p", "@parameter.inner" },
	{ "a", "@attribute.inner" },
	{ "b", "@block.inner" },
	{ "f", "@function.inner" },
	{ "s", "@statement.outer" },
}

for _, map in ipairs(swap_maps) do
	local letter, capture = map[1], map[2]
	vim.keymap.set("n", "<leader>m" .. letter, function()
		require("nvim-treesitter-textobjects.swap").swap_next(capture)
	end, { desc = "Swap next " .. capture })
	vim.keymap.set("n", "<leader>m" .. letter:upper(), function()
		require("nvim-treesitter-textobjects.swap").swap_previous(capture)
	end, { desc = "Swap previous " .. capture })
end

local move_maps = {
	{ "s", "@statement.outer" },
	{ "r", "@return.outer" },
	{ "p", "@parameter.outer" },
	{ "b", "@block.outer" },
	{ "f", "@function.outer" },
	{ "c", "@class.outer" },
}

for _, map in ipairs(move_maps) do
	local letter, capture = map[1], map[2]
	local move = function(fn)
		return function()
			require("nvim-treesitter-textobjects.move")[fn](capture, "textobjects")
		end
	end
	vim.keymap.set({ "n", "x", "o" }, "]" .. letter, move("goto_next_start"), { desc = "Next " .. capture .. " start" })
	vim.keymap.set({ "n", "x", "o" }, "]" .. letter:upper(), move("goto_next_end"), { desc = "Next " .. capture .. " end" })
	vim.keymap.set({ "n", "x", "o" }, "[" .. letter, move("goto_previous_start"), { desc = "Previous " .. capture .. " start" })
	vim.keymap.set({ "n", "x", "o" }, "[" .. letter:upper(), move("goto_previous_end"), { desc = "Previous " .. capture .. " end" })
end

local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T_expr, { expr = true })

require("treesitter-context").setup({ max_lines = 4 })
