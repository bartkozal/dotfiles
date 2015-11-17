set nocompatible
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'Raimondi/delimitMate'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gilligan/textobj-gitgutter'
Plug 'glts/vim-textobj-comment'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'kurkale6ka/vim-pairs'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'pbrisbin/vim-mkdir'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/gitignore'
Plug 'w0ng/vim-hybrid'
Plug 'whatyouhide/vim-textobj-xmlattr'

call plug#end()

filetype plugin indent on
syntax enable

colorscheme hybrid

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  set linespace=1
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
endif

set autoindent
set autoread
set autowriteall
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/backup//
set cindent
set cinoptions=l1,j1
set clipboard=unnamed
set colorcolumn=80
set cursorline
set diffopt+=vertical
set expandtab
set fillchars=diff:⣿,vert:│
set gdefault
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:▸\ ,trail:.
set noerrorbells
set noesckeys
set noshowmode
set noswapfile
set novisualbell
set nowrap
set number
set relativenumber
set ruler
set scrolloff=3
set shell=/bin/bash
set shiftround
set shortmess=sAIcOoa
set showbreak=↪
set showcmd
set showtabline=2
set sidescroll=1
set sidescrolloff=10
set smartcase
set smarttab
set splitbelow
set splitright
set statusline=%<%f\ %{fugitive#head()}\ %y%r%m%=%l:%c\ \ %p
set t_vb=
set tabstop=2 softtabstop=2 shiftwidth=2
set ttyfast
set undodir=~/.vim/undo//
set undofile
set wildignore+=.hg,.git,.svn,.DS_Store
set wildmenu

let g:mapleader = "\<space>"

augroup vimrc
  autocmd!
  autocmd VimResized * :wincmd =
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd FileType gitcommit setl spell
  autocmd FileType gitcommit setl diffopt+=vertical
  autocmd FileType netrw setl bufhidden=wipe
augroup END

nmap <leader>v :vs $MYVIMRC<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <left> <c-w>5<
nnoremap <down> <c-w>5-
nnoremap <up> <c-w>5+
nnoremap <right> <c-w>5>

nnoremap <silent> <cr> :nohlsearch<bar>:echo<cr>

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>
nnoremap ;w :w<cr>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

nmap Y y$
nnoremap j gj
nnoremap k gk
nnoremap ge `.
nnoremap * *<c-o>

noremap <silent> H :call FirstCharOrFirstCol()<cr>
noremap L $

function! FirstCharOrFirstCol()
  let current_col = virtcol('.')
  normal ^
  let first_char = virtcol('.')
  if current_col == first_char
    normal 0
  endif
endfunction

cnoremap <c-k> <up>
cnoremap <c-j> <down>
cnoremap Ag Ag!

map <silent> <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nmap cm <Plug>Commentary

nmap <silent> <leader>s :Gstatus<cr>
nmap <silent> <leader>e :Gedit<cr>
nmap <silent> <leader>d :Gdiff<cr>

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_powerline_fonts = 1
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
let g:delimitMate_matchpairs = '(:),[:],{:}'
let g:netrw_dirhistmax = 0
let g:netrw_liststyle= 3
let g:peekaboo_compact = 1
let g:projectionist_heuristics = {
      \ "Gemfile": {"alternate": "Gemfile.lock"},
      \ }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_slim_checkers = ['slimrb']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_semantic_triggers =  {
      \   'c' : ['->', '.'],
      \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
      \             're!\[.*\]\s'],
      \   'ocaml' : ['.', '#'],
      \   'cpp,objcpp' : ['->', '.', '::'],
      \   'perl' : ['->'],
      \   'php' : ['->', '::'],
      \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
      \   'ruby' : ['.', '::'],
      \   'lua' : ['.', ':'],
      \   'erlang' : [':'],
      \   'css,scss,sass' : ['re!^\s*', 're![;:]\s*']
      \ }
