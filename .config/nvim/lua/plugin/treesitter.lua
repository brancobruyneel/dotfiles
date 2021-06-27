local M = {}

M.config = function()
  local ts_config = require("nvim-treesitter.configs")
  ts_config.setup {
    ensure_installed = "maintained",
    indent = {
      enable = true
    },
    autopairs = {
      enable = true
    },
    highlight = {
      enable = true,
      use_languagetree = true
    }
  }
end

return M
