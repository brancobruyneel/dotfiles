-- default config:
require("peek").setup {
  auto_load = true, -- whether to automatically load preview when
  -- entering another markdown buffer
  close_on_bdelete = true, -- close preview window on buffer delete

  syntax = true, -- enable syntax highlighting, affects performance

  theme = "dark", -- 'dark' or 'light'

  update_on_change = true,
}

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
