" Begin ~/.vim/vimrc
scriptencoding utf-8

function! s:InitWarning (msg)
  echom a:msg
endfunction

" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Better indent behavior
set autoindent
set smartindent

" Fix backspace (this gets touched by defaults.vim but that isn't always
" present)
set backspace=indent,start,eol

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set relativenumber
set numberwidth=4
set history=1000

" Reread the contents of a file if it has changed on disk
set autoread

" If a file doesn't have a fold level set yet, then close it all up
if has('folding')
  set foldlevelstart=0
endif

" Control line wrapping behavior (text width is set on a file type basis
" elsewhere)
set wrap
" In particular, attempt to show as much as possible of the last line in the
" window
set display+=lastline
" Letting the cursor get to the top or bottom of the window before loading more
" text is really annoying.  Resist the temptation to make this too large if you
" use a lot of horizontal splits.
set scrolloff=10
set sidescroll=1
set sidescrolloff=3
" Better command line completion
set wildmenu

" Hide buffers instead
set hidden

" Message configurations -------------------------------------------------- {{{
"
" There are oodles of message configurations, so start by resetting to the Vim
" default (Vi and Vim are different)
set shortmess&
" Don't give file info when editing a file (or switching from one buffer to
" another)
set shortmess+=F
" Ignore Vim intro
set shortmess+=I
" }}}

" Tell Vim to store all of _our_ swap files in our own home directory if
" possible, and then all the other. One condition that this creates might be
" that files being edited by different users will be unaware of each other which
" isn't a condition I am particularly concerned about and am willing to live
" with to keep .swp files from littering the filesystem
set directory=~/.vim/tmp//,.,~/tmp,/var/tmp,/tmp

" -- Locale specific settings "  ----------------------------------------- {{{
"
" This section might be somewhat font dependant too
if $LANG == "en_US.UTF-8"
  " Set characters to be used in 'list' mode
  set listchars=tab:→·,trail:·,extends:»,precedes:«,nbsp:+,eol:$
  " Also, to make the divider look smoother when working with multiple windows,
  " use this
  set fillchars+=vert:\▏
endif
" }}}

" Turn off list mode by default
set nolist

" Window management ------------------------------------------------------ {{{
"
" Open new windows below and to the right of the existing ones
set splitright
set splitbelow
" }}}

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

" Colorscheme ------------------------------------------------------------ {{{
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
" }}}

" Highlight the line in the active buffer -------------------------------- {{{
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" }}}

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
" compatible. Note that Vim needs to be built with syntax highlighting and
" compatiility mode needs to be of
if has('syntax') && !&compatible
  packadd! matchit
else
  call s:InitWarning("Could not enable matchit - Vim not compiled with +syntax")
endif

" Enable the :man command shipped inside Vim's man filetype plugin
if exists(':man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
  runtime ftplugin/man.vim
endif
" }}}

" Path configuration ----------------------------------------------------- {{{
set path=
set path+=./
set path+=/usr/include/**
" }}}

" External confguration -------------------------------------------------- {{{
"
" Set the statusline to something more useful (no plugins)
if filereadable(expand("$HOME/.vim/statusline.vim"))
  source $HOME/.vim/statusline.vim
else
  call s:InitWarning("No status line configuration found")
endif

" Set custom keybindings
if filereadable(expand("$HOME/.vim/keys.vim"))
  source $HOME/.vim/keys.vim
else
  call s:InitWarning("No user keybindings set.")
endif

" Add support for joining comments and deleting the comment leader
if v:version > 703 || v:version == 703 && has ('patch541')
  set formatoptions+=j
endif

" Settings for Cscope interface
if has("cscope")
  if filereadable(expand("$HOME/.vim/cscope_maps.vim"))
    source $HOME/.vim/cscope_maps.vim
  else
    call s:InitWarning("No Cscope settings found")
  endif
else
  call s:InitWarning("No Cscope support found. Try `vim --version | grep cscope`")
endif
" }}}

