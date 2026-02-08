return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main", -- Match nvim-treesitter main branch
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    init = function()
        -- Prevent conflicts with built-in mappings
        vim.g.no_plugin_maps = true
    end,
    config = function()
        -- Configure textobjects with new main branch API
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    ['@class.outer'] = 'V',     -- linewise
                },
                include_surrounding_whitespace = false,
            },
        })

        -- Set up keymaps for textobject selection
        vim.keymap.set({ "x", "o" }, "af", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end, { desc = "Select outer function" })

        vim.keymap.set({ "x", "o" }, "if", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end, { desc = "Select inner function" })

        vim.keymap.set({ "x", "o" }, "ac", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end, { desc = "Select outer class" })

        vim.keymap.set({ "x", "o" }, "ic", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end, { desc = "Select inner class" })

        vim.keymap.set({ "x", "o" }, "aa", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
        end, { desc = "Select outer parameter" })

        vim.keymap.set({ "x", "o" }, "ia", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
        end, { desc = "Select inner parameter" })

        vim.keymap.set({ "x", "o" }, "ab", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
        end, { desc = "Select outer block" })

        vim.keymap.set({ "x", "o" }, "ib", function()
            require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
        end, { desc = "Select inner block" })

        -- Set up movement keymaps (go to next/previous start)
        vim.keymap.set({ "n", "x", "o" }, "]f", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end, { desc = "Next function start" })

        vim.keymap.set({ "n", "x", "o" }, "[f", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end, { desc = "Previous function start" })

        vim.keymap.set({ "n", "x", "o" }, "]c", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end, { desc = "Next class start" })

        vim.keymap.set({ "n", "x", "o" }, "[c", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end, { desc = "Previous class start" })

        vim.keymap.set({ "n", "x", "o" }, "]a", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
        end, { desc = "Next parameter start" })

        vim.keymap.set({ "n", "x", "o" }, "[a", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects")
        end, { desc = "Previous parameter start" })

        -- Set up movement keymaps (go to next/previous end)
        vim.keymap.set({ "n", "x", "o" }, "]F", function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end, { desc = "Next function end" })

        vim.keymap.set({ "n", "x", "o" }, "[F", function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end, { desc = "Previous function end" })

        vim.keymap.set({ "n", "x", "o" }, "]C", function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
        end, { desc = "Next class end" })

        vim.keymap.set({ "n", "x", "o" }, "[C", function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
        end, { desc = "Previous class end" })

        vim.keymap.set({ "n", "x", "o" }, "]A", function()
            require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects")
        end, { desc = "Next parameter end" })

        vim.keymap.set({ "n", "x", "o" }, "[A", function()
            require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects")
        end, { desc = "Previous parameter end" })

        -- Set up repeatable move (optional but useful for ; and ,)
        local ts_repeat = require("nvim-treesitter-textobjects.repeatable_move")
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat.repeat_last_move_next, { desc = "Repeat last move next" })
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat.repeat_last_move_previous, { desc = "Repeat last move previous" })
    end,
}
