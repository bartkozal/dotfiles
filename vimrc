runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
set encoding=utf-8

syntax enable
color jellybeans
filetype plugin indent on

set showcmd
set laststatus=2
set cursorline
set autochdir
set clipboard=unnamed
set backupdir=~/.vim/backup
set directory=~/.vim/swap
set nowrap
set tabstop=2 shiftwidth=2
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

nnoremap <CR> :nohlsearch<cr>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

" Running tests
function! FindProjectRoot(directory)
  let path = '%:p'
  while (len(expand(path)) > len(expand(path . ':h')))
    let path = path . ':h'
    let file_to_check = expand(path) . '/' . a:directory
    if filereadable(file_to_check) || isdirectory(file_to_check)
      return expand(path)
    endif
  endwhile
endfunction

function! RunTests(filename)
  let specs = ":!bundle exec rspec --color "
  :w
  if a:filename == ""
    exec specs . FindProjectRoot('.git')
  else
    exec specs . a:filename
  end
endfunction

function! SetTestFile()
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  let in_test_file = match(expand("%"), '\(_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

" CtrlP
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

