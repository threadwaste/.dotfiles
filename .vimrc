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
set hidden

" indentation, the most important of things
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set shiftround
set backspace=indent,eol,start

" reduce ruby to 2,2 width,tabstop; double down on 4,4 for python
autocmd FileType ruby,haml,eruby,sass set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

" info
set title
set showcmd
set showmode

" character displays
set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

" folding
set foldlevelstart=99

" accomodate better mapping handling
set notimeout
set ttimeout
set ttimeoutlen=10

" searching
set hlsearch
set incsearch
set showmatch
set ignorecase smartcase

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
set formatoptions=qnr1
set textwidth=80

set copyindent
set preserveindent

set cursorline

" i love colors, oh my god
syntax enable
set background=dark
colorschem vimbrant

" plug-in options and binds

" nerdtree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

" tagbar
nnoremap <leader>o :TagbarOpenAutoClose<cr>

" lazy stash for /usr/share/vim/vimrc on OSX
" set viminfo='10,\"100,:20,%,n~/.viminfo
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
