local M = {}

M.treesitter_context = function()
  require("treesitter-context").setup {}
end

return M
