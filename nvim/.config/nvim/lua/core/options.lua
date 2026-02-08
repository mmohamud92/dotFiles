vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.swapfile = false

-- Auto-save current buffer every 5 minutes
local autosave_timer = vim.uv.new_timer()
autosave_timer:start(
    300000, -- 5 minutes in ms
    300000, -- repeat every 5 minutes
    vim.schedule_wrap(function()
        local buf = vim.api.nvim_get_current_buf()
        if vim.bo[buf].modified and vim.bo[buf].modifiable and vim.fn.bufname(buf) ~= "" then
            vim.api.nvim_buf_call(buf, function()
                vim.cmd("silent! write")
            end)
        end
    end)
)

opt.splitbelow = true
opt.splitright = true

opt.wrap = true
opt.linebreak = true -- Wrap at word boundaries
opt.breakindent = true -- Preserve indentation when wrapping

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
