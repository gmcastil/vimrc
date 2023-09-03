" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4

" Control line wrapping behavior (text width is set on a file type basis
" elsewhere)
set wrap
" In particular, attempt to show as much as possible of the last line in the
" window
set display+=lastline

" Search configuration settings ------------------------------------------ {{{
" Highlight search or regex matching terms
set hlsearch
" Disable incremental searches from wrapping around - dead stop at the end of
" the buffer
set nowrapscan
" Case insensitive searching, unless the search pattern contains upper case
" characters. See `:help smartcase` for more details
set ignorecase
set smartcase
" }}}

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

" Package configuration -------------------------------------------------- {{{

" Only install or enable packages / macros that are included with standard Vim
" for now. I do not want to have to start installing plugins and managers and
" stuff like that all over the place

" Enable the "%" command to jump to matching HTML tags, if/else/endif Vim
" scripts, XML tags, etc.  Not enabled by default because it isn't backwards
" compatible.
packadd! matchit

=======

source $HOME/.vim/statusline.vim
source $HOME/.vim/keys.vim

