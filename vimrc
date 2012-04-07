runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
set encoding=utf-8

syntax enable
color jellybeans
filetype plugin indent on

":h last-postion-jump
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set number
set showcmd
set laststatus=2
set cursorline
set clipboard=unnamed
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set nowrap
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent
set hidden
set list
set listchars=""
set listchars+=tab:▸\ 
set listchars+=trail:.
set ruler
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=3
set showtabline=2
set splitright
set splitbelow
set winwidth=105

nnoremap <CR> :nohlsearch<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
inoremap jk <Esc>
cnoremap %% <c-r>=expand('%:h').'/'<cr>
map <leader>e :e %%

" Remap the tab key to do autocompletion or indentation depending on the
" context
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" CtrlP
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" netrw
let g:netrw_dirhistmax=0

