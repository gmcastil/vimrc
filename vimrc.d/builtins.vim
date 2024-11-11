" Enable the "%" command to jump to matching HTML tags, if/else/endif Vim
" scripts, XML tags, etc.  Not enabled by default because it isn't backwards
" compatible. Note that Vim needs to be built with syntax highlighting and
" compatibility mode needs to be off
if has('syntax') && !&compatible
    packadd! matchit
else
    call PrintWarn("Could not enable matchit - Vim not compiled with +syntax")
endif

" Enable the :Man command shipped inside Vim's man filetype plugin
if exists(':man') != 2 && !exists('g:loaded_man') && &filetype !=? 'man' && !has('nvim')
    runtime ftplugin/man.vim
endif

