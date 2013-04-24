set nocompatible
set background=dark

set shortmess+=I

call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme molokai
set guifont=Inconsolata:h14
set cursorline
hi CursorLine term=none cterm=none ctermbg=235
set scrolloff=5
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

function Kees_settabs()
    if len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^\\t"')) > len(filter(getbufline(winbufnr(0), 1, "$"), 'v:val =~ "^ "'))
        set noexpandtab
    endif
endfunction
autocmd BufReadPost * call Kees_settabs()

" NERDTREE
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:ctrlp_map = '<c-o>'
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>
inoremap <C-n> <ESC>:tabnext<CR>
inoremap <C-p> <ESC>:tabprev<CR>

let mapleader = ","
nnoremap <leader>n :NERDTreeToggle<CR>
set laststatus=2

let g:Powerline_symbols = 'fancy'

nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>m :make<CR>
set encoding=utf8
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<CR>
set listchars=tab:▸\ ,eol:¬

set mouse=a
set wildmenu
set wildmode=list:longest,full
vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

" Consistent color of gutter.
highlight clear SignColumn
