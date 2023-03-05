" Key maps

"""""""""""""""""""
" Normal Mode
"""""""""""""""""""
" General 
nnoremap <leader>w :w<cr>                              " Enable quick save
nnoremap <leader>fs z=                                  " Fix spelling errors
nnoremap <leader>s :set spell!<cr>                      " Toggle spell check

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Re-size with arrows
nnoremap <C-Up> :resize -2<cr>
nnoremap <C-Down> :resize +2<cr>
nnoremap <C-Left> :verticle resize -2<cr>
nnoremap <C-Right> :verticle resize -2<cr>

" Navigate buffers
nnoremap <S-l> :bnext<cr>
nnoremap <S-h> :bprevious<cr>

" Telescope (vim)
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope live_grep search_dirs=~/wiki<cr>

" Telescope (lua)
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>fw <cmd>lua require('telescope.builtin').live_grep({search_dirs = {'~/wiki'}}}<cr>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>

" GitGutter
nnoremap ghp <Plug>(GitGutterPreviewHunk)
