vim.g.mapleader = ' '

local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = true
o.incsearch = true
o.hidden = true
o.completeopt = "menuone,noselect"
bo.autoindent = true
bo.smartindent = true
o.mouse = 'a'

wo.number = true -- display line numbers
wo.relativenumber = true -- display relative line numbers
wo.wrap = false
o.splitbelow = true
o.splitright = true
o.updatetime = 400

vim.cmd[[set signcolumn=yes:1]]
vim.cmd[[set tabstop=2]]
vim.cmd[[set softtabstop=2]]
vim.cmd[[set shiftwidth=2]]
vim.cmd[[set expandtab]]
vim.cmd[[syntax enable"]]
vim.cmd[[syntax on]]

require'config'
