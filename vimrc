set nocompatible
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-g-dot'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'glts/vim-textobj-comment'
Plug 'haya14busa/incsearch.vim'
Plug 'janko-m/vim-test'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-xmark', { 'do': 'make' }
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'kurkale6ka/vim-pairs'
Plug 'mbbill/undotree'
Plug 'nanotech/jellybeans.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'reedes/vim-pencil'
Plug 'rking/ag.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tek/vim-textobj-ruby'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/gitignore'
Plug 'whatyouhide/vim-textobj-xmlattr'

call plug#end()

filetype plugin indent on
syntax enable

colorscheme jellybeans
highlight ColorColumn ctermbg=235 guibg=#262626

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  set linespace=1
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
endif

set number
set relativenumber
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
set diffopt+=vertical
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
set noerrorbells
set visualbell
set t_vb=

let g:mapleader = "\<space>"

autocmd VimResized * :wincmd =
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd FileType markdown,mkd,text call pencil#init()
autocmd FileType gitcommit setl spell
autocmd FileType gitcommit setl diffopt+=vertical
autocmd BufEnter .notes call <sid>LoadNotes()
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
 

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <left> <c-w>5<
nnoremap <down> <c-w>5-
nnoremap <up> <c-w>5+
nnoremap <right> <c-w>5>

cnoremap <c-k> <up>
cnoremap <c-j> <down>

cnoremap Ag Ag!

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>
nnoremap ;w :w<cr>

nmap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gp `[v`]
nnoremap ge `.

map <f1> :BufExplorerHorizontalSplit<cr>
map <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>
map <f5> :set relativenumber!<cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nmap cm  <Plug>Commentary
nmap cX <Plug>(ExchangeLine)

nmap <c-t> :CtrlPBufTag<cr>
nmap <c-x> cxiw

nmap <silent> <leader>t :TestNearest<cr>
nmap <silent> <leader>r :TestFile<cr>
nmap <silent> <leader>a :TestSuite<cr>
nmap <silent> <leader>l :TestLast<cr>

nmap <leader>s :Gstatus<cr>
nmap <leader>e :Gedit<cr>
nmap <leader>d :Gdiff<cr>
nmap <leader>b :Gblame<cr>

nnoremap <silent> <leader>n :60vsplit .notes<cr>
nnoremap <silent> <leader>g :Goyo<cr>

function! s:LoadNotes()
  setlocal filetype=markdown
  nnoremap <buffer> q :quit<cr>
endfunction

let g:airline_powerline_fonts = 1
let g:bufExplorerDefaultHelp = 0
let g:bufExplorerDisableDefaultKeyMapping = 0
let g:bufExplorerSplitHorzSize = 10
let g:bufExplorerSplitBelow = 1
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))$'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = [
      \ '.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]
let g:ctrlp_working_path_mode = 'r'
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_matchpairs = '(:),[:],{:}'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:netrw_dirhistmax = 0
let g:peekaboo_compact = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let test#ruby#rspec#executable = 'spring rspec'
let test#strategy = "dispatch"
