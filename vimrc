filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set encoding=utf-8
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set undofile

syntax on

if has("gui_running")
  colorscheme xoria256
  set guioptions-=T
  set listchars=tab:▸\ ,eol:¬
  set guifont=Menlo:h12
  set cursorline
endif

set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

set showmode
set showcmd
set wildmenu
set wildmode=longest:full
set ruler
set number
set laststatus=2
set scrolloff=1
set backspace=2
set linespace=2
set cpoptions+=$

set showmatch

set ignorecase
set smartcase
set incsearch
set gdefault

nmap ; :
let mapleader = ","

map j gj
map k gk

map <leader>w <C-w>v<C-w>l
map <leader>c <C-w>c
map <leader>x <C-w>x
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

nmap <leader>i :set list!<CR>
nmap <leader>s :set hlsearch!<CR>

map <leader>/ :NERDTreeToggle<CR> 
