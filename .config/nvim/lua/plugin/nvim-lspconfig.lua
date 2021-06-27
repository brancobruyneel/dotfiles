local M = {}

M.config = function ()
  lspconfig = require("lspconfig")

  -- Diagnostics
  local function setup_diagnostics()
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
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

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  local default_config = {
    on_attach = default_on_attach,
    capabilities = capabilities,
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

  local pid = vim.fn.getpid()
  local omnisharp_bin = "/opt/omnisharp-roslyn/run"
  lspconfig.omnisharp.setup({
      cmd={ omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
      on_attach = function(client)
        vim.g.Omnisharp_server_stdio = 0,
        default_on_attach(client)
      end
  })

  -- Lsp Settings
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})
end

return M
