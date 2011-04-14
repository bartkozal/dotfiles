call pathogen#runtime_append_all_bundles() 
call pathogen#helptags() 

set nocompatible
set encoding=utf-8

set backupdir=~/.vim/tmp/
set directory=~/.vim/tmp/
set undodir=~/.vim/tmp/

set undofile
set history=30
set listchars=tab:▸\ ,eol:¬
set cursorline
set statusline=[%n]%y\ %f\ %m%r%=%l/%L:%c\ [%p%%]

syntax enable
set background=dark
colorscheme solarized

set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

set showmode
set showcmd
set wildmenu
set hidden
set lazyredraw
set laststatus=2
set cpoptions+=$

set incsearch
set hlsearch

nnoremap <leader>\ q:
nnoremap <leader>/ q/
nnoremap <leader>? q?

nnoremap ; :

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

vnoremap <D-]> >gv
vnoremap <D-[> <gv

nnoremap <D-k> :noh<CR>
nnoremap <D-i> :set list!<CR>

nnoremap <D-F> :Ack<space>

map <D-0> :ConqueTerm zsh<CR>
map <D-1> :NERDTreeToggle<CR>
map <D-2> :GundoToggle<CR>
map <D-3> :TlistToggle<CR>

let g:gundo_help = 0
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen = 1
