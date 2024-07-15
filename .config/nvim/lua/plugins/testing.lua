return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-go",
  },
  cmd = { "Neotest" },
  keys = {
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      desc = "<neotest> Test current file",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "<neotest> Test last",
    },
    {
      "<leader>tw",
      function()
        require("neotest").watch.toggle(vim.fn.expand "%")
      end,
      desc = "<neotest> Watch current file",
    },
    {
      "<leader>tn",
      function()
        require("neotest").run.run()
      end,
      desc = "<neotest> Run close test",
    },
    {
      "<leader>ts",
      function()
        require("neotest").run.stop()
      end,
      desc = "<neotest> Stop test",
    },
    {
      "<leader>te",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "<neotest> Toggle summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "<neotest> Toggle output panel",
    },
    {
      "[t",
      function()
        require("neotest").jump.prev()
      end,
      desc = "<neotest> Jump to previous test",
    },
    {
      "]t",
      function()
        require("neotest").jump.next()
      end,
      desc = "<neotest> Jump to next test",
    },
  },

  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-go",
      },
    }
  end,
}
