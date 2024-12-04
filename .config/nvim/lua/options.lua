require "nvchad.options"

local opt = vim.opt
local o = vim.o

o.clipboard = ""

o.wrap = false

-- Numbers
o.relativenumber = true

o.expandtab = false

-- Folds
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.fillchars = { eob = " ", fold = " " }

vim.cmd [[set nofen]]
vim.cmd [[set pumheight=20]]
