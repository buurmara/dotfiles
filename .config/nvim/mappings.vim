" menu navigation
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l

" resize windows
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-j> :resize +2<CR>
nnoremap <C-k> :resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

" tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" better tabbing
vnoremap < <gv
vnoremap > >gv

" macro over visual range
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" clear search highlighting
nnoremap <F10> :nohlsearch<CR>
