local on_attach = require("custom.plugins.lspconfig").on_attach
local capabilities = require("custom.plugins.lspconfig").capabilities

local lspconfig = require "lspconfig"

require("mason-lspconfig").setup {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-ls",
    "json-lsp",

    "rust-analyzer",

    -- shell
    "shfmt",
    "shellcheck",
  },
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["tailwindcss"] = function()
    lspconfig.tailwindcss.setup {
      filetypes = { "html", "css", "javascript", "typescript", "typescriptreact", "rust" },
      init_options = {
        userLanguages = {
          rust = "html",
        },
      },
    }
  end,

  ["rust_analyzer"] = function()
    lspconfig["rust_analyzer"].setup {
      settings = {
        ["rust-analyzer"] = {
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

  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    }
  end,
}
