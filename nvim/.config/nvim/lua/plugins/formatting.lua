return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        local util = require("conform.util")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                go = function(bufnr)
                    -- Check if this is a LeetCode buffer
                    local filename = vim.api.nvim_buf_get_name(bufnr)
                    if filename:match("leetcode") then
                        -- Use gofmt and golines for LeetCode buffers (skip goimports-reviser to avoid go.mod errors)
                        return { "gofmt", "golines" }
                    end

                    -- Only run goimports-reviser when we're in a Go module.
                    -- (It requires go.mod and will fail otherwise, especially if Neovim's cwd isn't the project root.)
                    local has_go_mod = vim.fs.find("go.mod", { path = filename, upward = true })[1] ~= nil
                    if not has_go_mod then
                        return { "gofmt", "golines" }
                    end

                    return { "gofmt", "goimports-reviser", "golines" }
                end,
                markdown = { "prettier" },
                graphql = { "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
            },
            formatters = {
                ["goimports-reviser"] = {
                    cwd = util.root_file({ "go.mod" }),
                },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 3000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
