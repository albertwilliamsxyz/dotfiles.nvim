local augend = require("dial.augend")

require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"],
		augend.date.alias["%Y-%m-%d"],
		augend.constant.alias.bool,
		augend.semver.alias.semver,
	},
})

local function manipulate(direction, mode)
	return function()
		require("dial.map").manipulate(direction, mode)
	end
end

vim.keymap.set("n", "<C-a>", manipulate("increment", "normal"), { desc = "Increment" })
vim.keymap.set("n", "<C-x>", manipulate("decrement", "normal"), { desc = "Decrement" })
vim.keymap.set("n", "g<C-a>", manipulate("increment", "gnormal"), { desc = "Increment (additive)" })
vim.keymap.set("n", "g<C-x>", manipulate("decrement", "gnormal"), { desc = "Decrement (additive)" })
vim.keymap.set("v", "<C-a>", manipulate("increment", "visual"), { desc = "Increment (visual)" })
vim.keymap.set("v", "<C-x>", manipulate("decrement", "visual"), { desc = "Decrement (visual)" })
vim.keymap.set("v", "g<C-a>", manipulate("increment", "gvisual"), { desc = "Increment (additive visual)" })
vim.keymap.set("v", "g<C-x>", manipulate("decrement", "gvisual"), { desc = "Decrement (additive visual)" })
