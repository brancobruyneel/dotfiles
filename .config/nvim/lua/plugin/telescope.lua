local M = {}

M.config = function ()
  require("telescope").setup {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120
      },
      file_sorter = require "telescope.sorters".get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
      path_display = {'absolute'},
      winblend = 0,
      border = {},
      borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require "telescope.previewers".vim_buffer_cat.new,
      grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
      qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
  },
  extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    }
  }

  require("telescope").load_extension("fzf")
  require("telescope").load_extension("media_files")
end


function M.live_grep()
    require("telescope.builtin").live_grep()
end

function M.find_files()
    require("telescope.builtin").find_files {
        previewer = false,
        -- Temporary when working with C# projects
        file_ignore_patterns = {".*/Debug/.*", "obj/.*", },
    }
end

function M.preview_files()
    require("telescope.builtin").find_files {
        path_display = {'relative'},
    }
end

function M.media_files()
    require("telescope").extensions.media_files.media_files {
        path_display = {'relative'},
    }
end

function M.file_browser()
    require("telescope.builtin").file_browser {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        prompt_position = "top",
    }
end

-- Vim

function M.buffers()
    require("telescope.builtin").buffers()
end


-- Git

function M.git_files()
    require("telescope.builtin").git_files {
        previewer = false,
    }
end

-- LSP

function M.lsp_workspace_diagnostics()
    require("telescope.builtin").lsp_workspace_diagnostics {
        layout_strategy = "vertical",
    }
end

function M.lsp_code_actions()
    require("telescope.builtin").lsp_code_actions()
end

-- Custom
function M.search_dotfiles() 
	require("telescope.builtin").git_files {
        previewer = false,
        prompt_title = "< DotFiles >",
        cwd = "$HOME/dev/dotfiles/",
	}
end

return M
