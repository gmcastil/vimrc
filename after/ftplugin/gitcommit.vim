" Wrap the commit body at the conventional 72 columns; the subject line
" (first line) is left alone since 'textwidth' only affects wrapping, not
" a hard limit, and Git's own gitcommit syntax already flags an overlong
" subject.
setlocal textwidth=72
