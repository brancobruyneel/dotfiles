return {
  filters = {
    custom = { "^.git$" },
  },

  git = {
    enable = true,
  },

  view = {
    adaptive_size = true,
    side = "left",
    width = 30,
    preserve_window_proportions = true,
  },

  sync_root_with_cwd = true,

  actions = {
    change_dir = {
      enable = true,
      global = true,
    },
    open_file = {
      resize_window = false,
    },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
        folder_arrow = false,
      },
      glyphs = {
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
  },
}
