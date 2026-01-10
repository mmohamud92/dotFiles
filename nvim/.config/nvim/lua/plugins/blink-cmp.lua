return {
    "saghen/blink.cmp",
    version = "*",
    build = "cargo build --release",
    event = "InsertEnter",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "rafamadriz/friendly-snippets",
    },
    opts = {
        snippets = { preset = "luasnip" },
        keymap = {
            preset = "default",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
    config = function(_, opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("blink.cmp").setup(opts)
    end,
}
