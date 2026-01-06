return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local keymap = vim.keymap

        -- Standard DAP controls
        keymap.set("n", "<leader>dc", function()
            dap.continue()
        end, { desc = "Continue/Start debugging" })
        keymap.set("n", "<leader>ds", function()
            dap.step_over()
        end, { desc = "Step over" })
        keymap.set("n", "<leader>di", function()
            dap.step_into()
        end, { desc = "Step into" })
        keymap.set("n", "<leader>do", function()
            dap.step_out()
        end, { desc = "Step out" })
        keymap.set("n", "<leader>dr", function()
            dap.restart()
        end, { desc = "Restart debugging" })
        keymap.set("n", "<leader>dt", function()
            dap.terminate()
        end, { desc = "Stop/Terminate debugging" })
        keymap.set("n", "<leader>db", function()
            dap.toggle_breakpoint()
        end, { desc = "Toggle breakpoint" })
        keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set conditional breakpoint" })
        keymap.set("n", "<leader>dl", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "Set log point" })
        keymap.set("n", "<leader>dC", function()
            dap.clear_breakpoints()
        end, { desc = "Clear all breakpoints" })
    end,
}


