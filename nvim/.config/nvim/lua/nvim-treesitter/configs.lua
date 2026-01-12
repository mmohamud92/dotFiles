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

return require("nvim-treesitter.config")

