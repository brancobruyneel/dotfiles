---@type MappingsTable
-- more keybinds!

local M = {}

M.general = {
  n = {
    -- disable
    ["H"] = { "" },
    ["L"] = { "" },
    ["<leader>n"] = { "" },

    -- tabs
    ["<leader>tq"] = { "<CMD> tabclose <CR>" },
    ["<leader>1"] = { "1gt" },
    ["<leader>2"] = { "2gt" },
    ["<leader>3"] = { "3gt" },
    ["<leader>4"] = { "4gt" },
    ["<leader>5"] = { "5gt" },
    ["<leader>6"] = { "6gt" },
  },

  v = {
    ["<leader>y"] = { '"+y', "visual copy" },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fp"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "find workspace diagnostics" },
    ["<leader>fb"] = { "<cmd> Telescope git_branches <CR>", "find git branches" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep preview=true <CR>", "Live grep" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>ne"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.lsp = {
  n = {
    ["ge"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  },
}

return M
