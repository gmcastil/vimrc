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
C-t	To return from tag (up the tag stack)
C-w }	Preview in the split
C-w z	Close the split (after it opens)

C-d is a thing to show you what completions are available  I think


Navigation
----------
Various Motions

H, M, L for moving cursor high, middle and low of the screen
zt, zz, zb - move the screen so that the cursos is at the high, middle and low
Ctrl-U, Ctrl-D for moving up and down a half screen
Ctrl-B, Ctrl-F for moving up and down a full screen

Ctrl-^ toggles between two buffers - it doesnt cycle through them so, just
switches between them

Editing

Searches

Marks
-----
m{a-zA-Z} - sets a mark
`{a-zA-Z} - jumps to the mark (using `'` instead of ``` will jump to first
non-blank character)

`. and '. jump to last changes

Tags

Jumplist / Changelist

C-W C-W seems to switch between windows

Often, I will want to open files that are in the same directory as a file I
currently have open (but haven't `cd` to that directory). To open files in that
location, use `:Ex` for `Explore`.  This also may be useful

https://stackoverflow.com/questions/1708623/opening-files-in-the-same-folder-as-the-current-file-in-vim


Tabs
----
To open a buffer in a new tab, just split it but start with the tab command, so
`:tab sb` and that will move it

