return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local keymap = vim.keymap

        dapui.setup()

        -- Auto open/close DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- DAP UI mappings
        keymap.set("n", "<leader>du", function()
            dapui.toggle()
        end, { desc = "Toggle DAP UI" })
        keymap.set("n", "<leader>de", function()
            dapui.eval(nil, { enter = true })
        end, { desc = "Evaluate expression under cursor" })
        keymap.set("v", "<leader>de", function()
            dapui.eval()
        end, { desc = "Evaluate selected expression" })
    end,
}

