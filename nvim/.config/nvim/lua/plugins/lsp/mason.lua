return {
	{
		"williamboman/mason-lspconfig.nvim",
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
			"saghen/blink.cmp",
		},
		config = function()
			local ensure_installed = {
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
				"rust_analyzer",
				"kotlin_language_server",
				"jdtls",
				"jsonls",
				"elixirls",
				"tflint",
				"pylsp",
				"dockerls",
				"bashls",
				"marksman",
				"cucumber_language_server",
				"gopls",
				"astro",
			}

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			do
				local ok, blink = pcall(require, "blink.cmp")
				if ok and type(blink.get_lsp_capabilities) == "function" then
					local ok_caps, caps = pcall(blink.get_lsp_capabilities, capabilities)
					if ok_caps and caps then
						capabilities = caps
					else
						local ok_caps2, caps2 = pcall(blink.get_lsp_capabilities)
						if ok_caps2 and caps2 then
							capabilities = caps2
						end
					end
				end
			end

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_enable = false,
			})
		end,
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
