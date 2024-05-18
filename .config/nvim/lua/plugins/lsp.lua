return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neodev.nvim", opts = {
        library = { plugins = true },
      } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      dofile(vim.g.base46_cache .. "lsp")
      require "nvchad.lsp"

      require "configs.lspconfig"
    end,
  },
}
