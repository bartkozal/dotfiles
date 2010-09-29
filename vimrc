" Phatogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Files
set nocompatible
set encoding=utf-8
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set undofile

syntax on

" Autoreload .vimrc
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" MacVim
if has("gui_running")
  set guioptions-=T
  set listchars=tab:▸\ ,eol:¬
  set guifont=Monaco:h12
  colorscheme vividchalk
endif

" Display
set showmode
set showcmd
set wildmenu
set wildmode=longest:full
set cursorline
set ruler
set number
set laststatus=2
set scrolloff=2
set backspace=2
set linespace=2

" Indentation
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" Search
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch

" Better jk
map j gj
map k gk

" Function keys
nmap ; :
let mapleader = ","

" Windows
map <leader>w <C-w>v<C-w>l
map <C-tab> <C-w>w
map <C-S-tab> <C-w>W
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Leader
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>l :set list!<CR>
nmap <leader>s :set hlsearch!<CR>

" Plugins
nmap <leader>a :Ack<space>
map <leader>d :NERDTreeToggle<CR>
map <leader>p :YRShow<CR>

let NERDTreeWinPos = 'right'

let g:yankring_max_history = 100
let g:yankring_history_file = '.vim/tmp/yankring'
let g:yankring_clipboard_monitor = 1

