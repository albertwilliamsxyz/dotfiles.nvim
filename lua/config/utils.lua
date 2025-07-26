local M = {}

M.reload_configuration = function()
        vim.cmd(vim.fn.expand("source $MYVIMRC"))
        vim.print(vim.fn.expand("$MYVIMRC sourced successfully"))
end

return M
