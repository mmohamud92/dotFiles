return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"eslint",
				"eslint",
				"rust_analyzer",
				"kotlin_language_server",
				"jdtls",
				"lua_ls",
				"jsonls",
				"html",
				"elixirls",
				"tailwindcss",
				"tflint",
				"pylsp",
				"dockerls",
				"bashls",
				"marksman",
				"cucumber_language_server",
				"gopls",
				"astro",
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"golangci-lint",
				"goimports-reviser", -- go import formatter
				"golines", -- go line formatter
				"delve", -- go debugger (dlv)
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
