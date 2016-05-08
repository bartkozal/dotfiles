" vim:fdm=marker

set nocompatible
set encoding=utf-8

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/gitignore'
Plug 'w0ng/vim-hybrid'
Plug 'valloric/youcompleteme', { 'do': './install.py' }

Plug 'gilligan/textobj-gitgutter'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'tek/vim-textobj-ruby'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/splitjoin.vim'
Plug 'ap/vim-css-color'
Plug 'arecarn/crunch.vim'
Plug 'blueyed/vim-diminactive'
Plug 'bogado/file-line'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-titlecase'
Plug 'christoomey/vim-tmux-navigator'
Plug 'chun-yang/vim-ag-anything'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-dirvish'
Plug 'mbbill/undotree'
Plug 'myusuf3/numbers.vim'
Plug 'raimondi/delimitmate'
Plug 'rking/ag.vim'
Plug 'romainl/vim-qf'
Plug 'rstacruz/sparkup', { 'rtp': 'vim' }
Plug 'scrooloose/syntastic'
Plug 'tommcdo/vim-exchange'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'wincent/terminus'

call plug#end()
" }}}

filetype plugin indent on
syntax enable

colorscheme hybrid

" Options {{{
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
set foldopen-=block
set formatoptions+=j
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
set nojoinspaces
set noshowmode
set noswapfile
set novisualbell
set nowrap
set number
set relativenumber
set ruler
set scrolloff=3
set shell=$SHELL
set shiftround
set shortmess=sAIcOoa
set showbreak=↑
set showcmd
set showtabline=2
set sidescroll=1
set sidescrolloff=10
set smartcase
set smarttab
set splitbelow
set splitright
set statusline=%<%f\ %y%r%m%=%l:%c\ \ %p
set synmaxcol=120
set t_vb=
set tabstop=2 softtabstop=2 shiftwidth=2
set ttyfast
set undodir=~/.vim/undo//
set undofile
set wildignore+=.hg,.git,.svn,.DS_Store
set wildmenu

if has("gui_macvim")
  set guifont=Hack:h14
  set linespace=1
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
endif
" }}}

let g:mapleader = "\<space>"

autocmd VimResized * :wincmd =
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal diffopt+=vertical
autocmd FileType markdown setlocal spell
autocmd BufEnter,FocusGained,VimEnter,WinEnter * setlocal cursorline
autocmd FocusLost,WinLeave * setlocal nocursorline

inoremap jk <esc>

nnoremap <leader>v :vs $MYVIMRC<cr>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap ! :!
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap L $
nnoremap J mzJ`z
nnoremap K kJ
nnoremap ge `.
nnoremap * *<c-o>
nnoremap <leader>/ :%s///g<left><left>
nnoremap <silent> <cr> :nohlsearch<bar>:echo<cr>
nnoremap <silent> <tab> :tabn<cr>
nnoremap <silent> <s-tab> :tabp<cr>
nnoremap <silent> <leader>o <c-w><s-t>:tabp<cr>
nnoremap <leader><space> zz

nnoremap <silent> <leader>s :Gstatus<cr>
nnoremap <silent> <leader>d :Gdiff<cr>

cnoremap Ag Ag!
cnoremap <c-k> <up>
cnoremap <c-j> <down>

xnoremap @q :normal @q<cr>
xnoremap @@ :normal @@<cr>

map <silent> <f2> :UndotreeToggle<cr>
map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

function! FirstCharOrFirstCol()
  let current_col = virtcol('.')
  normal ^
  let first_char = virtcol('.')
  if current_col == first_char
    normal 0
  endif
endfunction

nnoremap <silent> H :call FirstCharOrFirstCol()<cr>

" Tmux-like window resizing {{{
function! IsEdgeWindowSelected(direction)
  let l:curwindow = winnr()
  exec "wincmd ".a:direction
  let l:result = l:curwindow == winnr()

  if (!l:result)
    " Go back to the previous window
    exec l:curwindow."wincmd w"
  endif

  return l:result
endfunction

function! GetAction(direction)
  let l:keys = ['h', 'j', 'k', 'l']
  let l:actions = ['vertical resize -', 'resize +', 'resize -', 'vertical resize +']
  return get(l:actions, index(l:keys, a:direction))
endfunction

function! GetOpposite(direction)
  let l:keys = ['h', 'j', 'k', 'l']
  let l:opposites = ['l', 'k', 'j', 'h']
  return get(l:opposites, index(l:keys, a:direction))
endfunction

function! TmuxResize(direction, amount)
  " v >
  if (a:direction == 'j' || a:direction == 'l')
    if IsEdgeWindowSelected(a:direction)
      let l:opposite = GetOpposite(a:direction)
      let l:curwindow = winnr()
      exec 'wincmd '.l:opposite
      let l:action = GetAction(a:direction)
      exec l:action.a:amount
      exec l:curwindow.'wincmd w'
      return
    endif
    " < ^
  elseif (a:direction == 'h' || a:direction == 'k')
    let l:opposite = GetOpposite(a:direction)
    if IsEdgeWindowSelected(l:opposite)
      let l:curwindow = winnr()
      exec 'wincmd '.a:direction
      let l:action = GetAction(a:direction)
      exec l:action.a:amount
      exec l:curwindow.'wincmd w'
      return
    endif
  endif

  let l:action = GetAction(a:direction)
  exec l:action.a:amount
endfunction

nnoremap <silent> <left> :call TmuxResize('h', 1)<cr>
nnoremap <silent> <down> :call TmuxResize('j', 1)<cr>
nnoremap <silent> <up> :call TmuxResize('k', 1)<cr>
nnoremap <silent> <right> :call TmuxResize('l', 1)<cr>
"}}}

let g:clever_f_smart_case = 1
let g:peekaboo_compact = 1
let g:qf_mapping_ack_style = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:crunch_result_type_append = 0
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:numbers_exclude = ['undotree']
let g:diminactive_use_colorcolumn = 1
let g:diminactive_enable_focus = 1

nnoremap cm <plug>Commentary
nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>

" ag {{{
let g:ag_working_path_mode = 'r'
let g:ag_mapping_message = 0
let g:ag_highlight = 0
" }}}
" airline {{{
let g:airline_theme = 'hybridline'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline_powerline_fonts = 1
" }}}
" ctrlp {{{
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))$'
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = [
      \ '.git',
      \ 'cd %s && git ls-files . -co --exclude-standard',
      \ 'find %s -type f'
      \ ]
let g:ctrlp_working_path_mode = 'r'
" }}}
" gitgutter {{{
let g:gitgutter_map_keys = 0

nmap ]h <plug>GitGutterNextHunk
nmap [h <plug>GitGutterPrevHunk
" }}}
" projectionist {{{
let g:projectionist_heuristics = {
      \ "Gemfile": {"alternate": "Gemfile.lock"},
      \ }
" }}}
" syntastic {{{
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_scss_scss_lint_args = "--config ~/.scss_lint.yml"

let g:syntastic_error_symbol = "»"
let g:syntastic_style_error_symbol = "»"
let g:syntastic_warning_symbol = "»"
let g:syntastic_style_warning_symbol = "»"
" }}}
" vim-test {{{
let test#filename_modifier = ':p'

nmap <silent> <leader>r :TestNearest<cr>
nmap <silent> <leader>f :TestFile<cr>
nmap <silent> <leader>a :TestSuite<cr>
nmap <silent> <leader>l :TestLast<cr>
" }}}
" ycm {{{
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
      \   'css,scss,sass' : ['re!^\s*', 're![;:]\s*'],
      \   'html,xml,erb,ejs,liquid' : ['<', 're!<.*\s', '</']
      \ }
" }}}
