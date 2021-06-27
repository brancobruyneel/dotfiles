local utils = require("config.utils")

-- Completion
vim.cmd[[inoremap <silent><expr> <CR> compe#confirm("<CR>")]]
vim.cmd[[smap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"]]
vim.cmd[[imap <expr> <C-l>   vsnip#available(1)  ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"]]

-- Diagnostics
utils.map("n", "<leader>dn", ":lua vim.lsp.diagnostic.goto_next()<CR>")
utils.map("n", "<leader>dp", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
utils.map("n", "<leader>ds", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")

-- LSP
utils.map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
utils.map("n", "gD", ":lua vim.lsp.buf.declaration()<CR>")
utils.map("n", "gi", ":lua vim.lsp.buf.implementation()<CR>")
utils.map("n", "gw", ":lua vim.lsp.buf.document_symbol()<CR>")
utils.map("n", "gW", ":lua vim.lsp.buf.workspace_symbol()<CR>")
utils.map("n", "gr", ":lua vim.lsp.buf.references()<CR>")
utils.map("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>")
utils.map("n", "K", ":lua vim.lsp.buf.hover()<CR>")
utils.map("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<CR>")
-- utils.map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
utils.map("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
utils.map("n", "<leader>ff", ":lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>")

-- Telescope
utils.map_tele("<C-p>", "find_files")
utils.map_tele("<leader>fp", "preview_files")
utils.map_tele("<leader>fg", "git_files")
utils.map_tele("<leader>fs", "live_grep")
utils.map_tele("<leader>fh", "find_help")
utils.map_tele("<leader>fb", "buffers")
utils.map_tele("<leader>fd", "search_dotfiles")
utils.map_tele("<leader>fm", "media_files")
utils.map_tele("<leader>fwd", "lsp_workspace_diagnostics")
utils.map_tele("<leader>ca", "lsp_code_actions")

-- NvimTree
utils.map("n", "<leader>ne", ":NvimTreeToggle<CR>")

-- Misc
utils.map("", "<leader> ", ":noh<CR>")

-- Clipboard
utils.map("n", "<leader>y", '"+y')
utils.map("v", "<leader>y", '"+y')
utils.map("n", "<leader>Y", ":%y+<CR>")
