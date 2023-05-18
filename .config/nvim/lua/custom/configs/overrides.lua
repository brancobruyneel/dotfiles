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
    -- disable = {
    --   "python"
    -- },
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
    custom = { ".git" },
  },

  git = {
    enable = true,
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

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
  },
}

M.telescope = {
  layout_config = {
    horizontal = {},
  },
}

return M
