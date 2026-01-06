return {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Should not be lazy loaded (already lazy-loaded internally)
    after = "colourscheme",
    config = function()
        require("markview").setup({
            preview = {
                icon_provider = "internal", -- "internal", "mini", or "devicons"
            },
        })
        
        -- Recommended settings for markview: nowrap and expandtab
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "markdown" },
            callback = function()
                vim.opt_local.wrap = false
                vim.opt_local.expandtab = true
            end,
        })
    end,
}

