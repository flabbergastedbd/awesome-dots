syntax on
set number
set nofoldenable    " disable folding
set nowrap
set modelines=1
set sidescroll=1    " horizontal scrolling by character

set nocompatible               " be iMproved
filetype off                   " required!

call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'nvie/vim-flake8'
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set encoding=utf-8

" airline hacks
set laststatus=2
let g:airline_powerline_fonts=1
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" Molokai theme
colorscheme molokai
let g:rehash256=1
