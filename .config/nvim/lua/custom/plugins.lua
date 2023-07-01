local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "jose-elias-alvarez/null-ls.nvim",
      },
    },
    config = function()
      require "custom.configs.null-ls"
      require "custom.configs.mason-lspconfig"
      require "plugins.configs.lspconfig"

      vim.diagnostic.config {
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
      }
    end, -- Override to setup mason-lspconfig
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return require "custom.configs.cmp"
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },

  -- override plugin configs
  {
    "nvterm",
    enabled = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context_start = false,
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- custom plugins
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require "custom.configs.diffview"
    end,
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "folke/which-key.nvim",
    enabled = false,
  },
}

return plugins
