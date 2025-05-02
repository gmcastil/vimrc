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
