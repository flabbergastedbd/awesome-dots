" Basic editor stuff
set number          " show line numbers
set nofoldenable    " disable folding
set nowrap
set modelines=1
set sidescroll=10    " horizontal scrolling by character
set relativenumber             " relative numbering
set shell=bash

set exrc
set secure

set nocompatible              " be iMproved, required
filetype off                  " required

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" Display all matching files when we tab complete
set wildmenu

" ctags command
command! MakeTags !ctags -R --extra=+f --python-kinds=-iv .

" Vundle stuff
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Airline instead of powerline, simple yet great
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'

Plugin 'ervandew/supertab'

Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jremmen/vim-ripgrep'

" Completing engine
Plugin 'Valloric/YouCompleteMe'

" Snippets are the love of my life
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" PEP-8 compliance help
Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
" Plugin 'klen/python-mode'

" DVCS : Git, gitgutter for showing the changes beside line numbers
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
filetype plugin indent on    " required

" Set encoding
set encoding=utf-8
set backspace=2  " osx fix

" Airline Hacks
set laststatus=2                              " without this the status line is not visible
set ttimeoutlen=50                            " to prevent delay when leaving insert mode
let g:airline_powerline_fonts=1               " using patched Inconsolata
let g:airline_theme='powerlineish'            " favourite theme
let g:airline#extensions#tabline#show_buffers=1
let g:rehash256=1

" Colorscheme
colorscheme gruvbox
set background=dark

" Search customisations
set hlsearch incsearch ignorecase " highlight search, incremental search and ignore case
" double escape for removing search highlights
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" File specific hacks
autocmd Filetype python set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype htmldjango set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufWritePre * :%s/\s\+$//e

" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

" Splitfu
" Just navigate around splits vim way
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Ultisnips
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:ultisnips_python_style="google"

" Lint Engine
let g:ale_sign_warning="⚠"
let g:ale_sign_error="x"
let g:airline#extensions#ale#error_symbol="x"
let g:airline#extensions#ale#warning_symbol="⚠ "
nmap <silent> [l <Plug>(ale_previous_wrap)
nmap <silent> ]l <Plug>(ale_next_wrap)
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_lint_on_save=1  " Run lint only on save
let g:ale_lint_on_text_changed=0

" netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" CtrlP
let g:ctrlp_map = '<c-p>'

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Ripgrep
let g:rg_command="rg --vimgrep -g !tags -g '!*.{min,zip,swp}' -g '!.git/*' "
