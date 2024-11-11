function! utils#cycle_numbering() abort
    if exists('+relativenumber')

        let state = &number . &relativenumber
        echom "Current state: " . state
    
        if state ==# '00'
            set number
            set norelativenumber
        elseif state ==# '10'
            set nonumber
            set relativenumber
        elseif state ==# '01'
            set number
            set relativenumber
        elseif state ==# '11'
            set nonumber
            set norelativenumber
        endif
    else
        " No 'relativenumber' support, so just toggle line numbers
        set number!
    endif
endfunction

