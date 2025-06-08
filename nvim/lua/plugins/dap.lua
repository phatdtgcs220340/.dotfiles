return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text", -- optional: show inline debug values
    },
    config = function()
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup()
        local dap, dapui = require('dap'), require('dapui')

        dap.adapters.java = function(callback, config)
            callback({
                type = 'server',
                host = '127.0.0.1',
                port = 5005
            })
        end

        dap.configurations.java = {
            {
                type = 'java',
                request = 'attach',
                name = "Attach to Docker Container",
                hostName = "127.0.0.1",
                port = 5005
            }
        }
        -- Open dap-ui automatically
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
        vim.keymap.set("n", "<Leader>dc", dap.continue, {})
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set conditional breakpoint" })

        -- Launch / Continue / Step
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })

        -- Debug UI control
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
        vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debug session" })
        vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate debug session" })

        -- REPL
        vim.keymap.set("n", "<leader>de", dap.repl.open, { desc = "Open DAP REPL" })
    end
}
