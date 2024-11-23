function! utils#cycle_numbering() abort
    if exists('+relativenumber')

        let state = &number . &relativenumber
    
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

" Swap VHDL and Verilog module port directions
function! utils#swap_hdl_port() abort

    " Get the filetype of the current buffer
    let l:filetype = &filetype

    let l:save_cursor = getpos('.')
    normal! viwy
    " Get the word under the cursor
    let l:word = getreg('"')

    " Swap output for input in Verilog files
    if l:filetype == 'verilog' || l:filetype == 'systemverilog'
        if l:word ==# 'output'
            execute "normal! ciwinput"
        elseif l:word ==# 'input'
            execute "normal! ciwoutput"
        endif
    " Swap in for out in VHDL files
    elseif l:filetype == 'vhdl'
        if l:word ==# 'in'
            execute "normal! ciwout"
        elseif l:word ==# 'out'
            execute "normal! ciwin"
        endif
    endif
    call setpos('.', l:save_cursor)

endfunction
