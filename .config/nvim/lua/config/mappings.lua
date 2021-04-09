local utils = require('config.utils')

local setup_mappings = function()
  -- Temp commands
  -- vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.yml,*yaml :Prettier]]

  -- Completion
  vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
  vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
  vim.cmd[[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]


  -- Diagnostics
  utils.map('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>')
  utils.map('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>')
  utils.map('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

  -- LSP
  utils.map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  utils.map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
  utils.map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  utils.map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
  utils.map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
  utils.map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  utils.map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
  utils.map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  utils.map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  utils.map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>')
  utils.map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
  utils.map('n', '<leader>ff', ':lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>')

  -- Telescope
  utils.map('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
  -- utils.map('n', '<leader>ff', ':lua require"telescope.builtin".file_browser()<CR>')
  utils.map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
  utils.map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
  utils.map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
  utils.map('n', '<leader>fq', ':lua require"telescope.builtin".quickfix()<CR>')
  utils.map('n', '<leader>fd', ':lua require"config.plugin.telescope".search_dotfiles()<CR>')
  utils.map('n', '<leader>fm', ':lua require"telescope".extensions.media_files.media_files()<CR>')
  utils.map('n', '<leader>fwd', ':lua require"config.plugin.telescope".lsp_workspace_diagnostics()<CR>')
  utils.map('n', '<leader>fca', ':lua require"telescope.builtin".lsp_code_actions()<CR>')


  -- Nerdtree
  utils.map('n', '<leader>ne', ':NvimTreeToggle<CR>')

  -- Misc
  utils.map('', '<leader> ', ':noh<CR>')

  -- Clipboard
  utils.map('n', '<leader>y', '"+y')
  utils.map('v', '<leader>y', '"+y')
  utils.map('n', '<leader>Y', ':%y+<CR>')
end

setup_mappings()
