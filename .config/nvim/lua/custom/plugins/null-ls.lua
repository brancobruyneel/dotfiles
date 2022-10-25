local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.diagnostics.eslint_d,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- code actions
  b.code_actions.eslint_d,

  -- formatting
  -- b.formatting.eslint_d,
  b.formatting.prettierd.with {
    filetypes = {
      "html",
      "json",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "yaml",
      "scss",
      "css",
      "markdown",
    },
  },
  b.formatting.rustfmt.with {
    extra_args = function(params)
      local Path = require "plenary.path"
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  },
  b.formatting.stylua,

  b.formatting.shfmt,
  b.formatting.terraform_fmt,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
