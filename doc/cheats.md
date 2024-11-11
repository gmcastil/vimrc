here is a find-manpage command that can be used to view the manpage for
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

Whitespace navigation - Using the `}` and `{` keys, you can move up and down
between whitespace regions, which is very useful when reading code

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

# Learning

- Command mode with history is done with `q:`.  All this time, and that was what I
was actually doing by accident?!
- You can view the contents of all the registers by just running `:reg` or `:reg
  [regname]`
- The read command can read files into the current buffer (using `:r filename`)
  or even the output of shell commands with `:r! shell command`. The latter
  works with pipes, tab completion, all manner of stuff
- Folds set to completely closed in every new file that gets opened
- Registers are a thing now! Holy smokes, how have I never used these. Read the
  help page for sure.

Registers
---------
Can view all of the registers and their contents with `:reg` command. That's
wild. Registers are accessed using the `"` operator. And then the normal rules
of operation apply (i.e., noun + verb).  So to use the `r` register and yank
omething into it, we would use `"ryiw` or `"ryy` to store a word or line
respectively. And then to put or place it somewhere, we would use `"rp` and the
contents would be placed at the current location.

In normal mode `Ctrl-R` redoes something that was undone. But in insert mode, it
gives access to registers. So, if something is stored in register `a` we can
access it from insert mode by just using `Ctrl-R a` without leaving insert mode.

Reading the `:help registers` is a really useful thing to do at this point, but
another couple of useful things are that there is a last search pattern register
which is read only and there is probably a way to search for a pattern and then
use it in a regular expression or search and replace of some sort

to yank into a particular register, use `y<ank> <x>` where x is the register.
You can also do relative line numbers or ranges.  For line numbers, something
like

:41y a

This would yank the contents of line #41 into the a register, which can then be
put by `"ap`

To do a relative line, use specify it using a + or -.  So

:-4y a

And then, again, `"ap` would get the line 4 lines above and similarly, +4 would
do 4 lines below

Movement
--------
H - jump to high
M - jump to medium
L - jump to low

}, { for jumping between empty lines

Editing
-------
Use C-o in insert mode to run a single command in normal mode and then switch
back to insert mode

Useful Tactics
--------------
Use `CTRL-d` to perform autocompletes on partial commands from commanfrom
command-line mode. For example, to figure out how to close a tab, type `:tab`
and then `CTRL-d` to see the various commands, in this case `tabclose`.

The `:b` command can also take a substring of a file to switch between buffers
quicker. Another thing to do is to list the buffers with `:ls` and then just
type `:b` immediately, rather than escaping the menu.

Kernel Hacking
A useful link for configuring Vim to work with cscope and tags when doing kernel
development is [this](https://raw.githubusercontent.com/gmcastil/vim-gruvbox8/master/colors/gruvbox8.vim) post on Stack Overflow.


To determine when a key was last set, use `:verbose imap <tab>` or something lie
that

