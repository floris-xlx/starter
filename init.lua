vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- set the clipboard provider
vim.opt.clipboard = "unnamedplus"

-- adjust the default tabs 
vim.opt.shiftwidth = 4

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system {"git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath}
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({{
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
        require "options"
    end
}, -- ...existing code...
{
    import = "plugins"
}}, lazy_config)

local defaults_path = vim.g.base46_cache .. "defaults.lua"
local statusline_path = vim.g.base46_cache .. "statusline.lua"

-- load theme if cached artifacts are present
if vim.loop.fs_stat(defaults_path) then
    pcall(dofile, defaults_path)
end
if vim.loop.fs_stat(statusline_path) then
    pcall(dofile, statusline_path)
end

require "nvchad.autocmds"

vim.schedule(function()
    require "mappings"
end)
