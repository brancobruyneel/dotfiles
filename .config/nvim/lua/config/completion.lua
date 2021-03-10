vim.o.completeopt = "menuone,noselect"
vim.cmd [[set shortmess+=c]]
vim.o.pumheight = 12

vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}

require('lspkind').init({
    with_text = false,
    symbol_map = {
      Text = '',
      Method = '',
      Function = '',
      Constructor = '',
      Variable = '[]',
      Class = 'פּ',
      Interface = '蘒',
      Module = '',
      Property = '',
      Unit = '塞',
      Value = '',
      Enum = '練',
      Keyword = '',
      Snippet = '',
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
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
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
