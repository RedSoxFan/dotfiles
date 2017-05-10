""" Basic editor stuff
filetype off
syntax on
set listchars=tab:>-
set nocompatible
set nofoldenable
set nowrap
set nrformats+=alpha
set number
set modelines=1
set shell=bash
set sidescroll=1

""" Vundle stuff
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"" Interface enhancements

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

set laststatus=2                              " without this the status line is not visible
set ttimeoutlen=50                            " to prevent delay when leaving insert mode
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:rehash256=1

" Buffer for viewing and navigating ctags
Plugin 'majutsushi/tagbar'
let g:tagbar_autofocus = 1

" Show marks in the gutter
Plugin 'kshenoy/vim-signature'

" Show the git branch and diff --status in the statusline
Plugin 'tpope/vim-fugitive'

" Show the git changes per line in the gutter
Plugin 'airblade/vim-gitgutter'

" Enable code completion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion = 1

"" Syntax Files and Language Specific Enhancements

" i3-vim-syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

" sway-vim-syntax
Plugin 'aouelete/sway-vim-syntax'

" PEP-8 compliance help
Plugin 'nvie/vim-flake8'

" Preview Colors
Plugin 'chrisbra/Colorizer'
let g:colorizer_auto_filetype='css,html,php,js,scss'
let g:colorizer_fgcontrast=1

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""" Set encoding and color mode
set encoding=utf-8
set t_Co=256
set t_ut=

""" Colorscheme
let g:molokai_original=1
colorscheme molokai
set background=dark

""" Search customisations
" highlight search, incremental search and ignore case
set hlsearch incsearch ignorecase
" double escape for removing search highlights
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

"" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

""" Syntax defaults
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType groovy setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab wrap linebreak nolist
autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType kconfig setlocal list
autocmd FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

""" Define commands for common typos
command WQ wq
command Wq wq
command W w
command Q q

""" Custom keybinds
let mapleader=","
nmap <Leader>t :tabs<Enter>
nmap <Leader>r :registers<Enter>
nmap <Leader>b :<C-U>exec (v:count ? "b" . v:count : "ls")<Enter>
nmap <Leader>; :bp<Enter>
nmap <Leader>' :bn<Enter>
nmap <Leader>m :marks<Enter>
nmap <Leader>f :set ff=unix<Enter>
nmap <Leader>d :set ff=dos<Enter>
nmap <F9> :TagbarToggle<Enter>
