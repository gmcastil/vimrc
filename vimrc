" Top level Vim configuration just sources files in various locations. Note that
" the paths are left hard coded so that we can visit any of these files
" directly.

try
    source $HOME/.vim/vimrc.d/globals.vim
    source $HOME/.vim/vimrc.d/utils.vim
catch
    echohl ErrorMsg
    echom "Error: Could not source global or utility functions. Starting Vim with default configuration."
    echohl None
    " If we can't source global functions, nothing else after this is going to work
    " so we just end our attempt to configure Vim at this point. We still continue, so
    " that a discerning user can fix things, but we don't try to configure it an leave it
    " a mess.
    finish
endtry

" Pretty much all setings for things like search, scrolling, window behavior,
" are in here.
try
    source $HOME/.vim/vimrc.d/basic.vim
catch
    call PrintError('Could not load basic configuration')
endtry

" All locale specific settings are done separately
try
    source $HOME/.vim/vimrc.d/locale.vim
catch
    call PrintError('Could not load locale specific settings.')
endtry

" Handle backup and swap files
try
    source $HOME/.vim/vimrc.d/backup-swap.vim
catch
    call PrintError('Could not load backup and swap file settings.')
endtry

" All autocommands should be in here, with the exception of those that are
" used by the filetype detection functions (e..g, detecting uncommon
" filetypes)
try
    source $HOME/.vim/vimrc.d/autocmds.vim
catch
    call PrintError('Could not load auto commands.')
endtry

" Set colors, themes, fonts, and window appearance
try
    source $HOME/.vim/vimrc.d/appearance.vim
catch
    colorscheme default
    highlight clear
    call PrintError('Could not load colors and themes. Using default colorscheme.')
endtry

" Filetype detection, indent, and filetype-specific plugin behavior.  In
" general, the actual filetype specific configurations should be in
" .vim/ftdetect, .vim/ftplugin or .vim/indent.
try
    source $HOME/.vim/vimrc.d/filetype.vim
catch
    call PrintError('Coudl not load filetype configuration.')
endtry

" Note that the status line uses some of the colors and such that are set up
" by the gruvbox theme, so it needs to be loaded after colors and themes are
" set up.
try
    source $HOME/.vim/vimrc.d/statusline.vim
catch
    set statusline&
    set laststatus&
    highlight clear
    call PrintError('Could not load statusline configuration. Using default statusline.')
endtry

" Set up built in package configuration
try
    source $HOME/.vim/vimrc.d/builtins.vim
catch
    call PrintError('Could not load builtin package configuration.')
endtry

" Set up keybinds
try
    source $HOME/.vim/vimrc.d/keybinds.vim
catch
    call PrintError('Could not load keybinds. Using defaults.')
endtry

