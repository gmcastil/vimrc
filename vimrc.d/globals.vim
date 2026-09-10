function! PrintError(msg)
    echohl ErrorMsg
    echom "Error: " . a:msg
    echohl None
endfunction

function! PrintWarn(msg)
    echohl WarningMsg
    echom "Warning: " . a:msg
    echohl None
endfunction

" Source a config module if it exists. A missing file is treated as an
" optional module and skipped silently; an error while sourcing a file that
" *is* present is a real bug, so it is reported with the actual exception
" text rather than a generic message.
function! SafeSource(path, label) abort
    let l:path = expand(a:path)
    if !filereadable(l:path)
        return
    endif
    try
        execute 'source' fnameescape(l:path)
    catch
        call PrintError(a:label . ': ' . v:exception)
    endtry
endfunction
