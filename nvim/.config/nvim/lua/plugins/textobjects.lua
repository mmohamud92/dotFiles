return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    cond = function()
        return pcall(require, "nvim-treesitter.configs") or pcall(require, "nvim-treesitter.config")
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
