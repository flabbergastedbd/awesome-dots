" Basic editor stuff
set number          " show line numbers
set spell
set spelllang=en    " spell languages
set nofoldenable    " disable folding
set nowrap
set modelines=1
set sidescroll=10    " horizontal scrolling by character
set relativenumber             " relative numbering
set shell=fish
set colorcolumn=120

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
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'

" Languages
Plug 'fatih/vim-go'
" Plug 'rust-lang/rust.vim'
Plug 'pwntester/codeql.nvim'
Plug 'keith/swift.vim'

if isdirectory('/usr/local/opt/fzf')
	Plug '/usr/local/opt/fzf'
endif
Plug 'junegunn/fzf.vim'
Plug 'miki725/vim-ripgrep'
" https://github.com/jremmen/vim-ripgrep/issues/41
" Plug 'jremmen/vim-ripgrep'

" Completing engine
" Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-surround'

" Snippets are the love of my life
Plug 'honza/vim-snippets'

" Linting
Plug 'nvie/vim-flake8'

" DVCS : Git, gitgutter for showing the changes beside line numbers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/limelight.vim'

" Note taking
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel'

" Themes
Plug 'morhetz/gruvbox'

call plug#end()
syntax on
filetype plugin indent on    " required

" Set encoding
set encoding=utf-8
set backspace=2  " osx fix

" Status line Hacks
set laststatus=2                              " without this the status line is not visible
set ttimeoutlen=50                            " to prevent delay when leaving insert mode
let g:lightline = {'colorscheme': 'wombat'}
let g:rehash256=1

" Colorscheme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'

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
autocmd Filetype markdown set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ql set expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufRead,BufNewFile *.md set filetype=vimwiki

let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

" Note taking
let g:vimwiki_list = [{'path': '~/workspace/notes', 'syntax': 'markdown', 'ext': '.md'}]
let g:zettel_format = "%y%m%d-%H%M"
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_options = [{"template": "~/workspace/zettelkasten-templates/note.tpl"}]

" Splitfu
" Just navigate around splits vim way
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Ultisnips
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-e> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" netrw
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" FZF
map ; :Files<CR>

" Markbar
map ' :Marks<CR>

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Ripgrep
let g:rg_command="rg --vimgrep -g !tags -g '!*.{min,zip,swp}' -g '!.git/*' "

" Tagbar
nmap <F8> :TagbarToggle<CR>
" autocmd VimEnter * nested :call tagbar#autoopen(1)

" Text justifying
ru macros/justify.vim

" Writing
let g:goyo_width = 120
let g:goyo_height = '90%'
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

command Beautify :call Beautify()

" Custom functions
function! Beautify()
	if (&filetype == "javascript") || (&filetype == "json")
		execute "%!js-beautify"
	else
		execute "%!clang-format"
	endif
endfunction

