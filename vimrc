set nocompatible
set encoding=utf-8
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'bling/vim-airline'
Plugin 'bogado/file-line'
Plugin 'christoomey/vim-conflicted'
Plugin 'christoomey/vim-g-dot'
Plugin 'christoomey/vim-sort-motion'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'haya14busa/incsearch.vim'
Plugin 'janko-m/vim-test'
Plugin 'junegunn/vim-peekaboo'
Plugin 'kien/ctrlp.vim'
Plugin 'kurkale6ka/vim-pairs'
Plugin 'mbbill/undotree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'reedes/vim-pencil'
Plugin 'rking/ag.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tommcdo/vim-exchange'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'troydm/easybuffer.vim'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'vim-scripts/gitignore'

Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'gilligan/textobj-gitgutter'
Plugin 'glts/vim-textobj-comment'
Plugin 'jceb/vim-textobj-uri'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-line'
Plugin 'tek/vim-textobj-ruby'
Plugin 'whatyouhide/vim-textobj-xmlattr'

Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'

call vundle#end()
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
autocmd InsertLeave * if expand('%') != '' | update | endif
autocmd FileType markdown,mkd,text call pencil#init()
autocmd FileType gitcommit setl spell
autocmd FileType gitcommit setl diffopt+=vertical
autocmd BufEnter .notes call <sid>LoadNotes()

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

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>
nnoremap ;w :w<cr>

nmap Y y$
nnoremap gp `[v`]
nnoremap ge `.

map <f1> :EasyBufferToggle<cr>
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
nmap <leader>d :Gdiff<cr>
nmap <leader>b :Gblame<cr>

nnoremap <silent> <leader>n :split .notes<cr>

function! s:LoadNotes()
  setlocal filetype=markdown
  nnoremap <buffer> q :quit<cr>
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_powerline_fonts = 1
let g:closetag_filenames = '*.html,*.erb'
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
let g:easybuffer_horizontal_height = '&lines/4'
let g:easybuffer_show_header = 0
let g:easybuffer_toggle_position = 'HorizontalBelow'
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#magic = '\v'
let g:netrw_dirhistmax = 0
let g:peekaboo_compact = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let test#ruby#rspec#executable = 'spring rspec'
let test#strategy = "dispatch"
