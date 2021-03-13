-- local has_lsp, lspconfig = pcall(require, 'lspconfig')
-- if not has_lsp then
--   return
-- end
local lspconfig = require('lspconfig')

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
end

local function default_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
end

local default_config = {
  on_attach = default_on_attach,
}

-- Language Servers
lspconfig.bashls.setup(default_config)
lspconfig.cssls.setup(default_config)
lspconfig.dockerls.setup(default_config)
lspconfig.html.setup(default_config)
lspconfig.jsonls.setup(default_config)
lspconfig.tsserver.setup(default_config)
lspconfig.vimls.setup(default_config)
lspconfig.pyls.setup(default_config)
-- lspconfig.pyright.setup({
--   on_attach = default_on_attach,
--   settings = {
--     python = {
--       analysis = {
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = false
--       }
--     }
--   }
-- })

local pid = vim.fn.getpid()
local omnisharp_bin = "/opt/omnisharp-roslyn/run"

lspconfig.omnisharp.setup({
    cmd={ omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    on_attach = default_on_attach,
})

-- Lsp Settings
vim.cmd[[sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError]]
vim.cmd[[sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning]]
vim.cmd[[sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation]]
vim.cmd[[sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint]]
vim.cmd[[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]

vim.g.Omnisharp_server_stdio = 0
