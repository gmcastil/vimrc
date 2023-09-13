There is a find-manpage command that can be used to view the manpage for
whatever is under the cursor.  For example, in C, placing the cursor under
the `printf` function call and hitting <Leader>K will invoke the manpage
for printf.

TODO: Figure out how to do documentation look up for C and library calls 
from within Vim.  There has to be a canonical way to do this without needing
fancy plugins.

Trying to debug a Vim script or understand when a variable was last assigned to?
Give verbose mode a try:

  :verbose set textwidth?

Will let you know when the textwidth variable was changed last.

Things I learned today
- Use `:term` to open an actual terminal running bash
- Window navigation uses `Ctrl-W hjkl`
- 

Wildmenu mode makes command line completion easier

Also, autocomplete is a thing I shoudl use more
- When in insert mode, ^x and so forth
:q

Folding

zo	open one level of a fold
zc	close one level of a fold
za	toggle fold

zO	opens fold recursively under the cursor
zC	closes fold recursievely under the cursor
zA	toggle fold recursively under the cursor

zM	fold the whole file
zR	unfold the whole file

Splits

C-w v	split vertically (same buffer)
C-w h	split horiontally (same buffer)
C-w q	close split but not buffer

K	Run man page on the term under the cursor

Tags
----
C-]	To go to the tag
