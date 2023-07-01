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
    ["<leader>tq"] = { "<CMD> tabclose <CR>", "Close current tab" },
    ["<leader>tt"] = { "<CMD> tab split <CR>", "Open current buffer in a new tab" },
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
    ["<C-p>"] = { "<cmd> Telescope find_files hidden=false <CR>", "find files" },
    ["<leader>fp"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fd"] = { "<cmd> Telescope diagnostics <CR>", "find workspace diagnostics" },
    ["<leader>fb"] = { "<cmd> Telescope git_branches <CR>", "find git branches" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep preview=true <CR>", "Live grep" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "git status" },
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
        vim.diagnostic.open_float { float = { border = "rounded" } }
      end,
      "floating diagnostic",
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  },
}

M.gitsigns = {
  n = {
    -- Actions
    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>hR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "Reset hunk",
    },
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk",
    },
    ["<leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "Stage buffer",
    },
    ["<leader>hu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "Undo stage hunk",
    },
    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>hb"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "Blame line",
    },
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "Toggle blame line",
    },
    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "Diff this",
    },
    ["<leader>hD"] = {
      function()
        require("gitsigns").diffthis "~"
      end,
      "Diff this (against HEAD~)",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.fugitive = {
  n = {
    ["<leader>gp"] = {
      "<cmd> G pull <CR>",
    },
    ["<leader>gP"] = {
      "<cmd> G push <CR>",
    },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
    },
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
    },
    ["<leader>B"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
    },
  },
}

M.dap_go = {
  plugin = true,

  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
    },
  },
}

return M
