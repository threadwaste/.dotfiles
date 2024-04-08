filetype off

call plug#begin('~/.vim/bundle')

" fzf
Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" util
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'dense-analysis/ale'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'

" colors
Plug 'andreypopp/vim-colors-plain'

" lang
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'sebdah/vim-delve', { 'for': 'go' }

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
set nowritebackup
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
autocmd FileType eruby,ruby,html,yamlset ai sw=2 sts=2 et
autocmd FileType python set sw=4 sts=4 et
autocmd FileType go set noet sw=4 sts=4 ts=4

" i love colors, oh my god
syntax enable
set background=dark
set termguicolors
colorscheme plain

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
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

noremap <leader>l :call ToggleList()<cr>
noremap <leader>n :call ToggleLineNumbers()<cr>
noremap <leader>N :call ToggleLineType()<cr>

" ale
let g:ale_fix_on_save = 0
let g:ale_virtualtext_cursor = 0
let g:ale_linters = {
  \ 'asciidoc': [ 'alex', 'textlint', 'proselint', 'write-good' ],
  \ 'go': [ 'golangci-lint' ],
  \ 'markdown': [ 'alex', 'textlint', 'proselint', 'write-good' ],
  \ 'ruby': ['rubocop'],
\ }
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'asciidoc': [ 'textlint' ],
  \ 'bash': [ 'shfmt' ],
  \ 'go': [ 'gofmt', 'goimports' ],
  \ 'html': [ 'prettier' ],
  \ 'json': [ 'prettier' ],
  \ 'markdown': [ 'prettier', 'textlint' ],
  \ 'ruby': ['rubocop'],
  \ 'sh': [ 'shfmt' ],
\ }
let g:ale_sh_shfmt_options = '-i 4'
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast'

" airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#error_symbol = '✗ '
let g:airline#extensions#ale#warning_symbol = '⚠ '

let g:airline#extensions#bufferline#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1

let g:airline#extensions#tagbar#enabled = 1

let g:airline_theme = 'minimalist'

let g:airline_left_sep = '▓▒░'
let g:airline_right_sep = '░▒▓'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'

" bufferline
let g:bufferline_echo = 0

" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gf :Gfetch<cr>

" fzf
noremap <leader>p :Files<cr>
noremap <leader>P :Ag<space>
noremap <leader>b :Buffers<cr>

" go
let g:go_gopls_enabled = 0
let g:go_metalinter_command='golangci-lint'

" tagbar
noremap <leader>t :TagbarToggle<cr>

" ycm
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_disable_for_files_larger_than_kb = 512
let g:ycm_max_num_identifier_candidates = 25
let g:ycm_seed_identifiers_with_syntax = 1

nnoremap <leader>J :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>j :YcmCompleter GoTo<CR>
nnoremap ycp :YcmCompleter GetParent<CR>
nnoremap yct :YcmCompleter GetType<CR>

" lazy stash
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
