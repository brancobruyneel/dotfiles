local M = {}

M.config = function()
  require('lspkind').init({
      with_text = true,
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
        Folder = '',
        EnumMember = '',
        Constant = '',
        Struct = ''
      },
  })
end

return M
