set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-ruby/vim-ruby'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

execute pathogen#infect()


syntax on

colorscheme onedark

set tabstop=4

set softtabstop=4

set expandtab

set number

set showcmd

filetype indent on

set showmatch

set backspace=2

filetype on

set nowrap

set smartindent

set autoindent

set termguicolors
