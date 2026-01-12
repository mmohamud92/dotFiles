return {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-treesitter/nvim-treesitter",
    },
    cond = function()
        return pcall(require, "nvim-treesitter.configs") or pcall(require, "nvim-treesitter.config")
    end,
    config = function()
        require("nvim-dap-virtual-text").setup()
    end,
}
