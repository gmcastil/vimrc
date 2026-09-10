" Top level Vim configuration. Paths are left hard coded (rather than built
" from <sfile>) so that any of these files can be sourced directly on their
" own while editing them.

" Leader must be set before anything below defines a <leader> mapping.
nnoremap <space> <Nop>
let mapleader = "\<space>"

" globals.vim defines SafeSource and PrintError, which every other module
" load below depends on. If this fails, nothing else can, so it gets a bare
" try/catch with an inline message instead of calling PrintError.
try
    source $HOME/.vim/vimrc.d/globals.vim
catch
    echohl ErrorMsg
    echom "Error: Could not source global functions. Starting Vim with default configuration."
    echohl None
    finish
endtry

call SafeSource('$HOME/.vim/vimrc.d/set.vim', 'settings')
call SafeSource('$HOME/.vim/vimrc.d/remaps.vim', 'remaps')
call SafeSource('$HOME/.vim/vimrc.d/autocmds.vim', 'autocommands')
call SafeSource('$HOME/.vim/vimrc.d/builtins.vim', 'builtin package configuration')
call SafeSource('$HOME/.vim/vimrc.d/spelling.vim', 'spelling')
call SafeSource('$HOME/.vim/vimrc.d/lint.vim', 'linting')
call SafeSource('$HOME/.vim/vimrc.d/appearance.vim', 'colors and appearance')
call SafeSource('$HOME/.vim/vimrc.d/statusline.vim', 'status line configuration')
