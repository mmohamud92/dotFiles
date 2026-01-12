return {
    "nvim-treesitter/nvim-treesitter",
    -- nvim-treesitter recommends not lazy-loading; load at startup for reliability.
    lazy = false,
    build = ":TSUpdate",
    opts = {
        -- Parsers to keep installed on all machines.
        ensure_installed = {
            "bash",
            "c",
            "css",
            "dockerfile",
            "gitignore",
            "go",
            "graphql",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "prisma",
            "query",
            "svelte",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]f"] = "@function.outer",
                    ["]c"] = "@class.outer",
                    ["]a"] = "@parameter.outer",
                },
                goto_next_end = {
                    ["]F"] = "@function.outer",
                    ["]C"] = "@class.outer",
                    ["]A"] = "@parameter.outer",
                },
                goto_previous_start = {
                    ["[f"] = "@function.outer",
                    ["[c"] = "@class.outer",
                    ["[a"] = "@parameter.outer",
                },
                goto_previous_end = {
                    ["[F"] = "@function.outer",
                    ["[C"] = "@class.outer",
                    ["[A"] = "@parameter.outer",
                },
            },
        },
    },
    config = function(_, opts)
        local ok, config = pcall(require, "nvim-treesitter.configs")
        if not ok then
            ok, config = pcall(require, "nvim-treesitter.config")
        end

        if not ok or type(config) ~= "table" or type(config.setup) ~= "function" then
            if #vim.api.nvim_list_uis() > 0 then
                vim.schedule(function()
                    vim.notify("nvim-treesitter: failed to load. Run :Lazy sync, then restart Neovim.", vim.log.levels.WARN)
                end)
            end
            return
        end

        config.setup(opts)

        -- Use bash parser for zsh files.
        vim.treesitter.language.register("bash", "zsh")
    end,
}
