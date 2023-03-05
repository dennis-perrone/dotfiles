" General Settings

set tabstop=4                                              " insert 2 spaces for a tab.
set softtabstop=4                                          " insert 2 spaces for a soft tab
set shiftwidth=4                                           " set the number of spaces inserted for each indentation.
set expandtab                                              " convert tabs to spaces
set smartindent                                            " make smart indent decisions
set exrc                                                   " 
set guicursor=                                             " 
set number                                                 " enable line numbers
set relativenumber                                         " set relative line number
set nohlsearch                                             " 
set hidden                                                 " 
set noerrorbells                                           " 
set noswapfile                                             " disable swap file
set nobackup                                               " disable creation of backup file.
set undodir=~/.config/nvim/undodir                         " define undo directory
set undofile                                               " enable persistent undo
set updatetime=300                                         " enable quicker update
set incsearch                                              " 
set termguicolors                                          " set the terminal gui colors
set scrolloff=8                                            " minimum number of line above and below the cursor
set noshowmode                                             " hides modes (normal, insert, etc.)
set completeopt=menuone,noinsert,noselect
set cursorline                                             " enable cursor line
set colorcolumn=80                                         " set vertical bar
set signcolumn=yes                                         " set sign column (left side)
set spell spelllang=en_us                                  " enable spellcheck
" Toggle paste mode (to preserve source formatting)
set pastetoggle=<F2>

" Configure file type actions
filetype on
filetype plugin on
filetype indent on
