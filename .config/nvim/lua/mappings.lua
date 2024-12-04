require "nvchad.mappings"

local map = vim.keymap.set

-- disable nvchad keybinds
map("n", "H", "")
map("n", "L", "")
map("n", "<leader>n", "")
map("n", "<leader>h", "")
map("n", "<leader>v", "")
map("n", "<leader>t", "")
map("n", "<leader>b", "")
map("n", "<leader>fb", "")

map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

for _, idx in ipairs { 1, 2, 3, 4, 5 } do
	map("n", string.format("<leader>%d", idx), "<CMD>")
end

-- git
map("n", "<leader>gp", "<CMD> G pull <CR>", { desc = "git pull" })

-- clipboard
map("n", "<leader>y", '"+y', { desc = "copy to system clipboard" })
map("v", "<leader>y", '"+y', { desc = "visual copy to system clipboard" })

-- tabs
map("n", "<leader>tq", "<CMD> tabclose <CR>", { desc = "Close current tab" })
map("n", "<leader>ts", "<CMD> tabsplit <CR>", { desc = "Open current buffer in a new tab" })

-- nvimtree
map("n", "<leader>ne", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree Toggle window" })

-- telescope
map("n", "<C-p>", "<CMD> Telescope find_files <CR>", { desc = "Find files" })
map("n", "<leader>fp", "<CMD> Telescope buffers <CR>", { desc = "Find buffers" })
map("n", "<leader>fw", "<CMD> Telescope live_grep <CR>", { desc = "Live grep" })
map("n", "<leader>fa", "<CMD> Telescope find_files hidden=true no_ignore=true <CR>", { desc = "Find all files" })
map("n", "<leader>fd", "<CMD> Telescope diagnostics <CR>", { desc = "find workspace diagnostics" })
map("n", "<leader>gs", "<CMD> Telescope git_status hidden=true no_ignore=true <CR>", { desc = "Grep git status" })
map("n", "<leader>kb", "<CMD> Telescope keymaps hidden=true no_ignore=true <CR>", { desc = "Find keybinds" })
map("n", "<leader>fb", "<CMD> Telescope git_branches <CR>", { desc = "Find branches" })
map("n", "<leader>fr", "<CMD> Telescope registers <CR>", { desc = "Find registers" })

map("n", "<leader>tf", "<CMD> lua require('neotest').run.run(vim.fn.expand '%') <CR>")
map("n", "<leader>tl", "<CMD> lua require('neotest').run.last() <CR>")
map("n", "<leader>tw", "<CMD> lua require('neotest').watch.toggle(vim.fn.expand '%') <CR>")
map("n", "<leader>tn", "<CMD> lua require('neotest').run.run() <CR>")
map("n", "<leader>ts", "<CMD> lua require('neotest').run.stop() <CR>")
map("n", "<leader>te", "<CMD> lua require('neotest').summary.toggle() <CR>")
map("n", "<leader>to", "<CMD> lua require('neotest').output_panel.toggle() <CR>")
map("n", "[t", "<CMD> lua require('neotest').jump.prev() <CR>")
map("n", "]t", "<CMD> lua require('neotest').jump.next() <CR>")

-- dap
