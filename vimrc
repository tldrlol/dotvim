"" Unfuck Vim

" sane defaults
set nocompatible
set hidden
set history=2048
set backspace=eol,indent,start
set ignorecase smartcase incsearch
set path+=**

" ui
set ruler
set guioptions= guicursor+=a:blinkon0
set wildmenu wildmode=full

" font rendering
set encoding=utf-8
set renderoptions=type:directx,gamma:1.0,contrast:1.0,level:1,geom:1,renmode:3,taamode:1

" modern editing experience
set expandtab shiftwidth=2 softtabstop=2 tabstop=2
filetype indent plugin on
syntax on

" stop file littering
let &viminfo   .= ',n' . split(&runtimepath, ',')[0] . '/viminfo'
let &directory  =        split(&runtimepath, ',')[0] . '/swap'

" working copy/paste
if has("win32")
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" 24-bit color support
if has("termguicolors") && &term =~ '-256color$'
  set termguicolors
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif

" prefer ripgrep over built-in implementation
if executable("rg")
  set grepprg=rg\ --vimgrep
endif


"" Bindings

let mapleader=" "

" who even uses this garbage?
nnoremap Q @q

cnoremap jk <Esc>
cnoremap kj <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" undoable c-u/c-w
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" miscellaneous bindings
nnoremap <Leader>cd  :cd %:p:h<CR>
nnoremap <Leader>lcd :lcd %:p:h<CR>

" better command history scrolling
cnoremap <c-n> <down>
cnoremap <c-p> <up>


"" Language customization

augroup language_settings
  autocmd!
  autocmd FileType haskell  setlocal ai fp=stylish-haskell
  autocmd FileType markdown setlocal spell tw=72
augroup end


"" Plugins

packloadall


"" Appearance

let g:gruvbox_bold=0
let g:gruvbox_italic=0
let g:gruvbox_contrast_light='soft'
let g:gruvbox_contrast_dark='hard'

let g:nofrils_heavycomments=1
let g:nofrils_heavylinenumbers=1

set background=dark
"colorscheme base16-atelier-plateau
"colorscheme base16-tomorrow-night
"colorscheme dk-inkpot
"colorscheme dk-visualstudio
"colorscheme gruvbox
colorscheme jellybeans
"colorscheme lucius
"colorscheme nofrils-dark
"colorscheme tender

set guifont=consolas:h11
