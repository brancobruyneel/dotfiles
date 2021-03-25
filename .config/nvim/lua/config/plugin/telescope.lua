if not pcall(require, 'telescope') then
  return
end


require('telescope').setup {
	defaults = {
		prompt_prefix = ' > ',

		winblend = 0,
		preview_cutoff = 120,

		layout_strategy = 'horizontal',
		layout_defaults = {
			horizontal = {
				width_padding = 0.1,
				height_padding = 0.1,
				preview_width = 0.55,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			}
		},

		selection_strategy = 'reset',
		sorting_strategy = 'descending',
		scroll_strategy = 'cycle',
		prompt_position = 'bottom',
		color_devicons = true,
		set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},

		file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
		grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
		qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
	},
  extensions = {
    media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
    }
  }
}

-- native extension
pcall(require('telescope').load_extension, 'media_files')
pcall(require('telescope').load_extension, 'fzy_native')
pcall(require('telescope').load_extension, 'gh')

local M = {}

M.search_dotfiles = function() 
	require("telescope.builtin").git_files({
			prompt_title = "< DotFiles >",
			cwd = "$HOME/dev/dotfiles/",
	})
end

function M.file_browser()
  require('telescope.builtin').file_browser {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    prompt_position = "top",
  }
end

return M
