set nocompatible
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'glts/vim-textobj-comment'
Plug 'janko-m/vim-test'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/vim-peekaboo'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'kien/ctrlp.vim'
Plug 'kurkale6ka/vim-pairs'
Plug 'mbbill/undotree'
Plug 'pbrisbin/vim-mkdir'
Plug 'rhysd/clever-f.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'jistr/vim-nerdtree-tabs'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-pasta'
Plug 'tek/vim-textobj-ruby'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
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
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimResized * :wincmd =
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd InsertLeave * if expand('%') != '' | update | endif
  autocmd FileType gitcommit setl spell
  autocmd FileType gitcommit setl diffopt+=vertical
  autocmd FileType netrw setl bufhidden=wipe
  autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
  autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
augroup END

nmap <leader>v :edit $MYVIMRC<cr>

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

nnoremap <silent> <cr> :nohlsearch<bar>:echo<cr><cr>

nnoremap ; :
nnoremap ! :!

inoremap jk <Esc>
nnoremap ;w :w<cr>

nmap Y y$
nnoremap j gj
nnoremap k gk
nnoremap gp `[v`]
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

cnoremap Ag Ag!

map <silent> <f1> :BuffergatorToggle<cr>
map <silent> <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>
map <f5> :set relativenumber!<cr>

map <silent> <leader>n <plug>NERDTreeTabsToggle<cr>

nmap [b :BuffergatorMruCyclePrev<cr>
nmap ]b :BuffergatorMruCycleNext<cr>

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

nmap cm <Plug>Commentary
nmap cX <Plug>(ExchangeLine)

nmap <c-t> :CtrlPBufTag<cr>
nmap <c-x> cxiw

nmap <silent> <leader>t :TestNearest<cr>
nmap <silent> <leader>r :TestFile<cr>
nmap <silent> <leader>a :TestSuite<cr>
nmap <silent> <leader>l :TestLast<cr>

nmap <silent> <leader>s :Gstatus<cr>
nmap <silent> <leader>e :Gedit<cr>
nmap <silent> <leader>d :Gdiff<cr>
nmap <silent> <leader>b :Gblame<cr>

noremap <silent> <leader>q :q<cr>
noremap <silent> <leader>w :w<cr>

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<c-n>"
    else
      return "\<tab>"
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<c-p>"
  endif
  return ""
endfunction

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_powerline_fonts = 1
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_hsplit_size = 10
let g:buffergator_suppress_keymaps = 1
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
let g:multi_cursor_next_key = '<c-n>'
let g:multi_cursor_prev_key = '<c-p>'
let g:multi_cursor_skip_key = '<c-x>'
let g:multi_cursor_quit_key = '<esc>'
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "M",
      \ "Staged"    : "A",
      \ "Untracked" : "?",
      \ "Renamed"   : "R",
      \ "Unmerged"  : "U",
      \ "Deleted"   : "D",
      \ "Dirty"     : "~",
      \ "Clean"     : "C",
      \ "Unknown"   : "*"
      \ }
let g:netrw_dirhistmax = 0
let g:peekaboo_compact = 1
let g:projectionist_heuristics = {
      \ "Gemfile": {"alternate": "Gemfile.lock"},
      \ }
let g:togglecursor_default = 'block'
let g:togglecursor_leave = 'block'
let g:togglecursor_replace = 'underline'
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let test#ruby#rspec#executable = 'spring rspec'
let test#strategy = "terminal"

let NERDTreeMinimalUI = 1
