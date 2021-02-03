" vim-hol entrypoint
" Maintainer: N/A
" Created: N/A
" License: N/A

if !exists('$HOLDIR')
  echoerr "$HOLDIR not set"
  finish
else
  let g:holdir = $HOLDIR
endif

