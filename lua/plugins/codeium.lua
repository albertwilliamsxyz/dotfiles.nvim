return {
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        cmd = "Codeium",
        enabled = false,
        build = ":Codeium Auth",
        config = function()
            require("codeium").setup({
                enable_cmp_source = false,
                enable_chat = true,
                virtual_text = {
                    enabled = true,
                    key_bindings = {
                        accept = "<C-a>",
                        next = "<M-]>",
                        prev = "<M-[>",
                    },
                },
            })
        end,
    }
}
