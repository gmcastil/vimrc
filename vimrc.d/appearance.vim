" Gruvbox configuration options need to be set before loading the colorscheme
let g:gruvbox_italic=1
"let g:gruvbox_contrast_dark='medium'

if &term == 'xterm-256color'
  colorscheme gruvbox
elseif &term == 'screen.xterm-256color'
  colorscheme gruvbox8
  set notermguicolors
else
  colorscheme gruvbox
endif

" Make sure to set the background to dark afterwards, or it will look uh...bad.
set background=dark

