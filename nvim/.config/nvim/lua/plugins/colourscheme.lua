return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night", -- night, storm, day, moon
        on_highlights = function(hl, c)
            hl.GitSignsAdd = { fg = "#00ff00" }
            hl.GitSignsAddNr = { fg = "#00ff00" }
            hl.GitSignsAddLn = { fg = "#00ff00" }
        end,
    },
    config = function(_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
    end,
}
