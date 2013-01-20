"basics
set nocompatible
set ruler
set nu

"details
set showcmd
set showmode

"indent
set autoindent
set smarttab

"whitespace management
set shiftwidth=2
set softtabstop=2

"folds on indent; force required
set foldmethod=indent
set foldnestmax=16
set nofoldenable

"goodies
set ttyfast
set cursorline

"terminfo puking color? lie
"set t_Co=256

syntax enable
filetype plugin indent on

"pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

"i love colors, oh my god
set background=dark
colorschem solarized

"
"lazt stash for /usr/share/vim/vimrc on OSX
"set hlsearch
"set viminfo='10,\"100,:20,%,n~/.viminfo
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
