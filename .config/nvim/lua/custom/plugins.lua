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
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = function(_, _)
          local dap, dapui = require "dap", require "dapui"
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
          end
        end,
        lazy = false,
      },
      {
        "mfussenegger/nvim-dap-go",
        ft = "go",
        config = function(_, opts)
          require("dap-go").setup(opts)
          require("core.utils").load_mappings "dap_go"
        end,
      },
    },
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
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
