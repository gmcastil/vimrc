" Configuration ------------------------------------------------------------ {{{

" Edit Vim configuration files in new buffers
noremap <silent> <leader>ev :tabnew $MYVIMRC<cr>
noremap <silent> <leader>sv :source $MYVIMRC<cr>
noremap <silent> <leader>dv :tabnew $HOME/.vim/doc/cheats.md<cr>
noremap <silent> <leader>kv :tabnew $HOME/.vim/vimrc.d/keybinds.vim<cr>
" }}}

" File Operations  --------------------------------------------------------- {{{

" Use '%%' instead of '%:h<Tab>' in command mode to insert the path to the
" directory of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" }}}

" Navigation --------------------------------------------------------------- {{{

" Navigate splits using more natural keys
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-k> :wincmd k<cr>
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-l> :wincmd l<cr>

" Close windows with less typing...use a leader here because its easier to hit
" and I do it a lot more anyway
nmap <silent> <leader>c :wincmd c<cr>

" Get rid of arrow keys in insert, normal and visual mode
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>

noremap  <up>    <nop>
noremap  <down>  <nop>
noremap  <left>  <nop>
noremap  <right> <nop>

vnoremap <up>    <nop>
vnoremap <down>  <nop>
vnoremap <left>  <nop>
vnoremap <right> <nop>

" Mouse wheel scrolling is not something I appreciate
:nmap <ScrollWheelUp>         <nop>
:nmap <S-ScrollWheelUp>       <nop>
:nmap <C-ScrollWheelUp>       <nop>
:nmap <ScrollWheelDown>       <nop>
:nmap <S-ScrollWheelDown>     <nop>
:nmap <C-ScrollWheelDown>     <nop>
:nmap <ScrollWheelLeft>       <nop>
:nmap <S-ScrollWheelLeft>     <nop>
:nmap <C-ScrollWheelLeft>     <nop>
:nmap <ScrollWheelRight>      <nop>
:nmap <S-ScrollWheelRight>    <nop>
:nmap <C-ScrollWheelRight>    <nop>

" Navigate to the previous buffer and delete the current one (not entirely what I
" really want right now, but it's better than nothing).
nnoremap <silent> <leader>bk :bp\|bd#<cr>
nnoremap <silent> <leader><leader> :b#<cr>
" }}}

" Search and replace ----------------------------------------------------- {{{
"
" Stop highlighting for the 'hlsearch' option. Doing it this way
" will clear all of the highlights of the previous search without having to do
" silly things like /asdf which trashes the result of the previous search, which
" might get reused
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Repeats the last search but unfolds the code enough to make the cursor
" visible, and then centers the search result in the buffer
nnoremap n nzvzz
nnoremap N Nzvzz
" }}}

" Functions --------------------------------------------------------------- {{{

" Cycle through relative and normal line numbering combinations
if exists('+relativenumber')
    nnoremap <silent> <leader>r :call utils#cycle_numbering()<cr>
endif

augroup HDLKeybinds
    autocmd!
    " For Verilog or SystemVerilog files
    autocmd FileType verilog nnoremap <buffer> <leader>sp :call utils#swap_hdl_port()<cr>
    autocmd FileType systemverilog nnoremap <buffer> <leader>sp :call utils#swap_hdl_port()<cr>
    " For VHDL files
    autocmd FileType vhdl nnoremap <buffer> <leader>sp :call utils#swap_hdl_port()<cr>
augroup END
"
nnoremap <silent> <leader>sp :call utils#swap_hdl_port()<cr>

" Strip trailing whitespace from the buffer but preserve the history and search
nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<cr>
" Strip trailing whitespace from visually selected lines
xnoremap <silent> <F5> :call Preserve("'<,'>s/\\s\\+$//e")<cr>
" }}}

" Plugin Maps -------------------------------------------------------------- {{{
if exists("NERDTree")
    nnoremap <leader>n :NERDTreeFocus<cr>
    nnoremap <C-n> :NERDTreeToggle<cr>
endif
" }}}

" Leader Mappings ---------------------------------------------------------- {{{

" Run :make silently in the background and then redraw the screen afterwards.
" There are autocmds that should handle opening the QuickFix window based on the
" result
nnoremap <silent> <leader>m :silent! make \| silent redraw!<cr>
" Using operator-pending mode, allow quick marking of VHDL signals for debug
nnoremap <silent> <leader>d :set operatorfunc=utils#mark_debug_operatorfunc<cr>g@
xnoremap <silent> <leader>d :call utils#mark_debug()<cr>

" Moves to the next item in the arglist and then deletes the previous one
nnoremap <silent> <leader>ad :argdelete % \| next<cr>

" }}}

" List mappings --- {{{

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<cr>
" Bring up the jump list
nnoremap <silent> "j :jumps<cr>
" Bring up the change list
nnoremap <silent> "c :changes<cr>
" }}}

