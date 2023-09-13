" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set numberwidth=4
set history=1000

" Reread the contents of a file if it has changed on disk
set autoread

" Control line wrapping behavior (text width is set on a file type basis
" elsewhere)
set wrap
" In particular, attempt to show as much as possible of the last line in the
" window
set display+=lastline
" Letting the cursor get to the top or bottom of the window before loading more
" text is really annoying.  Resist the temptation to make this too large if you
" use a lot of horizontal splits.
set scrolloff=3
set sidescroll=1
set sidescrolloff=3
" Better command line completion
set wildmenu
" Let Vim handle mouse behavior instead of the terminal - there are probably
" instances where this will not work, but for now we'll use this
set mouse=a

" Hide buffers instead
set hidden

" TODO These all assume UTF-8 encoding, so we should add a check here for that
" and if not, default back to something even simpler
set listchars=tab:→·,trail:·,extends:»,precedes:«,nbsp:+,eol:$
" Turn off list mode by default
set nolist

" Search configuration settings ------------------------------------------ {{{
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

" Enable the :man command shipped inside Vim's man filetype plugin
if exists(':man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif
" }}}

source $HOME/.vim/statusline.vim
source $HOME/.vim/keys.vim

