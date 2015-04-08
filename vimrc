set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'duggiefresh/vim-easydir'
Plugin 'haya14busa/incsearch.vim'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/vim-peekaboo'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'reedes/vim-pencil'
Plugin 'rking/ag.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tommcdo/vim-lion'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-scripts/gitignore'

Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'

filetype plugin indent on
syntax enable
color jellybeans

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  set linespace=1
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

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
set undodir=~/.vim/undo//
set undofile
set history=50
set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2
set smarttab
set shiftround
set expandtab
set backspace=indent,eol,start
set autoindent
set cindent
set cinoptions=l1,j1
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
set shortmess-=c

let g:mapleader = "\<space>"

autocmd VimResized * :wincmd =
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd InsertLeave * if expand('%') != '' | update | endif
autocmd FileType markdown,mkd,text call pencil#init()

highlight ColorColumn ctermbg=235 guibg=#262626

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <left> <c-w>5<
nnoremap <down> <c-w>5-
nnoremap <up> <c-w>5+
nnoremap <right> <c-w>5>

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>
nnoremap ;w :w<cr>
nnoremap * *<c-o>

map <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>
nmap <c-t> :CtrlPBufTag<cr>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))$'
let g:ctrlp_user_command = [
      \ '.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]
let g:ctrlp_use_caching = 0
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:netrw_dirhistmax = 0
let g:ycm_collect_identifiers_from_tags_files = 1
