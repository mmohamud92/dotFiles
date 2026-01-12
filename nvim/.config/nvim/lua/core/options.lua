vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.wrap = false

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.clipboard = "unnamedplus"

-- keeps scroll in the middle
-- whilst scrolling
opt.scrolloff = 999

opt.virtualedit = "block"

opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

-- Better completion popup behavior (used by blink.cmp and built-in completion UI)
opt.completeopt = { "menu", "menuone", "noselect" }
