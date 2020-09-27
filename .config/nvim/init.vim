" Section: Plugins
"" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/.config/nvim/autoload/plugged')

"" Declare the list of plugins.
""" Colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
""" Statusline
Plug 'itchyny/lightline.vim'
""" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
""" Tree explorer
Plug 'scrooloose/nerdtree'
""" Nerdtree icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
""" Better syntax
Plug 'sheerun/vim-polyglot'
""" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""" Latex preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
""" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'
""" Git integration
Plug 'tpope/vim-fugitive'
""" Extra shortcuts
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
""" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
""" Timer
Plug 'wakatime/vim-wakatime'

"" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Section: Colors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
set background=dark                 " use darkmode
syntax enable                   " enable syntax processing

"" True color support for terminal
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

"" remap esc & C-C to kj
"inoremap kj <esc>
"cnoremap kj <C-C>

" Section: Searching
set incsearch                   " search as characters are enterd
set hlsearch                    " highlight matches

"" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Section: Folding
set foldenable                  " enable folding
set modeline
set modelineexpr

" Sectiozan: Mappings
"" paste toggle
set pastetoggle=<F2>

"" yank to clipboard
nnoremap <leader>y :%y+<CR>

"" space open/closes folds
nnoremap <space> za

"" easier split navigatins
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" java compile & run
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
command -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
nnoremap <F6> :Silent tmux resize-pane -Z Enter; tmux send-keys -t 2  C-c Enter "clear; java %:r" Enter <CR><CR>
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
" Section: Plugin settings
"" --> fuzzy finder
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }

nnoremap <C-p> :GitFiles<CR>
"" --> gruvbox
let g:gruvbox_italix=1

"" --> vim-polyglot
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0

"" --> Lightline
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

"" --> Nerdtree
let NERDTreeMinimalUI=1         " hide press ? for help
""" hide certain files
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeIgnore = ['\.class$']

""" automaticly close nerdtree when it's the last buffer
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" remap C-N to open tree explorer
map <C-n> :NERDTreeToggle<CR>

"" --> latex-preview
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'


"" --> coc.nvim
set shortmess+=c                " don't give ins-completion-menu messages
set cmdheight=1                 " Better display for messages
set updatetime=300              " You will have bad experience for diagnostic messages when it's default 4000.

""" Use tab for trigger completion with characters ahead and navigate.
""" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

""" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

""" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Section: Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Section: Custom Functions
"" automaticaly change the current directory
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"" coc.nvim
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! Hashbang(portable, permission, RemExt)
let shells = { 
        \    'awk': "awk",
        \     'sh': "bash",
        \     'hs': "runhaskell",
        \     'jl': "julia",
        \    'lua': "lua",
        \    'mak': "make",
        \     'js': "node",
        \      'm': "octave",
        \     'pl': "perl", 
        \    'php': "php",
        \     'py': "python",
        \      'r': "Rscript",
        \     'rb': "ruby",
        \  'scala': "scala",
        \    'tcl': "tclsh",
        \     'tk': "wish"
        \    }

let extension = expand("%:e")

if has_key(shells,extension)
	let fileshell = shells[extension]

	if a:portable
		let line =  "#!/usr/bin/env " . fileshell 
	else 
		let line = "#! " . system("which " . fileshell)
	endif

	0put = line

	if a:permission
		:autocmd BufWritePost * :autocmd VimLeave * :!chmod u+x %
	endif


	if a:RemExt
		:autocmd BufWritePost * :autocmd VimLeave * :!mv % "%:p:r"
	endif

endif

endfunction

autocmd BufNewFile *.* :call Hashbang(1,1,0)

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:'=':
