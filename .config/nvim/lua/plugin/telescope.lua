local M = {}

M.config = function ()
  require("telescope").setup {
    defaults = {
      prompt_prefix = " > ",
      winblend = 0,
      width = 0.75,
      preview_cutoff = 120,
          shorten_path = true,

      layout_strategy = "horizontal",
      layout_defaults = {
        horizontal = {
          width_padding = 0.1,
          height_padding = 0.1,
          preview_width = 0.5,
        },
        vertical = {
          width_padding = 0.05,
          height_padding = 1,
          preview_height = 0.5,
        }
      },


      selection_strategy = "reset",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      prompt_position = "bottom",
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰"},

      file_previewer = require"telescope.previewers".vim_buffer_cat.new,
      grep_previewer = require"telescope.previewers".vim_buffer_vimgrep.new,
      qflist_previewer = require"telescope.previewers".vim_buffer_qflist.new,
    },
    extensions = {
     fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
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
        shorten_path = true,
    }
end

function M.media_files()
    require("telescope").extensions.media_files.media_files {
        shorten_path = true,
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
