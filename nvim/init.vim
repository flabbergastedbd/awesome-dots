" Basic editor stuff
set number          " show line numbers
set foldenable
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
Plug 'rust-lang/rust.vim'
Plug 'pwntester/codeql.nvim'
Plug 'keith/swift.vim'

if isdirectory('/usr/local/opt/fzf')
	Plug '/usr/local/opt/fzf'
endif
Plug 'junegunn/fzf.vim'

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
Plug 'junegunn/gv.vim'

Plug 'majutsushi/tagbar'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'cespare/vim-toml'
Plug 'ferrine/md-img-paste.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'michal-h21/vim-zettel'

" Terminal
Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'

Plug 'nvim-treesitter/nvim-treesitter' " We recommend updating the parsers on update
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
let g:gruvbox_contrast_light='soft'

" Search customisations
set hlsearch incsearch ignorecase " highlight search, incremental search and ignore case
" double escape for removing search highlights
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Semicolon
nmap ; :

" Leader
nnoremap <space> <Nop>
let mapleader=" "

" File specific hacks
autocmd Filetype python set expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype htmldjango set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype html set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascript set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype typescript set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype markdown set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype xml set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype ql set expandtab tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufNewFile,BufRead *.webidl,*.ipdl set ft=idl
autocmd BufNewFile,BufRead *.jsm set ft=javascript

let denylist = ['markdown']
autocmd BufWritePre * if index(denylist, &ft) < 0 | :%s/\s\+$//e
" autocmd BufRead,BufNewFile *.md setlocal wrap  " Wrap lines for markdown
" autocmd BufRead,BufNewFile *.md set textwidth=120  " Wrap lines for markdown

" Backup locations
set backup
set backupdir=~/.config/nvim/backup
set directory=/tmp

" codeql
let g:codeql_max_ram = 16000
let g:codeql_search_path = ["/Users/bmachira/workspace/linkedin/qlin_trunk"]
let g:codeql_fmt_onsave = 1

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

" Markbar
map ' :Marks<CR>

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Ripgrep
let g:rg_command="rg --vimgrep -g !tags -g '!*.{min,zip,swp}' -g '!.git/*' "

" Tagbar
nmap <F8> :TagbarToggle<CR>
map <F11> :setlocal spell! spelllang=en_us<CR>
let tagbar_denylist = ["markdown", "vimwiki", "vimwiki.markdown", "markdown.pandoc"]
autocmd VimEnter * if stridx(&ft, "markdown") < 0 | TagbarOpen

" Text justifying
ru macros/justify.vim

" Writing
let g:goyo_width = '100%'
let g:goyo_height = '100%'
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" Format
let g:rustfmt_autosave = 1

command Beautify :call Beautify()

" Custom functions
function! Beautify()
	if (&filetype == "javascript") || (&filetype == "json")
		execute "%!js-beautify"
	else
		execute "%!clang-format"
	endif
endfunction

" Custom mappings
nnoremap <leader>w :w<CR>
nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>q :q<CR>

" Floaterm
tnoremap <Esc><Esc> <C-\><C-n>
let g:floaterm_autoclose = 1

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "markdown" },
  },
}
EOF

"" Writing
" Image copy paste
autocmd FileType markdown nmap <buffer><silent> <leader>zp :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'images'

" Vimwiki config
let g:vimwiki_list = [{'path': '~/workspace/notes/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_markdown_link_ext=1
let g:vimwiki_conceallevel=2
let g:vimwiki_autowriteall=0 " Irritating
let g:vimwiki_folding='custom'
let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings=0
au FileType vimwiki set filetype=markdown.pandoc

" vim-pandoc
let g:pandoc#folding#fdc=0
let g:pandoc#folding#fold_yaml=1
let g:pandoc#folding#foldlevel_yaml=11 " As per no heading text level and how to fold only yaml frontmatter
let g:pandoc#folding#level=10
let g:pandoc#syntax#conceal#urls=1
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#folding#mode = "syntax"
let g:pandoc#modules#enabled = ["folding", "formatting"]
let g:pandoc#formatting#mode = "ha"
let g:pandoc#formatting#textwidth = 120

" Zettel config
let g:zettel_random_chars=16
let g:zettel_date_format = "%Y-%m-%d"
let g:zettel_format = "%random"
let g:zettel_default_mappings = 0
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_options = [{"front_matter" : [["taxonomies", ""]]}]
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki xmap <leader>zn <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap <leader>zs <Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap <leader>zo :ZettelOpen<CR>
  autocmd FileType vimwiki nmap <leader>zb :ZettelBackLinks<CR>
  autocmd FileType vimwiki nmap <leader>fx <Plug>VimwikiSplitLink
  autocmd FileType vimwiki nmap <leader>fv <Plug>VimwikiVSplitLink
augroup END

" Goyo: Hide tmux pane when switching to write
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
