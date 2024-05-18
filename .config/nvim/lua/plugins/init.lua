return {
  { "folke/neodev.nvim", opts = {} },

  {
    "folke/which-key.nvim",
    enabled = false,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local nvchad_opts = require "nvchad.configs.cmp"
      local opts = require "configs.cmp"
      return vim.tbl_deep_extend("force", nvchad_opts, opts)
    end,
  },
}
