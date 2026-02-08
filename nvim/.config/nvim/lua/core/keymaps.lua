vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- LSP
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymap.set("n", "grR", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })

-- line movement
keymap.set("n", "<leader>md", function()
	local count = vim.v.count1
	vim.cmd("move .+" .. count)
	vim.cmd("normal! ==")
end, { desc = "Move line down" })
keymap.set("n", "<leader>mu", function()
	local count = vim.v.count1
	vim.cmd("move .-" .. (count + 1))
	vim.cmd("normal! ==")
end, { desc = "Move line up" })
keymap.set("v", "<leader>md", function()
	local count = vim.v.count1
	vim.cmd("'<,'>move '>+" .. count)
	vim.cmd("normal! gv=gv")
end, { desc = "Move selection down" })
keymap.set("v", "<leader>mu", function()
	local count = vim.v.count1
	vim.cmd("'<,'>move '<-" .. (count + 1))
	vim.cmd("normal! gv=gv")
end, { desc = "Move selection up" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
