return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- Required by neotest-golang v2
    lazy = false,
    build = ":TSUpdate",
    config = function()
        vim.treesitter.language.register("bash", "zsh")

        -- Enable treesitter highlighting for all supported filetypes
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                -- Try to start treesitter highlighting for the buffer
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
