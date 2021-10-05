" Vundle config

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'tomasiser/vim-code-dark'
Plugin 'nvie/vim-flake8'
Bundle 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General vim config
colorscheme codedark            " requires Vundle
syntax on                       " enable syntax highlighting
set backspace=indent,eol,start  " more powerful backspacing
set cursorline                  " highlight the current line
set cursorcolumn                " highlight the current column
set nobackup                    " don't create pointless backup files; Use VCS instead
set autoread                    " watch for file changes
set number                      " show line numbers
set showcmd                     " show selection metadata
set showmode                    " show INSERT, VISUAL, etc. mode
set showmatch                   " show matching brackets
set autoindent smartindent      " auto/smart indent
set smarttab                    " better backspace and tab functionality
set scrolloff=5                 " show at least 5 lines above/below
filetype on                     " enable filetype detection
filetype indent on              " enable filetype-specific indenting
filetype plugin on              " enable filetype-specific plugins

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results
set showmatch           " show matching bracket

" other
set guioptions=aAace    " don't show scrollbar in MacVim

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard
