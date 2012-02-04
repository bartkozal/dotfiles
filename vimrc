runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
set encoding=utf-8

syntax enable
color jellybeans
filetype plugin indent on

set showcmd
set laststatus=2
set cursorline
set autochdir
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent
set hidden
set list
set listchars=""
set listchars+=tab:▸\ 
set listchars+=trail:.
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <CR> :nohlsearch<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" CtrlP
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
