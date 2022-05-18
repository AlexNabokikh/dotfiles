" Vundle config

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'airblade/vim-gitgutter'
Plugin 'davidhalter/jedi-vim'
Plugin 'dense-analysis/ale'
Plugin 'hashivim/vim-terraform'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tomasiser/vim-code-dark'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-python/python-syntax'
Plugin 'yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ALE
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'python': ['black'],
    \   'terraform': ['terraform'],
    \   'yaml': ['yamlfix'],
    \   'yml': ['yamlfix'],
    \   'sh': ['shfmt'],
    \}
let g:ale_linters = {
    \   'python': ['flake8'],
    \   'yaml': ['yamllint'],
    \   'yml': ['yamllint'],
    \   'tf': ['terraform'],
    \   'sh': ['shellcheck'],
    \}
let g:ale_python_flake8_options = '--max-line-length=150'
let b:ale_fix_on_save = 0
map <F12> :ALEFix<CR>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" Python config
let g:python_highlight_all = 1

" Terraform config
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" NERDTree config
map <F5> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" GitGutter config
let g:gitgutterenable = 1
map <F6> :GitGutterLineHighlightsToggle<CR>

" Fzf config
map <F7> :Files<CR>
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

" Indent line
let g:indentLine_char = '|'

" Toggle Paste
function! TogglePaste()
    if(&paste == 0)
        set paste
        echo "Paste Mode Enabled"
    else
        set nopaste
        echo "Paste Mode Disabled"
    endif
endfunction

map <leader>p :call TogglePaste()<cr>


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
set mouse=a             " enable mouse scroll wheel
set guioptions=aAace    " don't show scrollbar in MacVim

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard
