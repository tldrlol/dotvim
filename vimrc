"" Unfuck Vim

" sane defaults
set nocompatible
set history=2048
set ignorecase smartcase incsearch
set path+=** " enables recursive :find

" ui
set ruler
set guioptions= guicursor+=a:blinkon0
set wildmenu wildmode=longest,full

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
if has("termguicolors") && &term =~ '256color'
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
  autocmd FileType c,cpp   setlocal et sts=4 sw=4 ts=4
  autocmd FileType haskell setlocal fp=stylish-haskell
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

"colorscheme gruvbox
"colorscheme jellybeans
"colorscheme nofrils-dark
"colorscheme tender

set guifont=consolas:h11
