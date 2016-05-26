" vim:fdm=marker

set encoding=utf-8

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/gitignore'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bogado/file-line'
Plug 'christoomey/vim-sort-motion'
Plug 'itchyny/lightline.vim'
Plug 'janko-m/vim-test'
Plug 'justinmk/vim-dirvish'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
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
set foldopen=percent,quickfix,search,tag,undo
set formatoptions+=j
set gdefault
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set iskeyword+=-
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
set showtabline=1
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

" Functions {{{
function! FirstCharOrFirstCol()
  let current_col = virtcol('.')
  normal ^
  let first_char = virtcol('.')
  if current_col == first_char
    normal 0
  endif
endfunction
" }}}

inoremap jk <esc>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap j gj
nnoremap k gk
nnoremap <silent> H :call FirstCharOrFirstCol()<cr>
nnoremap J mzJ`z
nnoremap K kJ
nnoremap L $
nnoremap Y y$
nnoremap ge `.
nnoremap * *<c-o>
nnoremap <silent> <cr> :nohlsearch<bar>:echo<cr>
nnoremap <silent> <tab> :tabn<cr>
nnoremap <silent> <s-tab> :tabp<cr>
nnoremap <silent> <leader>o <c-w><s-t>:tabp<cr>
nnoremap <leader><leader> <c-^>

nnoremap cm <plug>Commentary

nnoremap <silent> <c-p> :FZF -m<cr>
nnoremap <silent> <c-t> :FZF -m<cr>

nmap n nzzzv
nmap N Nzzzv

cnoremap Ag Ag!
cnoremap <c-k> <up>
cnoremap <c-j> <down>

map <f3> :set spell!<cr>
map <f4> :set wrap! linebreak! list!<cr>

" ag {{{
let g:ag_working_path_mode = 'r'
let g:ag_mapping_message = 0
let g:ag_highlight = 0
" }}}
" dirvish {{{
autocmd FileType dirvish nnoremap <buffer> t :call dirvish#open('tabedit', 0)<cr>
autocmd FileType dirvish nnoremap <buffer> s :call dirvish#open('split', 0)<cr>
autocmd FileType dirvish nnoremap <buffer> v :call dirvish#open('vsplit', 0)<cr>
autocmd FileType dirvish nnoremap <buffer> n :e %
autocmd FileType dirvish nnoremap <buffer> b :!mkdir %
autocmd FileType dirvish keeppatterns g@\v/\.[^\/]+/?$@d
" }}}
" lightline {{{
let g:lightline = {
      \ 'component_function': {
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding'
      \ }}

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
" }}}
" vim-test {{{
let test#strategy = "neovim"
nmap <silent> <leader>r :TestNearest<cr>
nmap <silent> <leader>f :TestFile<cr>
nmap <silent> <leader>a :TestSuite<cr>
nmap <silent> <leader>l :TestLast<cr>
" }}}
