" Load new notes with frontmatter
func! LoadFrontmatter()
  " build frontmatter
  let $Frontmatter = "---\ntitle: " . expand('%:t:r')  . "\ndate: " . strftime("%Y-%m-%d") . "\n keywords: \nreferences: \n---\n"

  " echo frontmatter into file
  0r !echo $Frontmatter
endfunc

autocmd BufNewFile ~/wiki/personal-md/*.md silent! call LoadFrontmatter()
