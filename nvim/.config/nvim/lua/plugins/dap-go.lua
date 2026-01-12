return {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
        require("dap-go").setup(opts)

        local dap = require("dap")
        local keymap = vim.keymap

        -- Configure Go launch configurations for non-test debugging
        dap.configurations.go = {
            {
                type = "go",
                name = "Debug",
                request = "launch",
                program = "${file}",
            },
            {
                type = "go",
                name = "Debug with args",
                request = "launch",
                program = "${file}",
                args = function()
                    local input = vim.fn.input("Args: ")
                    return vim.split(input, " ", true)
                end,
            },
            {
                type = "go",
                name = "Debug test",
                request = "launch",
                mode = "test",
                program = "${file}",
            },
            {
                type = "go",
                name = "Attach",
                mode = "local",
                request = "attach",
                processId = require("dap.utils").pick_process,
            },
        }

        -- DAP Go specific mappings
        keymap.set("n", "<leader>dgt", function()
            require("dap-go").debug_test()
        end, { desc = "Debug go test" })
        keymap.set("n", "<leader>dgl", function()
            require("dap-go").debug_last()
        end, { desc = "Debug last go test" })

        -- Gopher mappings (requires vim-go or gopher.nvim)
        keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "Add json struct tags" })
        keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "Add yaml struct tags" })
    end,
}

