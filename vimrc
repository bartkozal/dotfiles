set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'groenewege/vim-less'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'jgdavey/vim-blockle'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'kana/vim-textobj-user'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'kongo2002/vim-space'
Bundle 'leshill/vim-json'
Bundle 'mbbill/undotree'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'nelstrom/vim-markdown-folding.git'
Bundle 'nanotech/jellybeans.vim'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'slim-template/vim-slim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-dispatch'
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
Bundle 'vim-ruby/vim-ruby'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on
syntax enable
color jellybeans

ru macros/matchit.vim

au VimResized * :wincmd =
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown

hi ColorColumn ctermbg=235

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

let mapleader = ","

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

inoremap jk <Esc>
cnoremap %% <c-r>=expand('%:h').'/'<cr>
cnoremap %^ <c-r>=expand('%:t')<cr>
nnoremap ;w :w<cr>
nnoremap / /\v
vnoremap / /\v
nnoremap * *<c-o>
nnoremap gI `.

map <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

map <silent> <leader><leader> :nohlsearch<cr>
map <leader>e :Explore %%<cr>
map <leader>w :Rename! %^

au BufRead,BufNewFile ~/.vim/notes/notes.md map <buffer> <leader>n :wq<cr>
map <silent> <leader>n :sp ~/.vim/notes/notes.md<cr>:resize 15<cr>

let g:airline_powerline_fonts = 1
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(vim\/(undo|backup|swap|bundle))$'
let g:netrw_dirhistmax = 0

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
