-- functions

-- Finds all incomplete tasks within the current page.
vim.cmd([[
  function! VimwikiFindIncompleteTasks()
    lvimgrep /- \[ \]/ %:p
    lopen
  endfunction
]])

-- Finds all incomplete tasks within the entire wiki
vim.cmd([[
  function! VimwikiFindAllIncompleteTasks()
    VimwikiSearch /- \[ \]/
    lopen
  endfunction
]])
