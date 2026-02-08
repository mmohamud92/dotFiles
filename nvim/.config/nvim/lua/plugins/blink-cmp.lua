return {
    "saghen/blink.cmp",
    -- Use a release tag to download prebuilt binaries.
    version = "1.*",
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
            preset = "enter",
        },
        completion = {
            -- Prevent "auto inserting" the selected item while you navigate the menu.
            -- This commonly causes duplicates like `chcheck` when completing `check`.
            list = {
                selection = {
                    auto_insert = false,
                    preselect = false,
                },
            },
            accept = {
                -- Give LSP resolve time to return `additionalTextEdits` (e.g. Go auto-imports like `fmt`).
                -- This waits for the LSP to provide import statements before inserting.
                auto_brackets = { enabled = true },
                resolve_timeout_ms = 500,
            },
            menu = { border = "single", auto_show = true },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = { border = "single" },
            },
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
