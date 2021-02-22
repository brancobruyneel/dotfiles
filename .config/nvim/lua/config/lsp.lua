local lspconfig = require'lspconfig'
local completion = require'completion'

-- Diagnostics
local function setup_diagnostics()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = true,
    }
  )
  vim.cmd[[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=]]
  vim.cmd[[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl=]]
end

local function default_on_attach(client)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
  setup_diagnostics()
end

local default_config = {
  on_attach = default_on_attach,
}

local pid = vim.fn.getpid()
local omnisharp_bin = "/opt/omnisharp-roslyn/run"

-- Language Servers
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.omnisharp.setup({
    cmd={ omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = default_on_attach,
})
lspconfig.tsserver.setup(default_config)
lspconfig.vimls.setup(default_config)
lspconfig.pyls.setup(default_config)

-- Lsp Settings
vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
vim.g.Omnisharp_server_stdio = 0

-- Completion Settings
vim.o.pumheight = 12
vim.g.completion_abbr_length = 24
vim.g.completion_menu_length = 48
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
