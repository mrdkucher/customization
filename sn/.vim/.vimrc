set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Syntastic'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'preservim/nerdtree'
" Plugin 'scrooloose/nerdtree-project-plugin'
Plugin 'junegunn/fzf'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Format options"
syntax enable
set expandtab
set tabstop=4
set shiftwidth=4
set number

"viminfo location"
set viminfo+=n$HOME/.vim/.viminfo
