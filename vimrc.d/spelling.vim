set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add

augroup SpellBehavior
    autocmd!
    autocmd FileType markdown,gitcommit,text,tex,rst,mail,gitrebase setlocal spell
augroup END
