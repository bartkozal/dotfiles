set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jgdavey/vim-blockle'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/powerline'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nanotech/jellybeans.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/ruby-matchit'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax enable
color jellybeans

ru! macros/matchit.vim

":h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au VimResized * :wincmd =

set term=screen-256color
set number
set showcmd
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set cursorline
set clipboard=unnamed
set backup
set noswapfile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
set undofile
set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent
set cindent
set autoread
set hidden
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,trail:.
set showbreak=↪
set fillchars=diff:⣿,vert:│
set ruler
set hlsearch
set incsearch
set gdefault
set ignorecase
set smartcase
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set showtabline=2
set splitright
set splitbelow
set shell=/bin/bash
set wildmenu
set wildignore+=.hg,.git,.svn
set colorcolumn=80
set ttyfast
set lazyredraw
set noesckeys
hi ColorColumn ctermbg=235

let mapleader = ","
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap jk <Esc>
cnoremap %% <c-r>=expand('%:h').'/'<cr>
nnoremap ;w :w<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap * *<c-o>
nnoremap gI `.

nnoremap <space> za
vnoremap <space> za

map <f2> :GundoToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

map <silent> <leader><leader> :nohlsearch<cr>
map <leader>e :e %%<cr>
map <leader>t <c-w>T
map <leader>v :e $MYVIMRC<cr>

" TODO rewrite to plugin (notes)
autocmd BufRead,BufNewFile ~/.vim/notes/notes.md map <buffer> <leader>n :wq<cr>
autocmd BufRead,BufNewFile ~/.vim/notes/*.md map <buffer> <leader>m :wq<cr>
map <silent> <leader>n :sp ~/.vim/notes/notes.md<cr>:resize 10<cr>
map <silent> <leader>m :sp ~/.vim/notes/<c-r>=fnamemodify(getcwd(), ':t')<cr>.md<cr>:resize 10<cr>

let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'

let g:netrw_dirhistmax = 0

let g:gundo_width = 30
let g:gundo_preview_height = 12
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

