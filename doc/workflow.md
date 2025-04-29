# Workflow Changes

1. Instead of searching for a pattern and then using `n` and `N` to navigagte
   through the entire document, use `vimgrep` and the quickfix window to more
   clearly process the search results. This can even be done with multiple
   documents

2. Instead of repeating the last substitute command by paging through the
   command history, the last substitute command can be reused using `&`. This
   doesn't preserve substitute flags, but the `:&&` Ex command does.  Since
   repeating the previous substitute command occurs quite often, I've remapped
   the `&` command to the full Ex command with flag preservation.  Note that
   none of these repeat the previous range - they act only on the current line.
   The `g&` command is a much larger hammer and can be used to repeat the
   previous substitution command over the entire file.

