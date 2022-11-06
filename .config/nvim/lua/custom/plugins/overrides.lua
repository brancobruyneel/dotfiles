local M = {}

M.telescope = {
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },

  pickers = {
    find_files = {
      previewer = false,
      layout_config = {
        width = 100,
        height = 50,
      },
    },
    ui_select = {},
  },

  extensions_list = { "themes", "terms", "fzf" },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "typescript",
    "regex",
    "python",
    "json",
    "toml",
    "yaml",
    "rust",
    "markdown",
    "c",
    "bash",
    "lua",
  },
}

M.nvimtree = {
  filters = {
    custom = { ".git", ".github" },
  },

  git = {
    enable = true,
    ignore = true,
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

M.blankline = {
  show_current_context_start = false,
}

-- M.cmp = {
--   mapping = {
--     ["<C-Space>"] = require("cmp").mapping.complete {
--       config = {
--         sources = {
--           { name = "nvim_lsp" },
--         },
--       },
--     },
--   },
-- }

return M
