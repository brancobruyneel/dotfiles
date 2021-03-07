" Section: Colors
set background=dark             " use darkmode
syntax enable                   " enable syntax processing

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
set colorcolumn=79
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

" Section: Leader
let mapleader=" "               " leader is space

" Section: Searching
set incsearch                   " search as characters are enterd
set hlsearch                    " highlight matches

"" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Sectiozan: Mappings
"" paste toggle
set pastetoggle=<F2>

"" yank to clipboard
nnoremap <leader>y :%y+<CR>
