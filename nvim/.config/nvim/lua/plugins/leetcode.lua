return {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("leetcode").setup({
            -- Use telescope as the picker (auto-detected if nil, but explicit is clearer)
            picker = {
                provider = "telescope",
            },
            -- Default language
            lang = "golang",
            -- Storage paths
            storage = {
                home = vim.fn.stdpath("data") .. "/leetcode",
                cache = vim.fn.stdpath("cache") .. "/leetcode",
            },
            -- Console configuration
            console = {
                open_on_runcode = true,
                dir = "row",
                size = {
                    width = "90%",
                    height = "75%",
                },
                result = {
                    size = "60%",
                },
                testcase = {
                    virt_text = true,
                    size = "40%",
                },
            },
            -- Description panel
            description = {
                position = "left",
                width = "40%",
                show_stats = true,
            },
            -- Editor settings
            editor = {
                reset_previous_code = true,
                fold_imports = true,
            },
            -- Disable image support (as requested)
            image_support = false,
            -- Cache settings
            cache = {
                update_interval = 60 * 60 * 24 * 7, -- 7 days
            },
            -- Logging
            logging = true,
        })
    end,
}

