" vundle and plug-ins
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" ...and its Bundles
Bundle 'chriskempson/base16-vim'
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunich'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'slim-template/vim-slim'
Bundle 'godlygeek/tabular'

" basics
set nocompatible
filetype plugin indent on

set ruler
set number
set numberwidth=5
set hidden

" indentation, the most important of things
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set shiftround
set backspace=indent,eol,start

" double down on tab configuration
autocmd FileType eruby,haml,puppet,ruby,sass set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

" info
set title
set showcmd
set showmode

" character displays
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
colorschem base16-default

" ---------
" functions
" ---------

function! ToggleLineNumbers()
    " toggle line number display

    if(&number == 1)
        set nonumber
    elseif(&relativenumber == 1)
        set norelativenumber
    else
        set number
    endif
endfunc

function! ToggleLineType()
    " toggle between standard and relative line numbers

    if(&relativenumber == 1)
        set number
        set norelativenumber
    elseif(&number == 1)
        set nonumber
        set relativenumber
    endif
endfunc

function! ToggleList()
    " toggle list char display

    if(&list == 1)
        set nolist
    else
        set list
    endif
endfunc

" --------
" bindings
" --------

" toggle line numbers
noremap <leader>n :call ToggleLineNumbers()<cr>
noremap <leader>N :call ToggleLineType()<cr>

" toggle listchars
noremap <leader>l :call ToggleList()<cr>

" clear hlsearch
nnoremap <cr> :nohlsearch<cr>

" --------
" plug-ins
" --------

" nerdtree
noremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

let NERDTreeIgnore = [".*\.pyc$"]

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0

" tagbar
nnoremap <leader>o :TagbarToggle<cr>

" lazy stash
" set viminfo='10,\"100,:20,%,n~/.viminfo
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
