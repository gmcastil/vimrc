# Learning Vim

1. Dot is the most powerful command in Vim and I don't use it nearly enough.

2. I use `$a` to insert stuff at the end of a line all the time. Using
things like `A` to do it allows it to be repeated with the `.` operator.
So if I have a bunch of code like

   ```verilog
    logic   foo;
    logic   bar;
   ```
I can either add them manually which took ten keystrokes or use the
latter and it took 5. It can also be executed on a range using the
`normal` command. Start using the `W`, `E`, `B`, and `gE` keys to
move across word boundaries, since they use WORDS instead of words,
which happens a lot more often in my code.

Today use:
- Start navigating by WORDS.
- Use marks with `m{letter}` to set and then `'{letter}` to return to the
  line or ```{letter}`` to return to the exact position.
- Installed `par` to format paragraphs, so use `gq` to format the lines a
  motion moves over (i.e., `gq3j` to reformat the current line and the next
  3 lines below me) with `par` instead of the internal Vim formatter which
  is done with `gw`. Also use the `ip` addition to format an entire
  paragraph at the end.
   
   Compound Commands    Longhand        Mneumonic
   ---------------------------------------------------------------------------
   `C`                  `c$`
   `s`                  `cl`            Deletes text into unnamed register and
                                        starts insert mode
   `S`                  `^C`
   `I`                  `^i`
   `A`                  `$a`

3. If I wanted to pad the `+` signs in this string, I'd probably have
done this the hard way.

```
    var foo = "method(" + argument1 + "," + argument2 + ")";
    var foo = "method(" + argument1 + "," + argument2 + ")";
    var foo = "method(" + argument1 + "," + argument2 + ")";
```

The easier way is to recognize that the motion I'm doing (the hard way) involves
using single character and word movements instead of using the `f` and `;`
navigation keys. Look for opportunities to combine operations into one so that
they can be repiched with the `.` operator.

4. Commands that can be used to repich previously used commands:

   |**Command**    | **Action**     |
   |-----------|-------------------------|
   |`.`        | Repeats the last change|
   |`@:`       | Repeats any Ex command|
   |`&`        | Repeats the last `:substitute` command|


I did not realize I could use things like `&` to repeat `:s/foo/bar` on a
line.  So, that means that once I learn to use *Ex* commands, which I haven't
really been conciously doing, I can repeat them.

   |**Action**                   |       **Command**      | **Repeat**  | **Reverse**|
   |-----------------------------|------------------------|-------------|--------|
   |Make a change                |   {edit}               |  `.`        | `u`|
   |Next character in line       |   `f{char}`/`t{char}`  |  `;`        | `,`|
   |Previous character in line   |   `F{char}`/`T{char}'` |  `;`        | `,`|
   |Next match in document       |   /pattern`<cr>`       |  `n`        | `N`|
   |Previous match in document   |   ?pattern`<cr>`       |  `n`        | `N`|
   |Substitution                 |   :s/target/replace/   |  `&`        | `u`|
   |Macros                       |   `qx{change}q`        |  `@x`       | `u`|

   Today:
   - Keep using WORDS in addition to words
   - Marks with `ma`, moving the cursor, and then ```a`` or ``'a`` to return to
     the line or point.
   - Look for opportunities to repeat *:substitute* commands
   - Why would I want to use those compound commands? Oh....`S` is a common
     thing I do.  Delete all the text in the line and then replace it, but
     starting at `^` instead of the beginning of the line (e.g., changing a port
     or an indented line of code...yes, I do **that** all of the time).

5. Interesting example of using `*` to search for all instances of a word,
   then `cw` to change the word, followed by `n` to go to the next one, and
   using `.` to repeat the last change.

   Today use:
   - Big WORD navigation instead of just words.
   - More reminders to use marks
   - Changed my leader key to space today

6-8. The Dot Formula:
   - One key to move, one key to execute as a paradigm. Which speaks to the next
     point made in one of the other tips, which is to leave insert mode and go
     back to normal mode
   - The insert to normal mode switch is what determines the scope of the undo
     command.
   - That leads to the next idea, which is to make atomic changes.

9. Compose repeatable changes (easier to undo or use the dot operator with)

---
# Sidebar on Operator Commands

## Common Operator Commands

| **Operator** | **Action**                               | **Example**                  |
|--------------|------------------------------------------|-----------------------------|
| `d`          | Delete text                              | `dw` (delete word), `d$` (delete to end of line) |
| `c`          | Change text (delete + insert mode)       | `cw` (change word), `ciw` (change inner word)   |
| `y`          | Yank (copy) text                         | `yw` (yank word), `yG` (yank to end of file)    |
| `>`          | Indent text                              | `>}` (indent block), `>>` (indent current line) |
| `<`          | Unindent text                            | `<}` (unindent block), `<<` (unindent current line) |
| `g~`         | Toggle case                              | `g~w` (toggle case of word)                     |
| `gu`         | Convert to lowercase                     | `guw` (lowercase word), `gU}` (lowercase block) |
| `gU`         | Convert to uppercase                     | `gUw` (uppercase word), `gU}` (uppercase block) |
| `!`          | Filter text through an external command  | `!}` (filter block through external command)   |
| `=`          | Reformat (reindent) text                 | `=}` (reindent block), `==` (reindent line)    |

---

## What Motions Work with Operators

| **Motion** | **Meaning**                                   | **Example**          |
|------------|-----------------------------------------------|----------------------|
| `w`        | Start of the next word                        | `dw` (delete to next word) |
| `e`        | End of the current or next word               | `de` (delete to end of word) |
| `b`        | Start of the current or previous word         | `db` (delete to previous word) |
| `0`        | Beginning of the line                         | `d0` (delete to beginning of line) |
| `^`        | First non-blank character on the line         | `d^` (delete to first non-blank character) |
| `$`        | End of the line                               | `d$` (delete to end of line) |
| `{` or `}` | Beginning or end of the current paragraph     | `d}` (delete to end of paragraph) |
| `G`        | End of the file                               | `dG` (delete to end of file) |
| `%`        | Match to a paired character (e.g., `(`, `{`)  | `d%` (delete inside matching brackets) |

---

## Using Text Objects with Operators

| **Text Object** | **Meaning**                                  | **Example**           |
|-----------------|----------------------------------------------|-----------------------|
| `aw`            | A word (including surrounding whitespace)    | `daw` (delete a word with space) |
| `iw`            | Inner word (excluding surrounding whitespace)| `diw` (delete inner word) |
| `ap`            | A paragraph                                  | `dap` (delete a paragraph) |
| `ip`            | Inner paragraph                              | `dip` (delete inner paragraph) |
| `a(` or `i(`    | A pair of parentheses                        | `da(` (delete everything including `()`) |
| `a{` or `i{`    | A block of `{}`                              | `da{` (delete everything inside `{}` including braces) |

10. I can do arithmetic in Vim?

This actually happens a lot in things like:

    ```vhdl
    chroma_c0
    chroma_c1
    luma_y0
    luma_y1
    luma_y2
    luma_y3
    luma_y4
    luma_y5
    luma_y6
    luma_y7
    luma_y8
    luma_y9
    luma_y10
    luma_y11
    luma_y12
    luma_y13
    luma_y14
    luma_y15
    luma_y16
    luma_y17
    luma_y18
    luma_y19
    luma_y20
    luma_y21
    -- ...
    ```
And I need to make some copies of that last one. I can use `<C-a` and `<C-x>` to
add and subtract.  I did not know this.  Let's see if I can make this faster.
Yep, so I can use `yyp` to yank a line from normal mode, paste it, and then
chane the value at the end.  And by doing it using a macro, it's easy to get an
entire column without having to use recursion.  Pretty neat.

11. Operator modes that I did not know about

So, this totally shattered my mind - first, think about operator pending mode as
a state initiated after using an operator (more on this in a second) that only
accepts motion commands, which then finishes.  So, think of it like 'Normal
mode' -> 'Operator pending mode' -> 'Normal mode'

Now operator commands - all the normal ones, `c` for change, `d` for delete, `y`
yank into a register, `g~`, `gu`, `gU` for changing case, `>` and `<` for
indent, and `=` for autoindent **which I did not know about until today!**  And
`!` for filtering through an external program.  Actually, there is a bit more
here than this too - check out `:help operator` and note that there is a way to
filter code through an external program for indenting code.
