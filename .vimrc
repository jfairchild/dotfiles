call pathogen#infect()
filetype plugin indent on

syntax on
colorscheme molokai
set background=dark

set t_Co=256

set nocompatible

if exists("&relativenumber")
	set relativenumber
else
	set number
endif

set ruler

"Set encoding
set encoding=utf-8

"Disable modelines
set modelines=0

"Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"set list listchars=tab:▸\ ,eol:¬

"Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"Tab completion
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
let mapleader = ","
nnoremap / /\v
vnoremap / /\v

set showmatch
set matchtime=0

nnoremap <leader><space> :noh<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

augroup myvimrchooks
	au!
	autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Flag problematic whitespace (trailing spaces, spaces before tabs).
highlight BadWhitespace term=standout ctermbg=red guibg=red
match BadWhitespace /[^* \t]\zs\s\+$\| \+\ze\t/
autocmd BufWritePre * :%s/\s\+$//e

"Makes Vim handle long lines correctly
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

"MacVim options
set guifont=Monaco:h14
set guioptions-=rL
