return {
    {
        url = "https://codeberg.org/andyg/leap.nvim",
        lazy = false,
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, '<leader>s', '<Plug>(leap-forward-to)')
            vim.keymap.set({'n', 'x', 'o'}, '<leader>S', '<Plug>(leap-backward-to)')
            vim.keymap.set({'n', 'x', 'o'}, '<leader>gs', '<Plug>(leap-from-window)')
        end
    }
}
