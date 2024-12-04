return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup {}
		end,
	},
	-- copilot cmp source
	{
		"zbirenbaum/copilot-cmp",
		dependencies = "copilot.lua",
		opts = {},
		config = function(_, opts)
			local copilot_cmp = require "copilot_cmp"
			copilot_cmp.setup(opts)
		end,
	},
}
