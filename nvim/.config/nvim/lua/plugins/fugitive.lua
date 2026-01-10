return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G" },
	keys = {
		{ "<leader>gg", "<cmd>Git<cr>", desc = "Git status (Fugitive)" },
		{ "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
		{ "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
		{ "<leader>gP", "<cmd>Git pull --rebase<cr>", desc = "Git pull --rebase" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
		{ "<leader>gd", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vertical)" },
		{ "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
	},
}

