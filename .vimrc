set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My bundles here:
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'Matt-Deacalion/vim-systemd-syntax'
Plugin 'elzr/vim-json'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Plugin 'hashivim/vim-terraform'
Plugin 'Glench/Vim-Jinja2-Syntax'
""""""""""""""""""""""""""""""
call vundle#end()

filetype plugin indent on     " required!
set omnifunc=syntaxcomplete#Complete

let g:delimitMate_expand_cr = 1

" autocomplete
let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0

" Map z and r to reset folding
let g:vim_json_syntax_conceal = 0
""""""""""""""""""""""""""""""

" syntax check
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '-'

""""""""""""""""""""""""""""""
" change the mapleader from \ to ,
let mapleader="ç"

" Quickly edit/reload the vimrc file
" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Keep buffers when editing another file
set hidden

set expandtab     " Always use spaces instead of using tab
set nowrap        " don't wrap lines
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
"set ignorecase    " ignore case when searching
"set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set colorcolumn=81       " Print a line in column 81
highlight ColorColumn ctermfg=7 ctermbg=blue

" Do not write backup files when editing a file
set nobackup
"set noswapfile

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Set specific settings depending on filetype this way
if has('autocmd')
  autocmd filetype html,xml set listchars-=tab:>.
  autocmd FileType go set nolist
  autocmd FileType make set nolist
  autocmd FileType go setlocal ts=2 sw=2
  autocmd filetype python set expandtab tabstop=4 shiftwidth=4
  autocmd filetype puppet set expandtab tabstop=2 shiftwidth=2
  autocmd FileType json map zr :syn sync fromstart<CR>
  "autocmd FileType json set foldmethod=syntax
  "autocmd FileType json set foldlevel=100
endif

" Toggle paste mode on/off with <leader>p
set pastetoggle=<leader>p

" Toggle number on/off using <C-n>
"nmap <C-n> :set number!<CR>

" Save a file you need sudo without retyping it using w!!
cmap w!! w !sudo tee % >/dev/null

" Toggle NerdTree
map <C-d> :NERDTreeToggle<CR>

" Tab configure
nmap <C-j> :tabprevious<CR>
nmap <C-k> :tabnext<CR>
nmap <C-t> :tabnew<CR>

" Split window
nmap <C-l> :vs<CR>
nmap <C-h> :sp<CR>
nmap <C-c> <C-w><C-w><C-w>q

let python_space_errors         = 1
let python_highlight_all        = 1

" terraform
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command ="goimports"
let g:go_def_mapping_enabled = 0
nmap <C-r> :GoDefStack 1<CR>
nmap <C-f> :GoDef<CR>
nmap <C-p> :GoDefPop<CR>
"let g:go_fmt_autosave = 1
"
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_go_checkers =['golint', 'govet', 'errcheck']

"syntax
set background=dark
syntax on
set scrolloff=5

"redraw
nmap <C-b> :redraw!<CR>

"line numbers
set number
highlight LineNr ctermfg=white ctermbg=blue
"wrap lines
set wrap
set textwidth=79
set formatoptions=qrn1
"movement for wrap lines
map <Up> gk
map <Down> gj
map k gk
map j gj
