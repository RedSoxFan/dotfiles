"" Basic editor stuff
filetype off
syntax on
set backspace=indent,eol,start
set listchars=tab:>-,eol:¬,space:.
set nocompatible
set nofoldenable
set nowrap
set nrformats+=alpha
set number
set shell=bash
set sidescroll=1
set spell spelllang=en_us

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
let g:airline_exclude_preview=1

" Navigation and Editing
Plug 'ludovicchabant/vim-gutentags'
let g:gutentags_project_root = ['tags']
let g:gutentags_add_default_project_roots = 0
Plug 'airblade/vim-rooter'
let g:rooter_silent_chdir = 1
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -bin' }
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~20%' }
nmap ; :GitFiles<Enter>
Plug 'editorconfig/editorconfig-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

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
if empty($DISPLAY)
    " TTY
    let g:airline_theme='cobalt2'
    colorscheme elflord
    set term=xterm
else
    " Terminal Emulator
    let g:airline_theme='powerlineish'
    colorscheme molokai
endif

"" Search customizations
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

"" Backup locations
set backup
set backupdir=~/.vim/backup
set directory=/tmp

"" FileType defaults
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType cfg setlocal nospell
autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab list colorcolumn=80
autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab list colorcolumn=80
autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab wrap linebreak nolist
autocmd FileType java setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType php setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab colorcolumn=80
autocmd FileType scss setlocal tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab
autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal colorcolumn=72

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

nmap <Leader>ss :cd ~/programming/forks/sway<Enter>
nmap <Leader>sw :cd ~/programming/forks/sway/subprojects/wlroots<Enter>
nmap <Leader>sb :cd ~/programming/forks/swaybg<Enter>
nmap <Leader>si :cd ~/programming/forks/swayidle<Enter>
nmap <Leader>sl :cd ~/programming/forks/swaylock<Enter>

"" Fix Home and End
imap <ESC>[1~ <Home>
imap <ESC>[4~ <End>
imap <ESC>[7~ <Home>
imap <ESC>[8~ <End>
imap <ESC>OH <Home>
imap <ESC>OF <End>
