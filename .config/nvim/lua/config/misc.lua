local vim = vim
local lualine = require('lualine')

lualine.status()
lualine.theme = 'gruvbox'
lualine.sections.lualine_x = { require('lualine.components.filetype') }

vim.g.colors_name = 'gruvbox'
vim.g.gruvbox_contrast_dark = 'hard'

vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 1
vim.g.netrw_winsize = 25
