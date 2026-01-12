-- Compatibility shim for environments where the installed nvim-treesitter plugin
-- exposes `nvim-treesitter.config` but not `nvim-treesitter.configs`.
--
-- If the real `configs.lua` exists later on runtimepath, defer to it.
local self = debug.getinfo(1, "S").source
if type(self) == "string" and self:sub(1, 1) == "@" then
    self = self:sub(2)
end

local candidates = vim.api.nvim_get_runtime_file("lua/nvim-treesitter/configs.lua", true)
for _, path in ipairs(candidates) do
    if path ~= self then
        return dofile(path)
    end
end

local data_dir = vim.fn.stdpath("data")
local ts_rtp = data_dir .. "/lazy/nvim-treesitter"
local configs_path = ts_rtp .. "/lua/nvim-treesitter/configs.lua"
local uv = vim.uv or vim.loop

if uv.fs_stat(configs_path) then
    return dofile(configs_path)
end

return require("nvim-treesitter.config")
