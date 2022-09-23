" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4

" Control line wrapping behavior
set wrap
" In particular, attempt to show as much as possible of the last line in the
" window
set display+=lastline

" Highlight search or regex matching terms
set hlsearch

" Disable system bell (particularly annoying when using the Cygwin console)
set belloff=esc

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
"
" Set to 1 to start autocomplete as soon as the . dot operator is pressed
" or to 0 to let the user to start typing before jumping in with a menu of
" choices (good for large libraries lik `os` which will ambush the console with
" an autocomplete menu once you type `os.`
let g:jedi#popup_on_dot = 0
" Select the first line of the completion menu
let g:jedi#popup_select_first = 0
" Turn off / on showing calling signatures
let g:jedi#show_call_signatures = 2
" Disable the docstring window from popping up
augroup jedi_disable_doc_win
  autocmd!
  autocmd FileType python setlocal completeopt-=preview
augroup END
" }}}

source $HOME/.vim/statusline.vim
source $HOME/.vim/keys.vim
