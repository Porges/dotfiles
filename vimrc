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

" vundle config
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'SuperTab'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on
" end vundle

syntax on

set bg=dark
"let g:solarized_termcolors=256
set t_Co=16
colorscheme solarized

set mouse=a

set wildmenu
set wildmode=longest:full

set showcmd

set hlsearch
set incsearch
set smartcase " ignore case unless some uppercase letters present

set relativenumber " show numbers as relative to current line
set number
