return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'norcalli/nvim-base16.lua'
    use "nekonako/xresources-nvim"

    -- syntax
    use 'nvim-treesitter/nvim-treesitter'
    use 'norcalli/nvim-colorizer.lua'

    -- status line
    -- use "glepnir/galaxyline.nvim"
    use 'hoob3rt/lualine.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

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

    -- tpope god
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'

    -- statuptime
    use 'tweekmonster/startuptime.vim'
	end
}
