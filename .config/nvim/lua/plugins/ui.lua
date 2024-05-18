return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- overrides
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local nvchad_opts = require "nvchad.configs.nvimtree"
      local opts = require "configs.nvimtree"

      return vim.tbl_deep_extend("force", nvchad_opts, opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      scope = { show_start = false },
    },
  },
}
