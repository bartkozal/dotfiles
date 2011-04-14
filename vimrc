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

nnoremap <leader>\ q:
nnoremap <leader>/ q/
nnoremap <leader>? q?

nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <D-]> >gv
vnoremap <D-[> <gv

nnoremap <D-k> :noh<CR>
nnoremap <D-i> :set list!<CR>

nnoremap <D-F> :Ack<space>
nnoremap <D-2> :GundoToggle<CR>
let g:gundo_help = 0
