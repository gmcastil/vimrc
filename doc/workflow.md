# Workflow Changes

1. Instead of searching for a pattern and then using `n` and `N` to navigate
   through the entire document, use `vimgrep` and the quickfix window to more
   clearly process the search results. This can even be done with multiple
   documents.

2. Instead of repeating the last substitute command by paging through the
   command history, the last substitute command can be reused using `&`. This
   doesn't preserve substitute flags, but the `:&&` Ex command does.  Since
   repeating the previous substitute command occurs quite often, I've remapped
   the `&` command to the full Ex command with flag preservation.  Note that
   none of these repeat the previous range - they act only on the current line.
   The `g&` command is a much larger hammer and can be used to repeat the
   previous substitution command over the entire file.

3. Reusing the current search pattern with the `s//<replacement text>/` is
   something I haven't used before, but it makes things a lot simpler.  So
   instead of trying to get the range correct, the search string correct, the
   replacement string and flags correct, focus instead on, at least for
   non-trivial regular expressions, search for the pattern first and then use it
   in a substitute command by using the current pattern.

4. Visual mode can be used for selecting ranges of text for things like yanking
   and pasting.  For things like entire lines or paragraphs, using text
   objects and operations on those text objects is still superior. But if I
   want to grab a sentence or some weird shape and then move it without having
   to prune around it, visual mode is probably a good candidate to introduce.
   Also, consider pairing this with `(` and `)` and similar (see `:help
   object-motions`) to move to the next sentence or paragraph.

5. Instead of manually repeating tag searches or going back up to the top of the
   tag stack and remembering which tag I picked, I can use the `:tnext` and
   `:tprev` to go forwards and backwards between the tags in the list that I
   selected.  This saves so much time!  And using `unimpaired` it gets even
   easier, since those are just bound to `]t` and `[t`.  Can also jump to the
   top of that list or bottom usting the `]T` and `[T` - this is a completely
   different thing from the tag stack (read `:help tag-stack`).

6. To look at the results of searching through a file, use `:vimgrep` to do it.
   For example, to find a list of all phony Makefile targets do something like
   this: `:vimgrep /\v^.PHONY:/g %`.  This will highlight them all, but more
   importantly it will populate the QuickFix list, which can be navigated with
   `[q` and `]q`.
