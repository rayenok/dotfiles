" Author: Rayenok
" Source:
"

" I hate escape more than anything else
inoremap fd <Esc>

" set leader key
let g:mapleader = "\<Space>"

set number                              " Line numbers
syntax enable                           " Enables syntax highlighing
set mouse=a                             " Enable your mouse
set tabstop=4                           " Insert 2 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set expandtab                           " Converts tabs to spaces
set nowrap                              " Display long lines as just one line
set ruler              		            " Show the cursor position all the time
set cc=120
set background=dark                     " tell vim what the background color looks like
set nobackup                            " This is recommended by coc
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir                           " Your working directory will always be the same as your working directory

" You can't stop me
cmap w!! w !sudo tee %

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Save the file
nnoremap <leader>fs :w<CR>

" Quit
nnoremap <leader>wd :q<CR>
nnoremap qq :q!<CR>

" Split screen
nnoremap <leader>wv :vs<CR>
nnoremap <leader>ws :split<CR>

" delete word
inoremap <C-w> <esc>vbda
