if require('config.first_load')() then
    return
end

vim.g.mapleader = ' '

local o = vim.o
local bo = vim.bo
local wo = vim.wo
	
o.termguicolors   = true
o.syntax 	      = 'on'
o.showmode        = false
o.showcmd         = true
o.cmdheight       = 1     -- Height of the command bar
o.incsearch       = true  -- Makes search act like search in modern browsers
o.showmatch       = true  -- Show matching brackets when text indicator is over them
o.ignorecase      = true  -- Ignore case when searching
o.smartcase       = true
o.hidden          = true 
o.splitright      = true
o.splitbelow      = true
o.updatetime      = 1000
o.hlsearch        = true  -- Highlight searches
o.belloff         = 'all'
o.mouse           = 'n'

wo.number         = true  -- display line numbers
wo.relativenumber = true  -- display relative line numbers
wo.wrap           = false
o.splitbelow      = true
o.splitright      = true
o.updatetime      = 400

vim.cmd[[set signcolumn=yes:1]]
vim.cmd[[set tabstop=4]]
vim.cmd[[set softtabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set expandtab]]
vim.cmd[[set ai]]
vim.cmd[[set smartindent]]
o.pumblend = 15

require('config.plugins')
require('config.mappings')
require('config.lsp')
require('config.plugin')
