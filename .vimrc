set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable       " enable syntax highlighting.
filetype indent on  " try to properly indent files based on type

set tabstop=2       " display 2 columns (spaces) per tab when displaying existing text.
set softtabstop=2   " display 2 columns (spaces) per tab in insert mode.
set expandtab       " hitting tab in insert mode will produce the appropriate number of spaces instead of \t.
set number          " display line numbers
set showcmd         " show the input of an *incomplete* command
set cursorline      " highlight the line currently under cursor.
set wildmenu        " display command line's tab complete options as a menu.
set lazyredraw      " don't update screen during macro and script execution
set showmatch       " match parens, braces, etc...
set bg=dark         " set background color
set ruler           " see row/column numbers
set clipboard=unnamed
