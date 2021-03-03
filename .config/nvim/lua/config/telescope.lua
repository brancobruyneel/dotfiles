local telescope = require'telescope'

telescope.setup({
	file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
})

local M = {}

M.search_dotfiles = function() 
	require("telescope.builtin").git_files({
			prompt_title = "< DotFiles >",
			cwd = "$HOME/dev/dotfiles/",
	})
end

return M
