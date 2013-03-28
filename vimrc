set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'airblade/vim-gitgutter'
Bundle 'digitaltoad/vim-jade'
Bundle 'ervandew/ag'
Bundle 'gmarik/vundle'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/powerline'
Bundle 'miripiruni/CSScomb-for-Vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'sjl/gundo.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'slim-template/vim-slim'
Bundle 'suan/vim-instant-markdown'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax enable
color jellybeans

":h last-position-jump
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set term=screen-256color
set number
set showcmd
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set noshowmode
set cursorline
set clipboard=unnamed
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set undodir=~/.vim/undo
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
set listchars=""
set listchars+=tab:▸\ 
set listchars+=trail:.
set showbreak=…
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set showtabline=2
set splitright
set splitbelow
set shell=/bin/bash
set wildignore+=*/.hg/*,*/.svn/*
set colorcolumn=80
set wildmenu
hi ColorColumn ctermbg=235

nnoremap <CR> :nohlsearch<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap jk <Esc>
cnoremap %% <c-r>=expand('%:h').'/'<cr>
nnoremap ;w :w<cr>
map <leader>e :e %%
map <leader>w :set wrap! linebreak! list!<cr>
map <leader>s :set spell!<cr>
map <leader>u :GundoToggle<cr>
map <leader>t <c-w>T

let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'

let g:netrw_dirhistmax = 0

let g:gundo_width = 30
let g:gundo_preview_height = 12
let g:gundo_preview_bottom = 1
let g:gundo_right = 1
let g:gundo_help = 0
let g:gundo_close_on_revert = 1

