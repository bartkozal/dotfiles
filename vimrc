" vim:fdm=marker

set nocompatible
set encoding=utf-8

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimfiler.vim' | Plug 'Shougo/unite.vim' | Plug 'Shougo/vimproc.vim', {'do': 'make'}

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/gitignore'
Plug 'w0ng/vim-hybrid'

Plug 'Julian/vim-textobj-variable-segment'
Plug 'gilligan/textobj-gitgutter'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'poetic/vim-textobj-javascript'
Plug 'sgur/vim-textobj-parameter'
Plug 'tek/vim-textobj-ruby'
Plug 'whatyouhide/vim-textobj-xmlattr'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-conflicted'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'junegunn/vim-peekaboo'
Plug 'kien/ctrlp.vim'
Plug 'kurkale6ka/vim-pairs'
Plug 'mbbill/undotree'
Plug 'rhysd/clever-f.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-pasta'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'

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
set statusline=%<%f\ %y%r%m%=%l:%c\ \ %p
set t_vb=
set tabstop=2 softtabstop=2 shiftwidth=2
set ttyfast
set undodir=~/.vim/undo//
set undofile
set wildignore+=.hg,.git,.svn,.DS_Store
set wildmenu

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
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
autocmd BufNewFile,BufRead *.tag setlocal ft=html

inoremap jk <esc>

nnoremap <leader>v :vs $MYVIMRC<cr>

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
nnoremap ;w :w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap j gj
nnoremap k gk
nnoremap Y y$
nnoremap <silent> H :call FirstCharOrFirstCol()<cr>
nnoremap L $
nnoremap ge `.
nnoremap <c-z> <c-a>
nnoremap <c-s> :%s///g<left><left>
nnoremap <silent> <cr> :nohlsearch<bar>:echo<cr>

nnoremap <silent> <leader>s :Gstatus<cr>
nnoremap <silent> <leader>d :Gdiff<cr>

cnoremap Ag Ag!
cnoremap <c-k> <up>
cnoremap <c-j> <down>

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

let g:clever_f_smart_case = 1
let g:peekaboo_compact = 1

nnoremap cm <plug>Commentary
nnoremap sj :SplitjoinSplit<cr>
nnoremap sk :SplitjoinJoin<cr>

" airline {{{
" let g:airline_section_b = "%{airline#util#wrap(airline#extensions#hunks#get_hunks(), 0)} %{g:airline_symbols.branch} %{gita#statusline#format('%lb')}"
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
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
" delimitMate {{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = '(:),[:],{:}'
" }}}
" gitgutter {{{
let g:gitgutter_map_keys = 0

nmap ]h <plug>GitGutterNextHunk
nmap [h <plug>GitGutterPrevHunk
" }}}
" incsearch, asterisk {{{
highlight IncSearchCursor ctermfg=0 ctermbg=52 guifg=#000000 guibg=#cc6666
highlight IncSearchOnCursor ctermfg=0 ctermbg=52 guifg=#000000 guibg=#cc6666

let g:incsearch#magic = '\v'

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map * <Plug>(incsearch-nohl)<Plug>(asterisk-z*)
map g* <Plug>(incsearch-nohl)<Plug>(asterisk-z#)
map # <Plug>(incsearch-nohl)<Plug>(asterisk-gz*)
map g# <Plug>(incsearch-nohl)<Plug>(asterisk-gz#)
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
let g:syntastic_sass_checkers = ['sass']

let g:syntastic_error_symbol = "»"
let g:syntastic_style_error_symbol = "»"
let g:syntastic_warning_symbol = "»"
let g:syntastic_style_warning_symbol = "»"
" }}}
" vimfiler {{{
autocmd FileType vimfiler nmap <buffer> { <c-u>
autocmd FileType vimfiler nmap <buffer> } <c-d>
autocmd Filetype vimfiler nmap <buffer> <enter> <plug>(vimfiler_cd_or_edit)
autocmd Filetype vimfiler nmap <buffer> o <plug>(vimfiler_cd_or_edit)
autocmd Filetype vimfiler nmap <buffer> <bs> <plug>(vimfiler_switch_to_parent_directory)
autocmd Filetype vimfiler nmap <buffer> - <plug>(vimfiler_switch_to_parent_directory)
autocmd Filetype vimfiler nmap <buffer> h <plug>(vimfiler_smart_h)
autocmd Filetype vimfiler nmap <buffer> j <plug>(vimfiler_loop_cursor_down)
autocmd Filetype vimfiler nmap <buffer> k <plug>(vimfiler_loop_cursor_up)
autocmd Filetype vimfiler nmap <buffer> l <plug>(vimfiler_expand_or_edit)
autocmd Filetype vimfiler nmap <buffer> m <plug>(vimfiler_mark_current_line)<plug>(vimfiler_move_file)
autocmd Filetype vimfiler nmap <buffer> d <plug>(vimfiler_mark_current_line)<plug>(vimfiler_delete_file)
autocmd Filetype vimfiler nmap <buffer> r <plug>(vimfiler_rename_file)
autocmd Filetype vimfiler nmap <buffer> n <plug>(vimfiler_new_file)
autocmd Filetype vimfiler nmap <buffer> b <plug>(vimfiler_make_directory)
autocmd Filetype vimfiler nmap <buffer> v <plug>(vimfiler_split_edit_file)
autocmd Filetype vimfiler nmap <buffer> . <plug>(vimfiler_toggle_visible_ignore_files)
autocmd Filetype vimfiler nmap <buffer> e <plug>(vimfiler_execute_external_filer)
autocmd Filetype vimfiler nmap <buffer> <c-r> <plug>(vimfiler_redraw_screen)

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'

call vimfiler#custom#profile('default', 'context', {
      \ 'safe': 0,
      \ 'auto_cd': 1
      \ })

nmap <silent> <leader>n :VimFilerExplorer<cr>
nmap <silent> - :VimFilerBufferDir<cr>
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
      \   'html,xml,erb,ejs' : ['<', 're!<.*\s', '</']
      \ }
" }}}
