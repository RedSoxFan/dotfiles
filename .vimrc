"" Basic editor stuff
filetype off
syntax on
set backspace=indent,eol,start
set listchars=tab:>-
set nocompatible
set nofoldenable
set nowrap
set nrformats+=alpha
set number
set shell=bash
set sidescroll=1

"" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
let g:airline_exclude_preview=1

" Navigation and Editing
Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
let g:tagbar_autofocus = 1
nmap <F9> :TagbarToggle<Enter>

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax Files
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'aouelete/sway-vim-syntax', { 'for': 'sway' }

" Python Development
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'davidhalter/jedi-vim'  " In order to have the shebang version detection autocmd below, cannot lazy load
nmap <Leader>2 :call jedi#force_py_version(2)<Enter>
nmap <Leader>3 :call jedi#force_py_version(3)<Enter>
autocmd FileType,BufEnter python call jedi#force_py_version(getline(1)=~#"python2" ? 2 : 3)

"" End of vim-plug section
call plug#end()

"" Set encoding and color mode
set encoding=utf-8
set t_Co=256
set t_ut=

"" Colorscheme
let g:molokai_original=1
let g:rehash256=1
colorscheme molokai

"" Search customizations
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

"" Enable very-magic mode so regex works normally
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
cnoremap %s/ %s/\v

"" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

"" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

"" FileType defaults
set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType groovy setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab wrap linebreak nolist
autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType kconfig setlocal list
autocmd FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType help wincmd L

"" Define commands for common typos
command WQ wq
command Wq wq
command W w
command Q q

"" Custom keybinds
let mapleader=","
nmap <Leader>t :tabs<Enter>
nmap <Leader>r :registers<Enter>
nmap <Leader>b :<C-U>exec (v:count ? "b" . v:count : "ls")<Enter>
nmap <Leader>; :bp<Enter>
nmap <Leader>' :bn<Enter>
nmap <Leader>m :marks<Enter>
