local small_layout = {
	width = function(_, cols, _)
		if cols > 120 then
			return 120
		end

		return math.floor(cols * 0.87)
	end,
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-ui-select.nvim",
	},
	cmd = "Telescope",
	opts = {
		defaults = {
			mappings = {
				i = {
					['<C-p>'] = require('telescope.actions.layout').toggle_preview
				}
			},
		},
		pickers = {
			git_branches = {
				previewer = false,
				layout_config = small_layout,
			},
			diagnostics = {
				previewer = false,
				layout_config = small_layout,
			},
			keymaps = {
				previewer = false,
				layout_config = small_layout,
			},
		},
		extensions_list = { "themes", "terms", "dap" },
	},
}
