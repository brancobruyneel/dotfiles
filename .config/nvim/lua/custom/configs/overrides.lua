local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "rust",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "rust-analyzer",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
  },
}

-- git support in nvimtree
M.nvimtree = {
  filters = {
    custom = { "^.git$" },
  },

  git = {
    enable = true,
  },

  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },

  sync_root_with_cwd = true,

  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
    open_file = {
      resize_window = false,
    },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder_arrow = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
}

M.gitsigns = {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
}

M.telescope = {
  defaults = {
    preview = false,
    layout_config = {
      width = function(_, cols, _)
        if cols > 120 then
          return 120
        end

        return math.floor(cols * 0.87)
      end,
    },
    mappings = {
      n = { ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist },
      i = { ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist },
    },
  },

  pickers = {
    live_grep = {
      layout_config = {
        width = 0.87,
      },
    },
  },

  extensions_list = { "themes", "terms", "dap" },
}

return M
