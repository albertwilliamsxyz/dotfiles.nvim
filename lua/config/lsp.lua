vim.lsp.enable({
        'lua_ls',
        'pyright',
})

vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if client.supports_method('textDocument/completion') then
                        vim.lsp.completion.enable(
                                true,
                                client.id,
                                event.buf,
                                { autotrigger = false }
                        )
                end

                local buffer = event.buf
                local options = { noremap = true, silent = false, buffer = buffer }

                -- Jumping
                vim.keymap.set("n", "<leader>lgd", vim.lsp.buf.definition, options)
                vim.keymap.set("n", "<leader>lgD", vim.lsp.buf.declaration, options)
                vim.keymap.set("n", "<leader>lgi", vim.lsp.buf.implementation, options)
                vim.keymap.set("n", "<leader>lgr", vim.lsp.buf.references, options)

                -- Actions
                vim.keymap.set("n", "<leader>lft", vim.lsp.buf.format, options)
                vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, options)
                vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, options)

                -- Diagnostics and Information
                vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
                vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, options)

                -- Insert mode
                vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, options)

                -- Formatting
                local client_supports_formatting = (
                        not client:supports_method('textDocument/willSaveWaitUntil') and
                        client:supports_method('textDocument/formatting')
                )

                if client_supports_formatting then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                                buffer = buffer,
                                callback = function()
                                        vim.lsp.buf.format({ async = false })
                                end,
                        })
                end
        end,
})
