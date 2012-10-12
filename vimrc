set expandtab    " spaces for tabs
set tabstop=4    " tab inserts this many
set softtabstop=4
set shiftwidth=4 " >> inserts this many
set shiftround

set smartindent
set autoindent

" vundle config
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'SuperTab'

filetype plugin indent on
" end vundle

syntax on

set bg=dark

set mouse=a

set wildmenu
set wildmode=longest:full

set showcmd

set hlsearch
set incsearch
set smartcase " ignore case unless some uppercase letters present
