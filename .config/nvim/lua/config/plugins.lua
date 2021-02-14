local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return packer.startup(function()
  local use = use
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'

  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'
  use 'jremmen/vim-ripgrep'

  use 'preservim/nerdtree'
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use 'sheerun/vim-polyglot'

  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
--  use 'itchyny/lightline.vim'
  use 'ryanoasis/vim-devicons'
  use 'hoob3rt/lualine.nvim'

  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'gruvbox-community/gruvbox'
  end
)
