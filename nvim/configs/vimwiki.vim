" Vim-Wiki Mappings
"let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/personal-md/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
" ==========================================
let wiki_2 = {}
let wiki_2.path = '~/vimwiki/work-md/'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
" ==========================================
let wiki_3 = {}
let wiki_3.path = '~/vimwiki/blog-md/'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'
" ==========================================
let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

