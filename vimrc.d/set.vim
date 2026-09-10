" Do not try to emulate old-skool Vi. This must be set before anything else,
" since several plugins (unimpaired included) gate their own loading on
" '&compatible' being off.
set nocompatible

" Enable filetype detection, filetype-specific plugins from .vim/ftplugin,
" and filetype-specific indentation rules from .vim/indent
filetype on
filetype plugin on
filetype indent on

if has('syntax')
    if !exists("g:syntax_on")
        syntax enable
    endif
endif

" Enable project-local configs
set exrc
set secure

" Better indent behavior
set autoindent
set smartindent

" Fix backspace
set backspace=indent,start,eol

" Always start with line numbers turned on and make sure that there is
" sufficient space so that columns don't hop around as the number gets larger
set number
set relativenumber
set numberwidth=4

" Reread the contents of a file if it has changed on disk
set autoread

" Control line wrapping behavior
set wrap
set display=lastline
set scrolloff=10
set sidescroll=1
set sidescrolloff=3

" Enable wild menu
set wildmenu
set wildmode=longest:full,full
" Show command-line completion as a popup menu near the cursor instead of
" the classic horizontal bar above the command line
set wildoptions=pum

" Hide buffers instead
set hidden

" Increase the default Ex command and search history
if has('cmdline_hist')
  set history=10000
endif

" Disable mouse
set mouse=

" Message configuration
set shortmess&
set shortmess+=F
set shortmess+=I
set shortmess+=c

" Turn off list mode by default but still set listchars so we can toggle
" them. This section might be somewhat font dependent too.
set nolist
if $LANG == "en_US.UTF-8"
  set listchars=tab:→·,trail:·,extends:»,precedes:«,nbsp:+,eol:$
  set fillchars+=vert:\▏
endif

" Border style for the insert-mode completion popup. Box-drawing borders
" need a UTF-8 encoding, so fall back to ascii otherwise. This also styles
" the wildmenu popup ('wildoptions=pum' below), which explicitly shares the
" same rendering as the completion popup.
if $LANG == "en_US.UTF-8"
  set pumborder=round
else
  set pumborder=ascii
endif

set nohlsearch
set incsearch

set termguicolors
set signcolumn=yes
set colorcolumn=

" Disable incremental search wraparound
set nowrapscan

" Case insensitive searching, unless the pattern contains upper case
set ignorecase
set smartcase

" Open new windows below and to the right
set splitright
set splitbelow

" Disable system bell
set belloff=esc

set noshowcmd
set cmdheight=1

" How long to wait after typing stops to fire CursorHold
set updatetime=500

" gq and gw both format text - the difference is only where the cursor ends
" up afterward (gq: end of the formatted text, gw: back where it started),
" not which formatter is used. Both defer to 'formatprg' if it's set, so use
" `par` for a much better reflow than Vim's internal formatter when it's
" available, and fall back to the internal formatter otherwise.
if executable('par')
  set formatprg=par
endif

" If a file doesn't have a fold level set yet, then close everything up
if has('folding')
  set foldlevelstart=99
endif

" Insert-mode keyword completion (<C-n>/<C-p>) sources: current buffer,
" other windows, other buffers, unloaded buffers, tags, included files
set complete=.,w,b,u,t,i
" 'menu' shows the popup once there's more than one match; 'preview' opens a
" preview window for extra info (signatures, docs) when a source provides it
set completeopt=menu,preview

" Tell Vim to store all of _our_ swap files in our own home directory if
" possible, and then all the other. One condition that this creates might be
" that files being edited by different users will be unaware of each other
" which isn't a condition I am particularly concerned about and am willing to
" live with to keep .swp files from littering the filesystem
set directory=~/.vim/tmp//,.,~/tmp,/var/tmp,/tmp
