local override = require "custom.plugins.overrides"

return {
  ["NvChad/nvtrem"] = false,

  ["williamboman/mason-lspconfig.nvim"] = {},

  ["neovim/nvim-lspconfig"] = {
    after = "mason.nvim",
    config = function()
      require "custom.plugins.mason-lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["tpope/vim-fugitive"] = {},
  ["tpope/vim-surround"] = {},
  ["tpope/vim-repeat"] = {},

  ["nvim-telescope/telescope-ui-select.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },

  ["nvim-treesitter/nvim-treesitter-context"] = {},

  ["iamcco/markdown-preview.nvim"] = {
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  ["phaazon/mind.nvim"] = {
    branch = "v2.2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.plugins.mind"
    end,
  },

  ["sindrets/diffview.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
  },

  -- overrides
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = override.nvimtree,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = override.treesitter,
  },
  ["lewis6991/gitsigns.nvim"] = {
    override_options = override.gitsigns,
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = override.blankline,
  },
}
