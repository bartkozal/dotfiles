set nocompatible
set encoding=utf-8
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//

syntax on

" leader
let mapleader = ","

" autoupdate of vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" textmate inivisibles
set listchars=tab:▸\ ,eol:¬

" tabs and spaces
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" leader maps
nmap <leader>l :set list!<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
