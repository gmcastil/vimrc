" Tell Vim to store all of _our_ swap files in our own home directory if
" possible, and then all the other. One condition that this creates might be
" that files being edited by different users will be unaware of each other which
" isn't a condition I am particularly concerned about and am willing to live
" with to keep .swp files from littering the filesystem
set directory=~/.vim/tmp//,.,~/tmp,/var/tmp,/tmp

