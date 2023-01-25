" Define plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Set leader
let mapleader = " "

" Source modules
"for f in split(glob('~/.config/nvim/modules/*.vim'), '\n')
"	exe 'source' f
"endfor
"
runtime! configs/*.vim

" Source functions and plugins
runtime! functions/*.vim

" Set colorscheme
colorscheme gruvbox
