" menu navigation
inoremap <expr> <M-j> ("\<C-n>")
inoremap <expr> <M-k> ("\<C-p>")

" resize windows
nnoremap <C-h> :vertical resize +2<CR>
nnoremap <C-j> :resize +2<CR>
nnoremap <C-k> :resize -2<CR>
nnoremap <C-l> :vertical resize -2<CR>

" tab to next buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" better tabbing
vnoremap < <gv
vnoremap > >gv

" clear search highlighting
nnoremap <F10> :nohlsearch<CR>
