return {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
        "mfussenegger/nvim-dap",
    },
    config = function(_, opts)
        require("dap-go").setup(opts)

        local keymap = vim.keymap

        -- DAP mappings
        keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Add breakpoint at line" })
        keymap.set("n", "<leader>dus", function()
            local widgets = require("dap.ui.widgets")
            local sidebar = widgets.sidebar(widgets.scopes)
            sidebar.open()
        end, { desc = "Open debugging sidebar" })

        -- DAP Go mappings
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

