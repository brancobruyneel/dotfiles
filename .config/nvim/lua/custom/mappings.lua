local M = {}

M.general = {
  i = {
    ["C-BS"] = { "<C-w>", "delete the previous word in insert mode" },
  },
  n = {
    ["<leader>Y"] = { ":%y+ <CR>", "copy whole file" },
    ["<leader>y"] = { '"+Y', "copy" },
    ["H"] = { "" },
    ["L"] = { "" },
  },
  v = {
    ["<leader>y"] = { '"+y', "visual copy" },
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
    ["<leader>rn"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
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
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "find workspace diagnostics" },
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
