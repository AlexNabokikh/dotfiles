" Vundle config

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'nvie/vim-flake8'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tomasiser/vim-code-dark'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'voldikss/vim-floaterm'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" Python config
let python_highlight_all = 1

" Terraform config
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" NERDTree config
map <F5> :NERDTreeToggle<CR>

" Fzf config
map <F7> :Files<CR>
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" GitGutter config
let g:gitgutterenable = 1
map <F6> :GitGutterLineHighlightsToggle<CR>

" Floaterm config
let g:floaterm_keymap_toggle = '<F12>'

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
