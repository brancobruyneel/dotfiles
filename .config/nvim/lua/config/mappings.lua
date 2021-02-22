local utils = require'config.utils'

local setup_mappings = function()
  -- Temp commands
  vim.cmd[[autocmd BufWritePre *.py,*.cs :lua vim.lsp.buf.formatting_sync()]]
  vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.yml,*yaml :Prettier]]

  -- Completion
  vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
  vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
  vim.cmd[[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]

  -- Diagnostics
  utils.key_mapper('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.key_mapper('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.key_mapper('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

  -- LSP
  utils.key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  utils.key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  utils.key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  utils.key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
  utils.key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
  utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  utils.key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
  utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  utils.key_mapper('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
  utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

  -- Telescope
  utils.key_mapper('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
  utils.key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
  utils.key_mapper('n', '<leader>fw', ':lua require"telescope.builtin".grep_string(vim.fn.expand("<cword>"))<CR>')
  utils.key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
  utils.key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
  utils.key_mapper('n', '<leader>fq', ':lua require"telescope.builtin".quickfix()<CR>')

  -- Nerdtree
  utils.key_mapper('n', '<leader>ne', ':NERDTreeToggle<CR>')

  -- Misc
  utils.key_mapper('', '<leader> ', ':noh<CR>')

  -- Clipboard
  utils.key_mapper('n', '<leader>y', '"+y')
  utils.key_mapper('v', '<leader>y', '"+y')
  utils.key_mapper('n', '<leader>Y', 'gg"+yG')

end

setup_mappings()
