let mapleader=","
set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler
set swapfile
set dir=/tmp/
set undolevels=1000
set backspace=indent,eol,start

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'martinda/Jenkinsfile-vim-syntax'
call plug#end()
autocmd FileType javascript set formatprg=prettier\ --stdin
syntax on
"colorscheme onedark
filetype on
filetype plugin indent on
".vimrc
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Tabs
map <C-t><C-up> :tabr<cr>
map <C-t><C-down> :tabl<cr>
map <C-t><C-left> :tabp<cr>
map <C-t><C-right> :tabn<cr>

" Map Ctrl+P to Gfiles
nnoremap <C-p> :GFiles<Cr>
"Split
"map <C-h> :


filetype plugin on
set omnifunc=syntaxcomplete#complete

