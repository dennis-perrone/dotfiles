-- Vimwiki Configuration

-- Define vimwiki list
vim.g.vimwiki_list = {
  {
    path = '~/wiki/public',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/wiki/private',
    syntax= 'markdown',
    ext = '.md',
  }
}

-- Ensure all new links have .md extension
vim.g.vimwiki_markdown_link_ext = 1

vim.wiki_1 = {}
vim.wiki_1.path = '~/wiki/public'
vim.wiki_1.syntax = 'markdown'
vim.wiki_1.ext = '.md'

vim.wiki_2 = {}
vim.wiki_2.path = '~/wiki/private'
vim.wiki_2.syntax = 'markdown'
vim.wiki_2.ext = '.md'

-- Configure folding
vim.g.vimwiki_fold_blank_lines = 0
vim.g.vimwiki_header_type = '#'
vim.g.vimwiki_folding = 'expr'
vim.opt.foldlevel = 3
