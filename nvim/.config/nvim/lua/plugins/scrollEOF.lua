return {
    "Aasim-A/scrollEOF.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local ok, scrollEOF = pcall(require, "scrollEOF")
        if ok then
            scrollEOF.setup()
        end
    end,
}

