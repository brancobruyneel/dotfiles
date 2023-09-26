---@type MappingsTable
-- more keybinds!

local M = {}

M.general = {
  n = {
    -- disable
    ["H"] = { "" },
    ["L"] = { "" },
    ["<leader>n"] = { "" },

    ["<C-w>>"] = { "10<C-w>>" },
    ["<C-w><"] = { "10<C-w><" },

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
    ["<leader>kb"] = { "<cmd> Telescope keymaps <CR>", "keybinds" },
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

    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
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
      "<gitsigns> Reset hunk",
    },
    ["<leader>hR"] = {
      function()
        require("gitsigns").reset_buffer()
      end,
      "<gitsigns> Reset hunk",
    },
    ["<leader>hs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "<gitsigns> Stage hunk",
    },
    ["<leader>hS"] = {
      function()
        require("gitsigns").stage_buffer()
      end,
      "<gitsigns> Stage buffer",
    },
    ["<leader>hu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "<gitsigns> Undo stage hunk",
    },
    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "<gitsigns> Preview hunk",
    },
    ["<leader>hb"] = {
      function()
        require("gitsigns").blame_line { full = true }
      end,
      "<gitsigns> Blame line",
    },
    ["<leader>tb"] = {
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      "<gitsigns> Toggle blame line",
    },
    ["<leader>hd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "<gitsigns> Diff this",
    },
    ["<leader>hD"] = {
      function()
        require("gitsigns").diffthis "~"
      end,
      "<gitsigns> Diff this (against HEAD~)",
    },
    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "<gitsigns> Toggle deleted",
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
    ["<leader>dc"] = {
      "<cmd> Telescope dap commands <CR>",
      "DAP commands",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "<dap> Continue",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "<dap> Step over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "<dap> Step into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "<dap> Step out",
    },
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "<dap> Toggle breakpoint",
    },
    ["<leader>B"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "<dap> Set breakpoint conidition",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "<dap> Show scopes",
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
      "<dap-go> Debug test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "<dap-go> Debug last",
    },
  },
}

M.neotest = {
  n = {
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "<neotest> Test current file",
    },
    ["<leader>tl"] = {
      function()
        require("neotest").run.last()
      end,
      "<neotest> Test last",
    },
    ["<leader>tw"] = {
      function()
        require("neotest").watch.toggle(vim.fn.expand "%")
      end,
      "<neotest> Watch current file",
    },
    ["<leader>tn"] = {
      function()
        require("neotest").run.run()
      end,
      "<neotest> Run close test",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").run.stop()
      end,
      "<neotest> Stop test",
    },
    ["<leader>te"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "<neotest> Toggle summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output_panel.toggle()
      end,
      "<neotest> Toggle output panel",
    },
    ["[t"] = {
      function()
        require("neotest").jump.prev()
      end,
      "<neotest> Jump to previous test",
    },
    ["]t"] = {
      function()
        require("neotest").jump.next()
      end,
      "<neotest> Jump to next test",
    },
  },
}

return M
