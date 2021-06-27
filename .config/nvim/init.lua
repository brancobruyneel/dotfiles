if require("config.first_load")() then
    return
end

require("config.pluginList")
require("config.options")

local g = vim.g

g.mapleader = " "
g.theme = "onedark"

require("config.highlights")
require("config.mappings")

require("plugin.webdevicons")
require("plugin.autopairs")
require("plugin.lualine")
