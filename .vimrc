" Basic editor stuff
syntax on
set listchars=tab:>-
set number
set nofoldenable
set nowrap
set modelines=1
set sidescroll=1
set shell=bash

" Enable iMproved
set nocompatible
filetype off

" Vundle stuff
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Airline instead of powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'majutsushi/tagbar'

" Browsing files & fuzzy file search
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

" PEP-8 compliance help
Plugin 'nvie/vim-flake8'

" DVCS : Git, gitgutter for showing the changes beside line numbers
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Enable airline in tmux
Bundle 'edkolev/tmuxline.vim'

" i3-vim-syntax
Plugin 'PotatoesMaster/i3-vim-syntax'

" Enable code completion
Plugin 'Valloric/YouCompleteMe'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion = 1

" Show marks
Plugin 'kshenoy/vim-signature'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set encoding and color mode
set encoding=utf-8
set t_Co=256
set t_ut=

" Fix symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" Airline Hacks
set laststatus=2                              " without this the status line is not visible
set ttimeoutlen=50                            " to prevent delay when leaving insert mode
let g:airline#extensions#tabline#enabled = 1  " it is disabled by default, so
let g:airline_powerline_fonts=1               " using patched font
let g:airline_theme='powerlineish'            " favorite theme
let g:rehash256=1

" Colorscheme
let g:molokai_original=1
colorscheme molokai
set background=dark

" Search customisations
set hlsearch incsearch ignorecase " highlight search, incremental search and ignore case
" double escape for removing search highlights
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

" Define commands for common typos
command WQ wq
command Wq wq
command W w
command Q q

" Linux kernel defauls
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

" Enable list for Kconfig
autocmd FileType kconfig setlocal list

" Override space/tab settings for Java and Python
autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType groovy setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Override space/tab settings for javascript, php, html, and css
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab wrap linebreak nolist
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" Custom keybinds
nmap ,t :tabs<Enter>
nmap ,r :registers<Enter>
nmap ,b :<C-U>exec (v:count ? "b" . v:count : "ls")<Enter>
nmap ,; :bp<Enter>
nmap ,' :bn<Enter>
nmap ,f :set ff=unix<Enter>
nmap ,d :set ff=dos<Enter>
