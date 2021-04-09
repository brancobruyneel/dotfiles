if require('config.first_load')() then
    return
end

local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

g.mapleader = ' '

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

wo.signcolumn     = 'yes:1'

vim.cmd[[set tabstop=4]]
vim.cmd[[set softtabstop=4]]
vim.cmd[[set shiftwidth=4]]
vim.cmd[[set expandtab]]
vim.cmd[[set ai]]
vim.cmd[[set smartindent]]

vim.cmd[[set noswapfile]]

require('config.plugins')
require('config.mappings')
require('config.lsp')
require('plugin')
