if require('config.first_load')() then
    return
end

vim.g.mapleader = ' '

require('config.plugins')
require('config.options')

require('colorizer').setup()
require('nvim-autopairs').setup()

require('plugin.webdevicons')
require('plugin.statusline')
require('plugin.treesitter')
require('plugin.telescope')
require('plugin.nvimtree')

require('config.lsp')
require('config.mappings')
