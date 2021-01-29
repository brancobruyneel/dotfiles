" Section: Plugins
call plug#begin('~/.config/.config/nvim/autoload/plugged')

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug '9mm/vim-closer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tweekmonster/startuptime.vim'
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

" Section: Colors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
set bg=dark
colo gruvbox
syntax enable                       " enable syntax processing

"" True color support for terminal
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Section: Spaces and Tabs
set autoindent                  " automatic indent
set tabstop=2                   " number of visual spaces per TAB
set shiftwidth=2                " the size of an indent
set softtabstop=2               " number of spaces in tab when editing
set expandtab                   " tabs are spaces

" Section: Window
set hidden                      " hides buffers instead of closing them
set ttyfast                     " faster rendering
set nocompatible                " 

" Section: UI Config
set encoding=utf-8              " Set UTF-* as default encoding
set mouse=a
" set colorcolumn=79
set nu                          " show line numbers
set rnu                         " show relative numbers
set laststatus=2                " show statusline
set showcmd                     " show command in bottom bar
set cmdheight=1                 " height at the bottom
filetype indent on              " load filetype-specific indent files
" remove delay visual mode
set timeoutlen=1000 ttimeoutlen=0

"" natural split opening
set splitbelow
set splitright

let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
"" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:python3_host_prog = '/home/branco/.pyenv/versions/neovim3/bin/python'

" Section: Leader
let mapleader=" "               " leader is space

" Section: Searching
set incsearch                   " search as characters are enterd
set hlsearch                    " highlight matches
set inccommand=nosplit          " live subsitution higlight

"" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Section: Folding
set foldenable                  " enable folding
set modeline
set modelineexpr

" Section: Mappings
""
nnoremap <leader><CR> :term python %<CR>

"" paste toggle
set pastetoggle=<F2>

"" netrw toggle
" map <silent> <C-n> :Lexplore<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

"" yank to clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y :%y+<CR>

"" space open/closes folds
nnoremap <space> za

"" easier split navigatins
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" fzf 
nnoremap <C-p> :GitFiles<CR>
nnoremap <A-p> :Rg<CR>

"" lsp config
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> grn   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>

nnoremap <leader>fd    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>cl    <cmd>lua vim.lsp.diagnostic.clear(0)<CR>

""" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Section: Plugin settings


"" vim-polygoth
let g:python_highlight_all = 1


"" fzf
let $FZF_DEFAULT_OPTS="--preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }


"" lightline
function! ShowGitbranch()
  return gitbranch#name() !=# '' ? ' ' . gitbranch#name() : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \     'lineinfo': ' %3l:%-2v'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'ShowGitbranch'
      \ },
      \ }

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator =  { 'left': '', 'right': '' }


"" neovim lsp
set updatetime=1000
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

let g:diagnostic_auto_popup_while_jump = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua <<EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- disable virtual text
    virtual_text = false,

    -- show signs
    signs = true,

    -- delay update diagnostics
    update_in_insert = false,
    -- display_diagnostic_autocmds = { "InsertLeave" },

  }
)
EOF

""" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

""" Avoid showing message extra message when using completion
set shortmess+=c

" tree sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
  },
}
EOF

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
"
