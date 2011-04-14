call pathogen#runtime_append_all_bundles() 
call pathogen#helptags() 

set nocompatible
set encoding=utf-8

set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/
set undodir=~/.vim/tmp/

set undofile
set history=30
set listchars=tab:▸\ ,eol:¬
set cursorline
set statusline=[%n]%y\ %f\ %m%r%=%l/%L:%c\ [%p%%]

syntax enable
set background=dark
colorscheme solarized

set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

set showmode
set showcmd
set wildmenu
set hidden
set lazyredraw
set laststatus=2
set cpoptions+=$

set incsearch
set hlsearch

nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

nnoremap <leader>h :set hlsearch!<CR>
nnoremap <leader>i :set list!<CR>

