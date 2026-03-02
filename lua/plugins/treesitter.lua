return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "master",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		-- master is a reference to a frozen branch and I should start using main
		branch = "master",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.install").prefer_git = true

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"tsx",
					"vim",
					"vimdoc",
					"gitcommit",
					"javascript",
					"html",
					"typescript",
					"purescript",
					"css",
					"go",
					"rust",
					"sql",
					"json",
					"yaml",
					"toml",
					"xml",
				},
				auto_install = true,
				sync_install = false,
				indent = { enable = true },
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>tis",
						node_incremental = "<leader>tni",
						scope_incremental = "<leader>tsi",
						node_decremental = "<leader>tnd",
					},
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.inner",
							["ia"] = "@assignment.inner",
							["aa"] = "@assignment.outer",
							["ir"] = "@return.inner",
							["ar"] = "@return.outer",
							["as"] = "@statement.outer",
							["lhsa"] = "@assignment.lhs",
							["rhsa"] = "@assignment.rhs",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>mp"] = "@parameter.inner",
							["<leader>ma"] = "@attribute.inner",
							["<leader>mb"] = "@block.inner",
							["<leader>mf"] = "@function.inner",
							["<leader>ms"] = "@statement.outer",
						},
						swap_previous = {
							["<leader>mP"] = "@parameter.inner",
							["<leader>mA"] = "@attribute.inner",
							["<leader>mB"] = "@block.inner",
							["<leader>mF"] = "@function.inner",
							["<leader>mS"] = "@statement.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]s"] = "@statement.outer",
							["]r"] = "@return.outer",
							["]p"] = "@parameter.outer",
							["]b"] = "@block.outer",
							["]f"] = "@function.outer",
							["]c"] = "@class.outer",
						},
						goto_next_end = {
							["]S"] = "@statement.outer",
							["]R"] = "@return.outer",
							["]P"] = "@parameter.outer",
							["]B"] = "@block.outer",
							["]F"] = "@function.outer",
							["]C"] = "@class.outer",
						},
						goto_previous_start = {
							["[s"] = "@statement.outer",
							["[r"] = "@return.outer",
							["[p"] = "@parameter.outer",
							["[b"] = "@block.outer",
							["[f"] = "@function.outer",
							["[c"] = "@class.outer",
						},
						goto_previous_end = {
							["[S"] = "@statement.outer",
							["[R"] = "@return.outer",
							["[P"] = "@parameter.outer",
							["[B"] = "@block.outer",
							["[F"] = "@function.outer",
							["[C"] = "@class.outer",
						},
					},
				},
			})

			local ok, ts_repeat_move = pcall(require, "nvim-treesitter.textobjects.repeatable_move")
			if ok then
				vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
				vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
				vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
				vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
				vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
				vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
			end
		end,
	},
}
