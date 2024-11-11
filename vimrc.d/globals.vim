function! PrintWarn(msg)
    echohl WarningMsg
    echom "Warning: " . a:msg
    echohl None
endfunction

function! PrintError(msg)
    echohl ErrorMsg
    echom "Error: " . a:msg
    echohl None
endfunction

" Run a command while preserving the search history and cursor position
function! Preserve(command)
    " Save the window state
    let l:saved_winview = winsaveview()
    execute a:command
    " Restore the window state
    call winrestview(l:saved_winview)
endfunction
