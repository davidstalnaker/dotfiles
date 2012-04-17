set nocompatible
set background=dark

set shortmess+=I

call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai
set guifont=Inconsolata:h14
set cul
hi CursorLine term=none cterm=none ctermbg=235
set scrolloff=5
set showmatch
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4

" NERDTREE
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let mapleader = ","
nnoremap <leader>nt :NERDTreeToggle<CR>
set laststatus=2

inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set encoding=utf8
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
set mouse=a
set wildmenu
set wildmode=list:longest,full
