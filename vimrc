" Setup for Pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set encoding=utf-8
set backupdir=~/.vimtmp//
set directory=~/.vimtmp//

syntax on

let mapleader = ","

" Autoupdate vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Remove toolbar
if has("gui_running")
  set guioptions-=T
endif

" Inivisible chars representation
set listchars=tab:▸\ ,eol:¬

" Two spaces as default indentation 
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

nmap <leader>l :set list!<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
