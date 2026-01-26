return {
    {
        "Exafunction/codeium.nvim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("codeium").setup({
                enable_chat = true, 
                virtual_text = {
                    enabled = true,
                    key_bindings = {
                        accept = "<C-g>", 
                        next = "<M-]>",
                        prev = "<M-[>",
                    }
                }
            })
        end
    }
}
