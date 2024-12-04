return {
	"ThePrimeagen/harpoon",
	event = "BufEnter",
	branch = "harpoon2",
	config = function()
		local harpoon = require "harpoon"
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list(), {
				ui_max_width = 100,
			})
		end)
	end,
}
