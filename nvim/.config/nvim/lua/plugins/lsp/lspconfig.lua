return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			gopls = {},
		},
	},
	config = function(_, opts)
		for server, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
