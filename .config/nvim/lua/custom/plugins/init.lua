return {
  ["williamboman/mason-lspconfig.nvim"] = {},

  ["neovim/nvim-lspconfig"] = {
    after = "mason.nvim",
    config = function()
      require "custom.plugins.mason-lspconfig"
      vim.diagnostic.config {
        underline = false,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        severity_sort = true,
      }
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
}
