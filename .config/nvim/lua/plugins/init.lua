return {
	{ "folke/neodev.nvim", opts = {} },

	{
		"folke/which-key.nvim",
		enabled = false,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			return {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"vim",
					"lua",
					"vimdoc",
					"html",
					"css",
				},
			}
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local nvchad_opts = require "nvchad.configs.cmp"
			local opts = vim.tbl_deep_extend("force", nvchad_opts, require "configs.cmp")

			table.insert(opts.sources, 1, {
				name = "copilot",
				group_index = 1,
				priority = 100,
			})

			return opts
		end,
	},
}
