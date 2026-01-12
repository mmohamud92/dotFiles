-- Compatibility shim for environments where `nvim-treesitter` isn't being picked
-- up from runtimepath correctly.
--
-- Prefer any real `utils.lua` found later on runtimepath; otherwise try the
-- expected lazy.nvim install path under stdpath("data").
local self = debug.getinfo(1, "S").source
if type(self) == "string" and self:sub(1, 1) == "@" then
    self = self:sub(2)
end

local candidates = vim.api.nvim_get_runtime_file("lua/nvim-treesitter/utils.lua", true)
for _, path in ipairs(candidates) do
    if path ~= self then
        return dofile(path)
    end
end

local data_dir = vim.fn.stdpath("data")
local ts_rtp = data_dir .. "/lazy/nvim-treesitter"
local utils_path = ts_rtp .. "/lua/nvim-treesitter/utils.lua"

local uv = vim.uv or vim.loop
if uv.fs_stat(utils_path) then
    return dofile(utils_path)
end

error("nvim-treesitter.utils not found (checked runtimepath and " .. utils_path .. ")")

