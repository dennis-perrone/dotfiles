" Key bindings

" General bindings: Normal mode
nnoremap <leader>w :w                            " Enable quick save
nnoremap <leader>fs z=                           " Fix spelling errors
nnoremap <leader>s :set spell<cr>                " Toggle spell check

" General bindings: Insert mode

" General bindings: Visual mode

" Plugin bindings: Vim GitGutter
nnoremap ghp <Plug>(GitGutterPreviewHunk)

" Plugin bindings: NerdTree
nmap <leader>n :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>

" Plugin bindings: Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope live_grep search_dirs=~/wiki<cr>

" Plugin bindings: Telescope (Lua)
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
