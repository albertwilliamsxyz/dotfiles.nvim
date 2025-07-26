return {
        "nvim-tree/nvim-web-devicons",
        {
                "vim-airline/vim-airline",
                dependencies = { "vim-airline/vim-airline-themes" },
        },
        {
                "RRethy/base16-nvim",
                lazy = false,
                priority = 1000,
                config = function()
                        vim.cmd.colorscheme("base16-grayscale-dark")
                end,
        },
}
