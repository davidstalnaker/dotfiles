"------------- general settings -----------------
set nocompatible                 "disable vi compatibility
syntax on                        "enable syntax highlighting
filetype plugin indent on        "enable filetype detection
set shortmess+=I                 "don't show intro screen
set scrolloff=5                  "number of lines of padding
set laststatus=2                 "always draw status line
set number                       "line numbers
set encoding=utf8                "use unicode
set mouse=a                      "enable mouse support
set showmatch                    "show matching brackets / parens
set wildmenu                     "autocompletion for commands
set wildmode=list:longest,full

" searching
set ignorecase                   "ignore case when searching
set smartcase                    "unless the search has caps
set incsearch                    "search as you type
set hlsearch                     "show previous search results

" tabs
set tabstop=4                    "tabs are 4 spaces
set softtabstop=4                "soft tabs are 4 spaces
set shiftwidth=4                 "(auto)indent inserts 4 spaces
set expandtab                    "use spaces for tabs

" theme
colorscheme molokai
set background=dark
set guifont=Monaco:h12
set cursorline
highlight CursorLine term=none cterm=none ctermbg=235
set listchars=tab:▸\ ,eol:¬
highlight clear SignColumn

"------------------ mappings --------------------

" comma for leader
let mapleader = ","

" tab navigation
nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>
inoremap <C-n> <ESC>:tabnext<CR>
inoremap <C-p> <ESC>:tabprev<CR>

" split navigation
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move vertically in soft-wrapped lines
nnoremap j gj
nnoremap k gk

" make
nnoremap <leader>m :make<CR>

" replace from selection
vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

" clear selection
nnoremap <leader><space> :noh<CR>

"----------------- plugins ---------------------

" pathogen for plugins
call pathogen#infect()

" nerdtree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <leader>n :NERDTreeToggle<CR>

" ctrl-p (mapped to ctrl-o...)
let g:ctrlp_map = '<c-o>'

" powerline
let g:Powerline_symbols = 'fancy'

" vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'latexmk -output-directory=output -pdf -f $*'

" golang
set rtp+=/usr/local/go/misc/vim
