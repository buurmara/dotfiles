set encoding=utf-8
set fileencoding=utf-8

" line numbers
set number

" mouse support
set mouse=a

set pumheight=10
set hidden

" spell checking
"set spell
"set spelllang=en,de

" correct splits
set splitbelow
set splitright

" better search
set ignorecase
set smartcase
set incsearch

" indentation
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent
"set autoindent

" disable automatic continuation of commenting
autocmd FileType * set formatoptions-=cro

set conceallevel=0

set updatetime=300
set timeoutlen=500

" global copy and paste buffer
set clipboard=unnamedplus

" leader key
nnoremap <Space> <Nop>
let g:mapleader = "\<Space>"

" force write
cmap w!! w !sudo tee %
