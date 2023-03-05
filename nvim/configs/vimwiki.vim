" Vimwiki settings

let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let wiki_1 = {}
let wiki_1.path = '~/wiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
" ==========================================
" let wiki_2 = {}
" let wiki_2.path = '~/wiki/work-md/'
" let wiki_2.syntax = 'markdown'
" let wiki_2.ext = '.md'
" ==========================================
"let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" let g:vimwiki_list = [{'auto_diary_index': 1}]

" Make the markdown links have .md suffix
let g:vimwiki_markdown_link_ext = 1

"autocmd FileType vimwiki set autochdir

"let g:vimwiki_list = [{'path': '~/wiki', 'syntax': 'markdown', 'ext': '.md'}]
