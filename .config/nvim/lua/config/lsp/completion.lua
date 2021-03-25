vim.o.completeopt = { "menuone", "noinsert", "noselect" }
vim.o.pumheight = 12
vim.cmd [[set shortmess+=c]]

require('lspkind').init({
    with_text = false,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = 'פּ',
      Interface = '蘒',
      Module = '',
      Property = '',
      Unit = '塞',
      Value = '',
      Enum = '練',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = 'ﱮ',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})


local has_compe, compe = pcall(require, 'compe')
if has_compe then
  compe.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 50;
    max_kind_width = 50;
    max_menu_width = 50;
    documentation = false;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
  }
end
