return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-f>", -- Accept suggestion
					accept_word = false,
					accept_line = false,
					next = "<M-]>", -- Next suggestion (Alt+])
					prev = "<M-[>", -- Previous suggestion (Alt+[)
					dismiss = "<C-]>", -- Dismiss suggestion
				},
			},
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>", -- Open panel (Alt+Enter)
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				["."] = false,
			},
		})
	end,
}
