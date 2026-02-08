return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- enables symbol search
    cmd = { "GoDoc" },
    opts = {
        picker = {
            type = "telescope",
        },
        window = {
            type = "vsplit", -- or "split" for horizontal
        },
    },
    keys = {
        { "<leader>Gd", "<cmd>GoDoc<cr>", desc = "Go documentation", ft = "go" },
    },
}
