" Vim-Plug config
call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'hashivim/vim-terraform'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
" Plug 'mg979/vim-visual-multi'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-python/python-syntax'
Plug 'yggdroot/indentLine'

call plug#end()

" Remap Leader-Key
nmap <Space> <Leader>

" ALE
let g:ale_fixers = {
    \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
    \ 'css':        ['prettier'],
    \ 'dockerfile': ['hadolint'],
    \ 'go':         ['goimports'],
    \ 'html':       ['prettier'],
    \ 'javascript': ['prettier'],
    \ 'json':       ['prettier'],
    \ 'markdown':   ['prettier'],
    \ 'python':     ['black', 'isort'],
    \ 'sh':         ['shfmt'],
    \ 'terraform':  ['terraform'],
    \ 'yaml':       ['prettier'],
    \ 'yml':        ['prettier'],
    \}
let g:ale_linters = {
    \ 'dockerfile': ['hadolint'],
    \ 'go':         ['golangci-lint'],
    \ 'markdown':   ['markdownlint'],
    \ 'python':     ['flake8', 'pyright'],
    \ 'sh':         ['shellcheck'],
    \ 'tf':         ['terraform', 'tflint'],
    \ 'yaml':       ['yamllint'],
    \ 'yml':        ['yamllint'],
    \}
let g:ale_javascript_prettier_options = '--no-bracket-spacing'
let b:ale_fix_on_save = 0

map <F12> :ALEFix<CR>

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" Python config
let g:ale_python_flake8_options = '--max-line-length=150'
let g:python_highlight_all = 1

" Terraform config
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" YAML config
let g:ale_yaml_yamllint_options = '-d "{rules: {document-start: {present: false}, line-length: {max: 150}}}"'

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
let g:vim_json_conceal=0
let g:markdown_syntax_conceal=0

" Enable rainbow brackets
let g:rainbow_active = 1

" Vim visual multi
" let g:VM_maps = {}
" let g:VM_maps["Add Cursor Down"] = '<C-j>'
" let g:VM_maps["Add Cursor Up"] = '<C-k>'
" let g:VM_maps["Select l"] = '<C-l>'
" let g:VM_maps["Select h"] = '<C-h>'

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
set autoindent smartindent      " auto/smart indent
set autoread                    " watch for file changes
set backspace=indent,eol,start  " more powerful backspacing
set cursorcolumn                " highlight the current column
set cursorline                  " highlight the current line
set nobackup                    " don't create pointless backup files; Use VCS instead
set noswapfile                  " don't create swap files
set number relativenumber       " show line numbers
set scrolloff=5                 " show at least 5 lines above/below
set showcmd                     " show selection metadata
set showmatch                   " show matching brackets
set showmode                    " show INSERT, VISUAL, etc. mode
set smarttab                    " better backspace and tab functionality
filetype indent on              " enable filetype-specific indenting
filetype on                     " enable filetype detection
filetype plugin on              " enable filetype-specific plugins

" tabs and indenting
set autoindent          " auto indenting
set expandtab           " spaces instead of tabs
set shiftwidth=2        " 2 spaces for indentation
set smartindent         " smart indenting
set tabstop=2           " 2 spaces for tabs

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell

" search
set hlsearch            " highlighted search results
set ignorecase          " enable case ignore search
set showmatch           " show matching bracket

" other
set guioptions=aAace    " don't show scrollbar in MacVim
set mouse=a             " enable mouse scroll wheel

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard

" Coursor mode Settings
let &t_SI.="\e[5 q"     " SI = INSERT mode
let &t_SR.="\e[4 q"     " SR = REPLACE mode
let &t_EI.="\e[1 q"     " EI = NORMAL mode (ELSE)
set ttimeout            " Slow mode change fix
set ttimeoutlen=1
set ttyfast

" buffers switch
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
