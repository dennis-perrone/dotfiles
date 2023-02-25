set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nu

" Configure swap files and backup directory
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect

" Define column and vertical bar
set colorcolumn=80
set signcolumn=yes

" Toggle paste mode (to preserve source formatting)
set pastetoggle=<F2>

" Configure file type actions
filetype on
filetype plugin on
filetype indent on

" Enable spell check
set spell spelllang=en_us
