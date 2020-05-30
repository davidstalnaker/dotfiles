"------------- general settings -----------------
set nocompatible                 "disable vi compatibility
syntax on                        "enable syntax highlighting
filetype plugin indent on        "enable filetype detection
set shortmess+=I                 "don't show intro screen
set scrolloff=5                  "number of lines of padding
set encoding=utf8                "use unicode
set showmatch                    "show matching brackets / parens
set wildmenu                     "autocompletion for commands
set wildmode=list:longest,full

" searching
set ignorecase                   "ignore case when searching
set smartcase                    "unless the search has caps
set incsearch                    "search as you type
set hlsearch                     "show previous search results

" tabs
set tabstop=2                    "tabs are 2 spaces
set softtabstop=2                "soft tabs are 2 spaces
set shiftwidth=2                 "(auto)indent inserts 2 spaces
set expandtab                    "use spaces for tabs

" theme
set cursorline
highlight CursorLine term=none cterm=none ctermbg=235

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

" replace from selection
vnoremap <leader>r "hy:.,$s/<C-r>h//gc<left><left><left>

" clear selection
nnoremap <leader><space> :noh<CR>

