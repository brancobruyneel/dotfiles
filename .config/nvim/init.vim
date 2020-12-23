" Section: Plugins
call plug#begin('~/.config/.config/nvim/autoload/plugged')

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'
Plug '9mm/vim-closer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tweekmonster/startuptime.vim'

call plug#end()

" Section: Colors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italix=1
set bg=dark
colo gruvbox
syntax enable                       " enable syntax processing

" True color support for terminal
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Section: Spaces and Tabs
set autoindent                  " automatic indent
set tabstop=4                   " number of visual spaces per TAB
set shiftwidth=4                " the size of an indent
set softtabstop=4               " number of spaces in tab when editing
set expandtab                   " tabs are spaces

" Section: Window
set hidden                      " hides buffers instead of closing them
set ttyfast                     " faster rendering
set nocompatible                " 

" Section: UI Config
set encoding=utf-8              " Set UTF-* as default encoding
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

"" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

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
"" paste toggle
set pastetoggle=<F2>

"" netrw toggle
map <silent> <C-n> :Lexplore<CR>

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

""" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Section: Plugin settings

"" fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

"" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


"" neovim lsp
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

""" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

""" Avoid showing message extra message when using completion
set shortmess+=c



" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
