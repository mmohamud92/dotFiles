return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Disable automatic spaces on brackets when changing surrounds
            space_on_closing_char = false,
        })
    end,
}
