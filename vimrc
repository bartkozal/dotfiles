filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible
set encoding=utf-8
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set undofile
set history=200

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
set showmatch
set hidden
set lazyredraw
set laststatus=2
set scrolloff=1
set backspace=2
set linespace=2
set cpoptions+=$

set ignorecase
set smartcase
set incsearch
set hlsearch
set gdefault

set statusline=[%n]\ %f\ %m%r%=%c:%l/%L\ [%p%%]

nmap ; :
let mapleader = ","

map j gj
map k gk

nmap <tab> %
vmap <tab> %

nmap <up> <nop>
nmap <down> <nop>
nmap <left> <nop>
nmap <right> <nop>

map <leader>w <C-w>v<C-w>l
map <leader>d <C-w>c
map <leader>x <C-w>x
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gbl :Gblame<CR>
nmap <leader>gd :Gdiff<CR>

nmap <leader>i :set list!<CR>
nmap <leader>p :set paste!<CR>
nmap <leader>s :set hlsearch!<CR>
nmap <leader><space> :noh<CR>
nmap <leader>fw :FixWhitespace<CR>

nmap <leader>cd :lcd %:h<CR>
nmap <leader>ve :e $MYVIMRC<CR>
nmap <leader>vs :so $MYVIMRC<CR>

map <leader>b :FufBuffer<CR>
map <leader>t :FufFile<CR>

map <leader>a :Ack
map <leader>/ :GundoToggle<CR>
map <leader>\ :NERDTreeToggle<CR>

