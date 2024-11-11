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

