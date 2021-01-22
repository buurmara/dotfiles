filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'dense-analysis/ale'
Plugin 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plugin 'justinmk/vim-sneak'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ap/vim-css-color'
Plugin 'lervag/vimtex'
call vundle#end()
filetype plugin on

" deoplete
let g:deoplete#enable_at_startup = 1

" sneak
let g:sneak#label = 1

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
autocmd Filetype tex setl updatetime=1

" theme
syntax enable
colorscheme palenight
if (has("termguicolors"))
  set termguicolors
endif
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
let g:palenight_terminal_italics=1
let g:palenight_gui_italic = 1
let g:lightline = { 'colorscheme': 'palenight' }
let g:airline_theme = "palenight"
