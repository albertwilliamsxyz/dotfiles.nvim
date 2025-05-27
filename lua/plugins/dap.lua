return {
        {
                "mfussenegger/nvim-dap",
                dependencies = {
                        "rcarriga/nvim-dap-ui",
                        "nvim-neotest/nvim-nio",
                        "jay-babu/mason-nvim-dap.nvim",
                },
                config = function()
                        local dap = require("dap")

                        local chrome_executable = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
                        local chrome_runtime_args = {
                                "--remote-debugging-port=9222",
                                "--no-first-run",
                                "--no-default-browser-check",
                                "--user-data-dir=/tmp/chrome-debug-profile",
                                "--profile-directory=Debugging",
                                "--auto-open-devtools-for-tabs",
                        }
                        local chrome_debugger_path = vim.fn.stdpath("data") .. "/mason/bin"
                        local chrome_debugger_exec = chrome_debugger_path .. "/chrome-debug-adapter"

                        dap.adapters.chrome = {
                                type = "executable",
                                command = chrome_debugger_exec,
                        }

                        local chrome_adapter_configuration = {
                                {
                                        name = "Launch chrome",
                                        type = "chrome",
                                        request = "launch",
                                        runtimeExecutable = chrome_executable,
                                        runtimeArgs = chrome_runtime_args,
                                        -- userDataDir = "/tmp/chrome-debug-profile",
                                        url = "http://localhost:5173",
                                        webRoot = "${workspaceFolder}",
                                        smartStep = true,
                                        program = "${file}",
                                        cwd = vim.fn.getcwd(),
                                        sourceMaps = true,
                                        protocol = "inspector",
                                        port = 9222,
                                },
                        }

                        dap.configurations["typescriptreact"] = chrome_adapter_configuration
                        dap.configurations["javascriptreact"] = chrome_adapter_configuration
                        dap.configurations["typescript"] = chrome_adapter_configuration
                        dap.configurations["javascript"] = chrome_adapter_configuration

                        -- Basic keybindings
                        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
                        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
                        vim.keymap.set("n", "<leader>dsi", dap.step_into, { desc = "Step Into" })
                        vim.keymap.set("n", "<leader>dso", dap.step_over, { desc = "Step Over" })

                        -- DAP UI setup
                        local dapui = require("dapui")
                        dapui.setup()

                        vim.keymap.set("n", "<leader>dmo", dapui.open, { desc = "Open DAP UI" })
                        vim.keymap.set("n", "<leader>dmc", dapui.close, { desc = "Close DAP UI" })
                        vim.keymap.set("n", "<leader>dmt", dapui.toggle, { desc = "Toggle DAP UI" })

                        -- Optional: Auto-open/close UI
                        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
                        dap.listeners.before.event_exited["dapui_config"] = dapui.close
                end,
        },
}
