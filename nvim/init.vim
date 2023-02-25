" Define plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
" Plug 'lervag/wiki.vim'
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'
call plug#end()

" Set leader key
let mapleader = " "

" Source configurations
runtime! configs/*.vim

" Set color scheme
colorscheme gruvbox

