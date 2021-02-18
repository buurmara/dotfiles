" line numbers
set number

" mouse support
set mouse=a

" set completion menu height
set pumheight=10

" disable showing current mode
set noshowmode

" disable introductory message
set shortmess=I

" hide buffers
set hidden

" command line completion menu
set wildmenu

" disable wrapping a line in the middle of a word
set linebreak

" disable auto comment insertion
set paste

" spell checking
" set spell
" set spelllang=en,de

" correct splits
set splitbelow
set splitright

" better search
set ignorecase
set smartcase
set incsearch
set hlsearch

" indentation
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
set autoindent

set backspace=indent,eol,start

" global copy and paste buffer
set clipboard=unnamedplus

" leader key
nnoremap <space> <nop>
let mapleader="\<space>"

" force write
cmap w!! w !sudo tee %
