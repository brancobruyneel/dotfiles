local M = {}

M.plugins = require "custom.plugins"

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
}

M.mappings = require "custom.mappings"

return M
