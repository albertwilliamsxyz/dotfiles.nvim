return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.surround").setup()
			
			require("mini.ai").setup()
			
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()

			local hipatterns = require("mini.hipatterns")
			hipatterns.setup({
				highlighters = {
					hex_color = hipatterns.gen_highlighter.hex_color(),
				},
			})
			
			require("mini.files").setup()
			
			require("mini.comment").setup()
			
			require("mini.cursorword").setup()
			
			require("mini.bufremove").setup()
		end,
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>fm",
				function()
					require("mini.files").open(vim.api.nvim_buf_get_name(0))
				end,
				desc = "File Manager (Mini)",
			},
		},
	},
}
