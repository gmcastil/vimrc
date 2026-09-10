" Recipe lines are required to start with a literal tab character - Make
" errors out ("missing separator") if that tab gets expanded into spaces.
" Set this explicitly rather than relying on the global default, since a
" global 'expandtab' would silently break every Makefile in the tree.
setlocal noexpandtab
setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=0
