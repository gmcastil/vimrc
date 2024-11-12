" Do not try to emulate old-skool Vi (probably unneeded, but who knows in the
" embedded world)
set nocompatible

" Define the leader key first before we load keybinds, plugins, etc.
let mapleader = ","

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

" Message configuration ---------------------------------------------------- {{{
" There are oodles of message configurations, so start by resetting to the Vim
" default (Vi and Vim are different)
set shortmess&
" Don't give file info when editing a file (or switching from one buffer to
" another)
set shortmess+=F
" Ignore Vim intro
set shortmess+=I
" }}}

" Turn off list mode by default. Note that listchar values may be locale specific
" and defined elsewhere.
set nolist

" Search configuration settings ------------------------------------------ {{{
if has('extra_search')
	set hlsearch
	set incsearch
endif

" Disable incremental searches from wrapping around - dead stop at the end of
" the buffer
set nowrapscan

" Case insensitive searching, unless the search pattern contains upper case
" characters. See `:help smartcase` for more details
set ignorecase
set smartcase
" }}}

" Window management -------------------------------------------------------- {{{
"
" Open new windows below and to the right of the existing ones
set splitright
set splitbelow
" }}}

" Disable system bell (particularly annoying when using the Cygwin console)
set belloff=esc

" Add support for joining comments and deleting the comment leader
if v:version > 703 || v:version == 703 && has ('patch541')
  set formatoptions+=j
endif

