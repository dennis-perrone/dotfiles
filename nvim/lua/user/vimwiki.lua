-- VimWiki Configuration

vim.g.vimwiki_list = {{path = '~/wiki/', syntax = 'markdown', ext = '.md'}}    -- Define vimwiki list
vim.g.vimwiki_markdown_link_ext = 1                                            -- Ensure all new links have .md extension

vim.wiki_1 = {}
vim.wiki_1.path = '~/wiki/'
vim.wiki_1.syntax = 'markdown'
vim.wiki_1.ext = '.md'

-- Configure folding
vim.g.vimwiki_fold_blank_lines = 0
vim.g.vimwiki_header_type = '#'
vim.g.vimwiki_folding = 'expr'
vim.opt.foldlevel = 3
