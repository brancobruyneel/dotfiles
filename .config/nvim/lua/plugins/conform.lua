return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				ts = { "biome", "prettierd" },
				markdown = { "prettierd" },
				html = { "prettierd" },
				go = { "goimports", "gofmt", "gofumpt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback"
			},
			format_after_save = {
				lsp_format = "fallback"
			}
		},
	},
}
