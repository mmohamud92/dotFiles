return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "saghen/blink.cmp" },
	opts = {
		servers = {
			gopls = {
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						staticcheck = true,
					},
				},
			},
		},
	},
	config = function(_, opts)
		local ok_blink, blink = pcall(require, "blink.cmp")

		local function go_organize_imports(bufnr, client)
			local position_encoding = (client and client.offset_encoding) or "utf-16"
			local params = vim.lsp.util.make_range_params(0, position_encoding)
			params.context = { only = { "source.organizeImports" }, diagnostics = {} }

			local results = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 2000)
			for _, res in pairs(results or {}) do
				for _, action in ipairs(res.result or {}) do
					if action.edit then
						vim.lsp.util.apply_workspace_edit(action.edit, position_encoding)
					end
					if action.command then
						vim.lsp.buf.execute_command(action.command)
					end
				end
			end
		end

		local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

		for server, config in pairs(opts.servers) do
			if ok_blink and type(blink.get_lsp_capabilities) == "function" then
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
			end
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = group,
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client or client.name ~= "gopls" then
					return
				end

				local bufnr = args.buf
				vim.api.nvim_clear_autocmds({ group = group, event = "BufWritePre", buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = group,
					buffer = bufnr,
					callback = function()
						go_organize_imports(bufnr, client)
						vim.lsp.buf.format({ bufnr = bufnr, async = false })
					end,
				})
			end,
		})
	end,
}
