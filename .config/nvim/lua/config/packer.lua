local execute = vim.api.nvim_command

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd[[packadd packer.nvim]]

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return packer.startup(function()
  use 'wbthomason/packer.nvim'
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'anott03/nvim-lspinstall'
  use 'onsails/lspkind-nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-media-files.nvim'},
      {'jremmen/vim-ripgrep'},
    }
  }

  use 'kyazdani42/nvim-web-devicons'
  -- use 'akinsho/nvim-bufferline.lua'

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- syntax
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  use 'norcalli/nvim-colorizer.lua'

  use {'prettier/vim-prettier', run = 'yarn install' }

  use 'tweekmonster/startuptime.vim'

  -- tpope god
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'

  use {
    'gruvbox-community/gruvbox',
    config = function()
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.g.gruvbox_sign_column = 'bg0'
      vim.api.nvim_exec([[ colo gruvbox ]], false)
    end
  }
  use 'hoob3rt/lualine.nvim'

  end
)
