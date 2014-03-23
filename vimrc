set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'bling/vim-airline'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'mbbill/undotree'
Bundle 'mikewest/vimroom'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nanotech/jellybeans.vim'
Bundle 'rking/ag.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'skalnik/vim-vroom'
Bundle 'terryma/vim-expand-region'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vinegar'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/gitignore'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax enable
color jellybeans

ru macros/matchit.vim

set term=screen-256color
set number
set showcmd
set laststatus=2
set statusline=%<%f\ %{fugitive#head()}\ %y%r%m%=%l:%c\ \ %p
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
set shiftround
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

let mapleader = "\<space>"

au VimResized * :wincmd =
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

hi ColorColumn ctermbg=235

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap jk <Esc>
nnoremap ;w :w<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap * *<c-o>

map <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

map <silent> <leader><leader> :nohlsearch<cr>
map <leader>e :Explore <c-r>=expand('%:h').'/'<cr><cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

vmap v <plug>(expand_region_expand)
vmap <c-v> <plug>(expand_region_shrink)

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:netrw_dirhistmax = 0

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
