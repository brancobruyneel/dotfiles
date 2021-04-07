return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use {
        'gruvbox-community/gruvbox',
        config = function()
            require('config.plugin.colorscheme')
        end
    }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'kabouzeid/nvim-lspinstall'
    use 'onsails/lspkind-nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-media-files.nvim'},
            {'jremmen/vim-ripgrep'},
        },
        config = function()
            require('config.plugin.telescope')
        end
    }

    -- syntax
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('config.plugin.treesitter')
        end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('config.plugin.colorizer')
        end
    }

    -- file explorer
    use {
        'kyazdani42/nvim-tree.lua',
        config = function ()
            require('config.plugin.nvimtree')
        end
    }

    -- icons
    use {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require('config.plugin.webdevicons')
        end
    }

    -- startuptime
    use 'tweekmonster/startuptime.vim'

    -- tpope god
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    -- status line
    use {
        'hoob3rt/lualine.nvim',
        after = "gruvbox",
        config = function()
            require('config.plugin.lualine')
        end
    }
    
	end
}
