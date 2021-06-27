local packer = require("packer")
local use = packer.use

return packer.startup {
  function(use)
    use "wbthomason/packer.nvim"

    -- colorscheme
    use "norcalli/nvim-base16.lua"
    use "joshdick/onedark.vim"

    -- syntax
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("plugin/treesitter").config()
      end
    }
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufWinEnter",
      config = function()
        require("colorizer").setup()
      end
    }
    -- status line
    use "hoob3rt/lualine.nvim"
    -- icons
    use "kyazdani42/nvim-web-devicons"


    -- lsp
    use "kabouzeid/nvim-lspinstall"
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("plugin/nvim-lspconfig").config()
      end
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("plugin/lspkind").config()
      end
    }

    use {
      "hrsh7th/nvim-compe",
      event = "InsertEnter",
      config = function()
        require("plugin/compe-completion").config()
      end
    }

    -- formatter
    use {
      "sbdchd/neoformat",
      cmd = "Neoformat"
    }

    -- file managing, fuzzy finder etc
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
        require("plugin/nvimtree").config()
      end
    }

    use {
          "nvim-telescope/telescope.nvim",
        requires = {
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
            {"nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            {"nvim-telescope/telescope-media-files.nvim"},
            {"jremmen/vim-ripgrep"},
        },
        config = function()
          require("plugin/telescope").config()
          require("plugin/telescope")
        end
    }
    -- tpope god
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-fugitive"

    -- autopairs
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("plugin/autopairs").config()
      end
    }

    -- statuptime
    use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

	end,
  {
    display = {
      border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
}
