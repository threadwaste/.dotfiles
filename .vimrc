" pathogen and plug-ins
filetype off
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

" basics
set nocompatible
filetype plugin indent on

set ruler
set number
set norelativenumber

" info
set title
set showcmd
set showmode

" character displays
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

" folding
set foldlevelstart=99

" accomodate better mapping handling
set notimeout
set ttimeout
set ttimeoutlen=10

" indent
set autoindent
set shiftwidth=2
set softtabstop=2
set shiftround

" buffer management
set autoread
set autowrite

" terminal
set ttyfast
set notimeout
set ttimeout

" completion 
set completeopt=menuone,longest,preview

" text management/visuals
set textwidth=80
set cursorline
set colorcolumn=+1

" terminfo puking color? lie
" set t_Co=256

" i love colors, oh my god
syntax enable
colorschem molokai

" plug-in options and binds

" nerdtree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

" tagbar
nnoremap <leader>o :TagbarOpenAutoClose<cr>

" lazy stash for /usr/share/vim/vimrc on OSX
" set hlsearch
" set viminfo='10,\"100,:20,%,n~/.viminfo
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
