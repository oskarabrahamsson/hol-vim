augroup HOL4FtDetect
  autocmd!
  autocmd BufRead,BufNewFile *Script.sml setlocal filetype=hol4script
  " TODO HOL4 libs are not supposed to contain term quotations
  " (although they can), so maybe these two should be optional:
  " autocmd BufRead,BufNewFile *Lib.sml setlocal filetype=hol4lib
  " autocmd BufRead,BufNewFile *Lib.sig setlocal filetype=hol4lib
augroup END

