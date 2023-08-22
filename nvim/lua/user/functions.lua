vim.cmd([[
  function! VimwikiFindIncompleteTasks()
    lvimgrep /- \[ \]/ %:p
    lopen
  endfunction
]])

vim.cmd([[
  function! VimwikiFindAllIncompleteTasks()
    VimwikiSearch /- \[ \]/
    lopen
  endfunction
]])
