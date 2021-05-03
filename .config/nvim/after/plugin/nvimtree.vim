" augroup HideCursor
"   au!
"   au WinLeave,FileType NvimTree set guicursor=n-v-c-sm:block,i-ci-ve:ver2u,r-cr-o:hor20,
"   au WinEnter,FileType NvimTree set guicursor=n-c-v:block-Cursor/Cursor-blinkon0,
" augroup END
" au FileType NvimTree set cursorline
" au FileType NvimTree hi Cursor blend=100

hi NvimTreeFolderIcon guifg = #61afef
hi NvimTreeFolderName guifg = #61afef
hi NvimTreeIndentMarker guifg=#383c44
