" Configuration ------------------------------------------------------------ {{{

" Edit this vimrc: open a new tab, set its tab-local cwd to the config root,
" then open the vimrc itself
nnoremap <silent> <leader>ev :tabnew<bar>tcd $HOME/.vim<bar>edit $MYVIMRC<cr>
" Edit these remaps directly
nnoremap <silent> <leader>kv :tabnew $HOME/.vim/vimrc.d/remaps.vim<cr>
" Reload the config
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" }}}

" File Operations ------------------------------------------------------------ {{{

" Use '%%' instead of '%:p:h<Tab>' in command mode to insert the full path to
" the directory of the current buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h') . '/' : '%%'

" Make the current buffer executable on disk
nnoremap <leader>X :!chmod ug+x %<cr><cr>

" }}}

" Navigation ------------------------------------------------------------ {{{

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize windows
nnoremap <C-Up> :resize +2<cr>
nnoremap <C-Down> :resize -2<cr>
nnoremap <C-Left> :vertical resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>

" Close the current window
nnoremap <silent> <leader>c :wincmd c<cr>
" Alternate file
nnoremap <silent> <leader><leader> <C-^>
" New tab
nnoremap <silent> <leader>tn :tabnew<cr>
" Open netrw
nnoremap <silent> <leader>pv :Ex<cr>

" Scroll up and down half a screen, but keep the cursor in the middle
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Toggle the QuickFix window open or closed
function! s:QuickfixToggle() abort
    for l:win in getwininfo()
        if l:win.quickfix
            cclose
            return
        endif
    endfor
    copen
    wincmd p
endfunction
nnoremap <silent> <leader>q :call <SID>QuickfixToggle()<cr>

" }}}

" Search and replace ------------------------------------------------------ {{{

" Stop highlighting for the 'hlsearch' option. Doing it this way will clear
" all of the highlights of the previous search without having to do silly
" things like /asdf which trashes the result of the previous search
nnoremap <silent> <Esc> :nohlsearch<cr>

" The default behavior of `&` doesn't preserve flags, which is somewhat
" unintuitive so remap it to `&&`. This basically remaps & to 'repeat
" previous search command exactly'.
nnoremap <silent> & :&&<cr>

" Repeats the last search but unfolds the code enough to make the cursor
" visible, and then centers the search result in the buffer
nnoremap n nzvzz
nnoremap N Nzvzz

" }}}

" Completion ------------------------------------------------------------ {{{

" Trigger keyword completion. Most terminals can't actually send a distinct
" Ctrl-Space - it arrives as a literal NUL byte instead, which Vim sees as
" <Nul>, not <C-Space>. <C-n> is overloaded by Vim to both start completion
" and advance to the next match, so this covers both. <C-p>/<C-n> and
" <C-y>/<Space> to navigate and accept a match are already native - nothing
" to map for those.
inoremap <Nul> <C-n>

" }}}

" Editing ------------------------------------------------------------ {{{

" Accidentally incrementing/decrementing a number (e.g. a hex address, a
" version string) is too easy to trigger by mistake - disable entirely
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>
xnoremap <C-a> <Nop>
xnoremap <C-x> <Nop>

" Join lines without moving the cursor
nnoremap J mpJ`p

" Move selected lines up or down
xnoremap J :m '>+1<cr>gv=gv
xnoremap K :m '<-2<cr>gv=gv

" Delete to the void register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Yank into the system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

" }}}

" List mappings ------------------------------------------------------------ {{{

" List contents of all registers (that typically contain pasteable text)
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.:<cr>
" Bring up the jump list
nnoremap <silent> "j :jumps<cr>
" Bring up the change list
nnoremap <silent> "c :changes<cr>

" }}}
