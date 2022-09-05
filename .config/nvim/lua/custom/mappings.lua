local M = {}

M.general = {
  i = {
    ["C-BS"] = { "<C-w>", "delete the previous word in insert mode" },
  },
  n = {
    ["<leader>y"] = { "<cmd> %y+ <CR>", "copy whole file" },
    ["H"] = { "" },
    ["L"] = { "" },
  },
}

M.packer = {
  n = {
    ["<leader>ps"] = { "<cmd> PackerSync <CR>", "sync packer" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>ne"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.lsp = {
  n = {
    ["<leader>f"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["ge"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto_next",
    },
  },
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fp"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
  },
}

M.gitsigns = {
  n = {
    ["]c"] = {
      function()
        local gs = require "gitsigns"
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end,
    },
    ["[c"] = {
      function()
        local gs = require "gitsigns"
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end,
    },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>", "reset hunk" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>", "reset git buffer" },
  },
  v = {
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>" },
  },
}

return M
