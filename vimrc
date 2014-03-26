set nocompatible

set expandtab    " spaces for tabs
set tabstop=4    " tab inserts this many
set softtabstop=4
set shiftwidth=4 " >> inserts this many
set shiftround
set smarttab

set smartindent
set autoindent

set hidden

if has("win32")
	set guifont=Source_Code_Pro:h10:cANSI
else
	" vundle config
	filetype off
	set rtp+=~/.vim/bundle/vundle
	call vundle#rc()

	Bundle 'gmarik/vundle'

	"Bundle 'SuperTab'

    Bundle 'sickill/vim-monokai'
    Bundle 'travitch/hasksyn'
    Bundle 'scrooloose/syntastic'
    "Bundle 'Shougo/neocomplcache.vim'
    Bundle 'ujihisa/neco-ghc'

    Bundle 'kien/ctrlp.vim'
    Bundle 'kniren/haskellmode-vim'

	set t_Co=16
    colorscheme monokai
endif

filetype plugin indent on
" end vundle

syntax on

set mouse=a

set wildmenu
set wildmode=longest:full

set showcmd

set hlsearch
set incsearch
set smartcase " ignore case unless some uppercase letters present

set cursorline
set relativenumber " show numbers as relative to current line
set number

let g:haddock_browser="/usr/bin/firefox"
au BufEnter *.hs compiler ghc

let g:neocomplcache_enable_at_startup = 1

let g:syntastic_error_symbol = '►'
let g:syntastic_warning_symbol = '▻'
