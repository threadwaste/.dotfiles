" vundle and plug-ins
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin('~/.vim/bundle')

" util
Plug 'bling/vim-airline'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" colors
Plug 'chriskempson/base16-vim'
Plug 'sjl/badwolf'

" lang
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'oscarh/vimerl', { 'for': 'erlang' }

Plug 'fatih/vim-go', { 'for': 'go' }

Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'puppetlabs/puppet-syntax-vim', { 'for': 'puppet' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

" basics
set nocompatible
filetype plugin indent on

set shell=/bin/bash

set ruler
set number
set numberwidth=5
set hidden

" backups
set nobackup
set backupdir=~/.vim-tmp,~/tmp,/tmp
set directory=~/.vim-tmp//,~/tmp//,/tmp//

" indentation, the most important of things
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set backspace=indent,eol,start
set nojoinspaces

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
autocmd FileType eruby,haml,puppet,ruby,html,yaml,sass set ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et

" i love colors, oh my god
syntax enable
colorscheme base16-tomorrow

" functions
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

" bindings and plugins
nnoremap <cr> :nohlsearch<cr>

let mapleader=","

" saner split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

noremap <leader>l :call ToggleList()<cr>
noremap <leader>n :call ToggleLineNumbers()<cr>
noremap <leader>N :call ToggleLineType()<cr>

" airline
let g:airline_theme = 'base16'
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

let g:ctrlp_user_command = {}
let g:ctrlp_user_command.types = {}
let g:ctrlp_user_command.types.1 = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command.types.2 = ['.hg', 'hg --cwd %s locate -I .']
let g:ctrlp_user_command.fallback = 'ag %s -i --nocolor --nogroup --hidden -g ""
    \ --ignore .git --ignore .hg --ignore .DS_STORE'

" vim-go
let g:go_fmt_autosave = 0

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1

let g:neocomplete#auto_completion_start_length = 4
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#max_list = 20
let g:neocomplete#max_keyword_width = 40

let g:neocomplete#min_keyword_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 2

" rainbow_parentheses
noremap <leader>( :RainbowParenthesesToggle<cr>

" syntastic
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '≈'
let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_enable_balloons = 0

let g:syntastic_puppet_puppetlint_args = '--no-80chars-check --no-class_parameter_defaults-check'

" tagbar
noremap <leader>t :TagbarToggle<cr>

" lazy stash
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
