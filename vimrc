" vim:fdm=marker

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {'build': {'mac': 'make'}}
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'

NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'Julian/vim-textobj-variable-segment'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'christoomey/vim-conflicted'
NeoBundle 'christoomey/vim-sort-motion'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'gilligan/textobj-gitgutter'
NeoBundle 'glts/vim-textobj-comment'
NeoBundle 'janko-m/vim-test'
NeoBundle 'junegunn/vim-peekaboo'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kurkale6ka/vim-pairs'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mbbill/undotree'
NeoBundle 'pbrisbin/vim-mkdir'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'sickill/vim-pasta'
NeoBundle 'tommcdo/vim-lion'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-projectionist'
NeoBundle 'tpope/vim-rake'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'vim-scripts/ReplaceWithRegister'
NeoBundle 'vim-scripts/gitignore'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'whatyouhide/vim-textobj-xmlattr'

call neobundle#end()

filetype plugin indent on
syntax enable

colorscheme hybrid

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
set encoding=utf-8
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

if has("gui_macvim")
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
  set linespace=1
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
endif

let g:mapleader = "\<space>"

" NeoComplete {{{
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 15
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#force_omni_input_patterns = {
      \ 'ruby': '[^. *\t]\.\w*\|\h\w*::',
      \ 'javascript': '[^. \t]\.\w*'
      \ }

autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,erb,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><c-h> neocomplete#smart_close_popup()."\<c-h>"
inoremap <expr><bs> neocomplete#smart_close_popup()."\<c-h>"
" }}}
" VimFiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'

call vimfiler#custom#profile('default', 'context', {
      \ 'safe': 0,
      \ 'auto-cd': 1
      \ })

autocmd FileType vimfiler nmap <buffer> { <c-u>
autocmd FileType vimfiler nmap <buffer> } <c-d>
autocmd Filetype vimfiler nmap <buffer> <enter> <plug>(vimfiler_expand_or_edit)
autocmd Filetype vimfiler nmap <buffer> o <plug>(vimfiler_cd_or_edit)
autocmd Filetype vimfiler nmap <buffer> <bs> <plug>(vimfiler_switch_to_parent_directory)
autocmd Filetype vimfiler nmap <buffer> h <plug>(vimfiler_smart_h)
autocmd Filetype vimfiler nmap <buffer> j <plug>(vimfiler_loop_cursor_down)
autocmd Filetype vimfiler nmap <buffer> k <plug>(vimfiler_loop_cursor_up)
autocmd Filetype vimfiler nmap <buffer> l <plug>(vimfiler_smart_l)
autocmd filetype vimfiler nmap <buffer> M <plug>(vimfiler_mark_current_line)<plug>(vimfiler_move_file)
autocmd Filetype vimfiler nmap <buffer> D <plug>(vimfiler_mark_current_line)<plug>(vimfiler_delete_file)
autocmd Filetype vimfiler nmap <buffer> R <plug>(vimfiler_rename_file)
autocmd Filetype vimfiler nmap <buffer> n <plug>(vimfiler_new_file)
autocmd Filetype vimfiler nmap <buffer> d <plug>(vimfiler_make_directory)
autocmd Filetype vimfiler nmap <buffer> . <plug>(vimfiler_toggle_visible_ignore_files)
autocmd Filetype vimfiler nmap <buffer> <c-r> <plug>(vimfiler_redraw_screen)

nmap <silent> <leader>n :VimFilerExplorer<cr>
" }}}

augroup vimrc
  autocmd!
  autocmd VimResized * :wincmd =
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
  autocmd FileType gitcommit setl spell
  autocmd FileType gitcommit setl diffopt+=vertical
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

" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


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
let g:peekaboo_compact = 1
let g:projectionist_heuristics = {
      \ "Gemfile": {"alternate": "Gemfile.lock"},
      \ }
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_sass_checkers = ['sass']
let g:syntastic_slim_checkers = ['slimrb']
