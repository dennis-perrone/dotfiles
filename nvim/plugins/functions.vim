" Trim whitespace at end of file.

fun! TrimWhitespace()
    let l:save = winsaveview()
    "keeppatterns %s/\s\+$//e
    keeppatterns %s#\($\n\s*\)\+\%$##
    call winrestview(l:save)
endfun

augroup clean_whitespace
    autocmd!
    autocmd BufWritePre * silent! :call TrimWhitespace()
augroup END
