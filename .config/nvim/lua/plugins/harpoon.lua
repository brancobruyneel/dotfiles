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
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    for _, idx in ipairs { 1, 2, 3, 4, 5 } do
      vim.keymap.set("n", string.format("<leader>%d", idx), function()
        harpoon:list():select(idx)
      end)
    end
  end,
}
