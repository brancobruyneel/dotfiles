local M = {}
local override = require "custom.override"

M.plugins = {
  override = {
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["lewis6991/gitsigns.nvim"] = override.gitsigns,
    ["williamboman/mason.nvim"] = override.mason,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
  },
  user = require "custom.plugins",
  remove = {
    "NvChad/nvterm",
  },
}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
}

M.mappings = require "custom.mappings"

return M
