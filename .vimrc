" vundle and plug-ins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Vundle
Bundle 'gmarik/Vundle.vim'

" ...and its Bundles
Bundle 'bling/vim-airline'
Bundle 'godlygeek/tabular'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'hdima/python-syntax'
Bundle 'oscarh/vimerl'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'scrooloose/syntastic'
Bundle 'slim-template/vim-slim'
Bundle 'sjl/badwolf'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/taglist.vim'

" basics
set nocompatible
filetype plugin indent on

set ruler
set number
set numberwidth=5
set hidden

" backups
set backup
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/var/tmp,/tmp

" indentation, the most important of things
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set backspace=indent,eol,start

" info
set title
set showcmd
set showmode
set laststatus=2

" wilds
set wildignore+=*.pyc,*/tmp/*,*/.tmp/*,*/.bundle/*,*/.kitchen/*,*/.librarian/*
set wildmenu

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

" double down on tab configuration
autocmd FileType eruby,haml,puppet,ruby,sass set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et


" i love colors, oh my god
syntax enable
colorschem badwolf

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

" --------------------
" bindings and plugins
" --------------------
let mapleader=","

" toggle line numbers
noremap <leader>n :call ToggleLineNumbers()<cr>
noremap <leader>N :call ToggleLineType()<cr>

" toggle listchars
noremap <leader>l :call ToggleList()<cr>

" clear hlsearch
nnoremap <cr> :nohlsearch<cr>

" airline
let g:airline_theme = 'badwolf'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = '⎇'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" ctrlp
let g:ctrlp_show_hidden = 1

noremap <leader>p :CtrlP<cr>
noremap <leader>P :CtrlP<space>
noremap <leader>b :CtrlPBuffer<cr>

" rainbow_parentheses
noremap <leader>( :RainbowParenthesesToggle<cr>

" taglist
noremap <leader>t :TlistToggle<cr>
let g:Tlist_Close_On_Select = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1

if system('uname') =~? '^darwin'
    let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
endif

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0

let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-class_parameter_defaults-check'

" lazy stash
" set viminfo='10,\"100,:20,%,n~/.viminfo
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
