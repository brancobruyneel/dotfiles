local present, mason_lsp = pcall(require, "mason-lspconfig")

if not present then
  return
end

local lspconfig = require "lspconfig"
local util = lspconfig.util

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = opts.max_width or 100
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local handlers = {
  function(server_name) -- default handler (optional)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,

  ["rust_analyzer"] = function()
    lspconfig.rust_analyzer.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust_analyzer"] = {
          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            allFeatures = true,
            overrideCommand = {
              "cargo",
              "clippy",
              "--workspace",
              "--message-format=json",
              "--all-targets",
              "--all-features",
            },
          },
        },
      },
    }
  end,

  ["gopls"] = function()
    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.mod", ".git", "go.work"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          completeUnimported = true,
          usePlaceholders = false,
          staticcheck = true,
        },
      },
    }
  end,
}

mason_lsp.setup {
  ensure_installed = {
    "tsserver",
    "bashls",
    "gopls",
    "rust_analyzer",
    "docker_compose_language_service",
  },
  automatic_installation = true,
  handlers = handlers,
}
