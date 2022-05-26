" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Initiate Pathogen
execute pathogen#infect()

" " Pick Gruvbox so my eyes dont bleed on black backgrounds ---------------- {{{
" augroup gruvbox_theme
"   autocmd!
"   autocmd vimenter * ++nested colorscheme gruvbox
" augroup END
" " }}}

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4

" Highlight search or regex matching terms
set hlsearch

" Turn on filetype settings
filetype plugin indent on

" Only set syntax highlighting once
if !exists("g:syntax_on")
  syntax enable
endif

" Set up code folding for Vim configuration files ------------------------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Set title string when editing in an Xterm window ----------------------- {{{

" Each time a new buffer is entered, build up a title string using the user
" name and hostname of the machine that Vim is actually running on (this
" allows users to be aware when editing files remotely via SSH)
augroup window_title
  autocmd!
  autocmd BufEnter * let &titlestring = $USER . "@" . hostname() . " " . expand("%:p")
augroup END

if &term == "xterm-256color" || &term == "xterm"
  set title
endif
" }}}

" Jedi Vim configuration -------------------------------------------------- {{{

" Don't start autocompletion as soon as the dot operator is pressed
let g:jedi#popup_on_dot = 0
" Select the first line of the completion menu
let g_jedi#popup_select_first = 0
" Disable the docstring window from popping up
augroup jedi_disable_doc_win
  autocmd!
  autocmd FileType python setlocal completeopt-=preview
augroup END
" }}}

source $HOME/.vim/statusline.vim
source $HOME/.vim/keys.vim
