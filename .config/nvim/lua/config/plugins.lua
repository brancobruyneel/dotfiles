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
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'anott03/nvim-lspinstall'

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'jremmen/vim-ripgrep'}}
  }

  use 'tpope/vim-fugitive'

  use 'sheerun/vim-polyglot'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  use 'ryanoasis/vim-devicons'
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'tpope/vim-commentary'
  use 'tweekmonster/startuptime.vim'


  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use {
    'preservim/nerdtree',
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeMinimalUI = 1
      vim.g.NERDTreeDirArrowExpandable = ''
      vim.g.NERDTreeDirArrowCollapsible = ''
    end
  }

  use {
    'gruvbox-community/gruvbox',
    config = function()
      vim.g.gruvbox_contrast_dark = 'hard'
      vim.api.nvim_exec([[ colo gruvbox ]], false)
    end
  }
  
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      local lualine = require('lualine')
      lualine.options = {
        section_separators = {'', ''},
        component_separators = {'', ''},
        theme = 'gruvbox',
        icons_enabled = true,
      }
      lualine.sections.lualine_c = { { 'diagnostics', sources = { 'nvim_lsp' } }, 'filename' }
      lualine.extensions = { 'fzf' }
      lualine.status()
    end
  }
  end
)
