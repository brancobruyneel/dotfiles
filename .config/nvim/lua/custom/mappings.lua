local M = {}

M.general = {
  i = {
    ["C-BS"] = { "<C-w>", "delete the previous word in insert mode" },
  },
  n = {
    ["<leader>Y"] = { ":%y+ <CR>", "copy whole file" },
    ["<leader>y"] = { '"+Y', "copy" },
    ["<leader>h"] = { "" },
    ["<leader>n"] = { "" },
    ["<leader>tq"] = { "<CMD> tabclose <CR>" },
    ["<leader>1"] = { "1gt" },
    ["<leader>2"] = { "2gt" },
    ["<leader>3"] = { "3gt" },
    ["<leader>4"] = { "4gt" },
    ["<leader>5"] = { "5gt" },
    ["<leader>6"] = { "6gt" },
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
  plugin = true,
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
    ["<leader>fb"] = { "<cmd> Telescope git_branches <CR>", "find git branches" },
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
    ["<leader>hS"] = { "<cmd> Gitsigns stage_buffer <CR>", "reset hunk" },
    ["<leader>hs"] = { "<cmd> Gitsigns stage_hunk <CR>" },
    ["<leader>hu"] = { "<cmd> Gitsigns undo_stage_hunk <CR>", "reset hunk" },
    ["<leader>hR"] = { "<cmd> Gitsigns reset_buffer <CR>", "reset hunk" },
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>" },
    ["<leader>hp"] = { "<cmd> Gitsigns preview_hunk <CR>", "reset hunk" },
    ["<leader>hb"] = {
      function()
        local gs = require "gitsigns"
        gs.blame_line { full = true }
      end,
    },
    ["<leader>tb"] = { "<cmd> Gitsigns toggle_current_line_blame <CR>", "reset hunk" },
    ["<leader>td"] = { "<cmd> Gitsigns toggle_deleted <CR>" },
  },
  v = {
    ["<leader>hr"] = { "<cmd> Gitsigns reset_hunk <CR>" },
    ["<leader>hs"] = { "<cmd> Gitsigns stage_hunk <CR>" },
  },
}

M.diffview = {
  n = {
    ["<leader>do"] = { "<cmd> DiffviewOpen <CR>" },
    ["<leader>dq"] = { "<cmd> DiffviewClose <CR>" },
  },
}

M.mind = {
  n = {
    ["<leader>mo"] = { "<cmd> MindOpenMain <CR>" },
    ["<leader>mq"] = { "<cmd> MindClose <CR>" },
  },
}

return M
