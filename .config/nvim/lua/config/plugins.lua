return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- auto load files from lua/plugin
    use 'tjdevries/astronauta.nvim'

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
        }
    }

    -- syntax
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'norcalli/nvim-colorizer.lua'

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- colorscheme
    use 'gruvbox-community/gruvbox'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- startuptime
    use 'tweekmonster/startuptime.vim'

    -- tpope god
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'

    -- status line
    use 'hoob3rt/lualine.nvim'
    
	end
}
