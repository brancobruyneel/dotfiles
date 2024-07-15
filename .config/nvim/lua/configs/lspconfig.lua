local configs = require "nvchad.configs.lspconfig"

local x = vim.diagnostic.severity

vim.diagnostic.config {
  underline = false,
  virtual_text = false,
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  float = {
    show_header = true,
    source = "if_many",
    border = "rounded",
    focusable = false,
  },
  update_in_insert = true,
  severity_sort = true,
}

local on_attach = function(client, bufnr)
  configs.on_attach(client, bufnr)

  vim.keymap.set("n", "ge", vim.diagnostic.open_float, { desc = "show diagnostic" })
end

local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

require("mason-lspconfig").setup_handlers {
  -- default lsp setup
  function(server_name)
    lspconfig[server_name].setup {
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["lua_ls"] = function(server_name)
    lspconfig[server_name].setup {
      on_init = on_init,
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
              [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
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
      on_init = on_init,
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
      on_init = on_init,
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = lspconfig.util.root_pattern("go.mod", ".git", "go.work"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          gofumpt = true,
          completeUnimported = true,
          usePlaceholders = false,
          staticcheck = true,
        },
      },
    }
  end,
}
