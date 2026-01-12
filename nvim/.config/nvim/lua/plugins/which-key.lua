return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        local wk = require("which-key")

        wk.setup({})

        wk.add({
            { "<leader>c", group = "code" },
            { "<leader>g", group = "git" },
            { "<leader>h", group = "git hunks" },
        })

        wk.add({
            { "c", group = "change" },
            { "ca", group = "around textobj" },
            { "ci", group = "inside textobj" },
            { "cs", desc = "change surround (nvim-surround)" },
            { "d", group = "delete" },
            { "da", group = "around textobj" },
            { "di", group = "inside textobj" },
            { "ds", desc = "delete surround (nvim-surround)" },
            { "y", group = "yank" },
            { "ya", group = "around textobj" },
            { "yi", group = "inside textobj" },
            { "ys", desc = "add surround (nvim-surround)" },
        })

        wk.add({
            mode = { "v" },
            { "c", group = "change" },
            { "cs", desc = "change surround (nvim-surround)" },
            { "d", group = "delete" },
            { "ds", desc = "delete surround (nvim-surround)" },
            { "y", group = "yank" },
            { "ys", desc = "add surround (nvim-surround)" },
        })
    end,
}
