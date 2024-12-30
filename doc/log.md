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

12. Combining operators and motions (bonus tip on `commentary`). It's like a
grammar:
- Actions are created by combining an operator followed by a motion
- When an operator command is invoked in duplicate, it acts upon the current
line

```bash
find .
ls -al
for i in f; do
    echo ${i}
done
```

To comment all of that code, I would normally use visual line mode followed by
`gcc`.  But a much better way is to use `gc4j` to comment from the top down or
`gcap` from somewhere inside to comment the entire piece.  This works with
indents too, which is huge - not because of the time it saves, but because it
prevents me from having to think about formatting.

Today:
- Keep using WORDS
- Use the `.` operator to repeat and think of things in terms of their atomicity
  for repeating or undoing
- Remember to think `<operator>` paired with `<motion>` and then paired with
`file object`

13. Fix words in insert mode without leaving insert mode with common (some of
    which were new to me) key controls.  The backspace key does what is normal,
    as does the `<C-h>` key, there's also a `<C-w>` to backspace an entire word
    and `<C-u>`. to delete and entire line and keep going without leaving insert
    mode (didn't know this one and it also works in readline as well). That's
    probably better than what I normally do, which is `<C-a><C-k>`. This would
    make tmux easier to use, since my leader there is `<C-a>`.

Today:
- Start using `<C-u>` to delete an entire line, keep using the motion operators
  as much as possible
- Insert Normal mode using `<C-o>`

14. Need to remap CAPSLOCK on a couple of my machines.
15. I can apparently use `<C-r>{register}` without leaving insert mode, really?
    Ok, yeah that is really useful.  So are a couple of other additional items
    that insert mode supports.  There's the `i` and `a` keys for inserting at
    the current position or appending to the current position.  Probably more
    useful are `<S-I>` and `<S-A>` which insert and append to the beginning or
    end of the current line.

Today:
- Keep using `<C-u>` to delete an entire insertion or append operation
- Try to switch out of insert mode to paste registers as little as possible
- The Vim mantra of operator paired with motion paired with file object

16. Calculations in Place
There is an expression register? 3 * 32 = 96.  That is probably a handy thing,
since I use that sort of stuff a lot j I wonder if it's capable of doing hex
math.  That'd be useful.

- Paste from a register and keep moving with `<C-r>{reg}` since this is such a
  common operation.
- Use the expression register for things like HDMI video formats, resolutions,
  etc

17-18. Unicode and Digraphs
This is probably not as important for me as it is for other people. Use `:help
digraph-table` to look them up. Basically, can use the `<C-v>{non-digit}` to
actually enter characters.  I personally hate non-ASCII characters in code
because of how ECAD tools might not interpret them.

19. Replace mode
I did not realize that all this time I've been using the one-shot replace mode
command `r{char}`.  I should probably use `R` to enter replacement mode. Also,
there is a virtual replacement mode that I've not used which is probably more
useful in some cases.

20-21. Visual line mode
I did not realize the `v` entered visual line character wise, so that's
interesting. Also, `gv` will reselect the last viusual selection, which is
handy.  So the keys I already use are `V` and `<C-v>` to do line and block
visual.

Today:
- Use `R` and `gR` for replacement
- How can I append to a set of lines in visual mode? Select using visual-block
  mode, then move to the end of the block with `$` and then append with `A`,
  insert the text, and then `<esc>` to be done

```systemverilog
logic [1:0] foo;
logic [1:0] far;
logic [1:0] bar;
logic [1:0] baz;
```
Yeah, that's going in the book for real.

22-26 Remainder of visual mode
- Use the `vi` to visually select things and then operate on them
- Definitely prefer operators to visual mode

27. Command line mode is entered through `:` or when we press `/` for search, or
    `<C-r>=` to access the expression register (in insert mode). I can even see
    it from my statusline mode indicator.

There are legions of `Ex` commands - check out `:h ex-cmd-index` for all of
them. A reminder here of using the `<C-r>/` to insert the value of the `/`
register, which holds the last search term.

Normal mode acts on where the cursor currently is - Ex commands can be used on
ranges anywhere, which is huge, because it means I can use do things locally
without having to move my cursor, pollute the jump history, etc.

Reminders today:
- Use `I` to enter insert mode at the start of a line and `<C-u>` to delete back
  to the start of the line
- Use `<C-r>` from insert mode to insert a register
- Marks using `m{letter}` to mark and return to a particular point

Ex mode feels like its one of those underutilized things that I haven't really
been taking advantage of.

28. Execute a command on one or more consecutive lines

- Just entering a number with nothing else will jump us to that absolute line
number
- Ranges get entered with a `,`
- Can follow up a number with a command like `print` or `substitute`
- Can also use visual line mode to select text, then `:` to enter Ex mode, and
  that range that was selected will be automatically prepended.
- The `'<` mark stands for the first line of the visual selection and `'>` is
  the last line of the visual selection
- For ranges, we have `.` for the current position, `$` for the end of the
  file, and `%` for the entire file.
- Can specify addresses for lines using patterns...whoa.  Yeah, that's unreal.
  The way it's done is `:/foo/,/bar/`, so to indicate this section here inside
  the conditional, it would be `:/if/,/end if/`
- Can also use address offsets by indicating a + or - and these can be used with
  the current line indicator

```vhdl
if (foo = '1') then
    baz <= '0';
else
    baz <= '1';
end if;
```

Today:
- Use subst, delete from Ex mode
- Use the `.` to indicate the current line, and use relative line numbers

29. Copying in Ex mode
The format of the copy command actually makes sense now that I know what
addresses and ranges are and how they get specified `:[range]copy {address}`.
So, I just enter the range I want and where I want it to go and then use the
`:copy` or `:t` command.  This makes absolute line numbers a lot more relevant.
One interesting side effect here is that the copy command doesn't go through a
register - it just performs the copy of text as a command (which makes sense,
since it's a command not a text operation). You can also duplicate the current
line using something like `:t.`.

Text blocks can also be moved in Ex mode. So if I wanted to move that block....

30. Using normal mode across a range

```javascript
var foo = 1
var bar = 'a'
var baz = 'z'
var foobar = foo + bar
var foobarbaz = foo + bar + baz
```

So the syntax for this command is `:{range}norm[al]! {commands}`

31. The previous normal mode command can be repeated with `@:` which can be seen
    by lookin at the contents of the `:` register.

32. Tab completing Ex commands

33. Can insert the current word under the cursor in command mode.  This doesn't
    sound like it's all that useful.  But, consider the case that you want to do
    a substitute command

    ```verilog
    wire        bar
    wire        baz
    wire        foo
    ```

To do this, we use the `c_CTRL-R c_CTRL-W` and `c_CTRL-R c_CTRL-A` combinations
to insert a <cword> or <cWORD>.  This is really useful for getting help on
vimscript or settings. Use the `:help` to enter command mine, and then insert
the word under the cursor to look up the help file for it.

34. The command line history window
So this is how you do it!  Use `q:` to enter the command-line window and then
one can manually modify and create a new command history.  Which is baller.
There are five different histories that are each distinct - search, commands,
debug, couple others.

35. Running commands in the shell
External programs get invoked with `!`
- The current filename is referenced on the command line with `%`
- To get stdout from the process we create, we can have it redirected to the
  current buffer
- So the get the current working directory output into the next few lines, use
  `:read !ls -al`
- The position of the `!` matters
- The `:!{cmd}` takes a range in the usual way `:[range]!{cmd}` but what's even
  better is that you can use motions and `!` to prepopulate the range
- Useful sidebar for running a quick shell - just background Vim with `<C-z>`
  and then run your shell commands and then `fg` to go back to Vim.

36. Text processing can be saved in a vimscript (as a sequence of Ex commands)
    and then run

37. Tracking open files with the buffer list
- This is my first real exposure to the `[` and `]` keys, which are prefix keys
  (I need to look into how to navigate buffers and the quickfix window more
  quickly).

Today I learned about operatorfunc - first, understand that `'[,]'` describes a
range. It starts from the line where the `[` mark is and covers to the line
where the `]` is.  So, doing something like `:'[,']s/foo/bar` will run `:s` for
each line in that range.  Pretty slick - what the `g@` does when working in the
context of operatorfunc, is after it gets a motion, 1) sets the [ and ] marks to
cover all he lines covered by the motion and then 2) calls operatorfunc with a
single argument: a string that can be 'line', 'char', or 'block'. That's why in
an operator function, one can use `'[,']s` to run an `:s` operation that will
run on each line covered by whatever motion that was done.

```text
<gmcastil> the single line still has the problem of not being extensible - what if i want it to match one of several regex?
<gmcastil> for example, i want to mark signals in both Verilog and VHDL, which have different syntax, different rules for marking, and then in both, there are different kinds of signals - it gets larger really fast
<gmcastil> crap...starting to sound like a plugin actually
<igemnace> gmcastil: you can just extend utils#mark_debug for that. you can add whatever statements you want inside it
<gmcastil> oh, so call different functions within it for various conditions?
<gmcastil> but then the visual line version doesnt accomplish the same thing
<igemnace> more like https://0x0.st/XC2R.txt
<igemnace> if you had to stop working linewise you'd have to jump through more hoops... but doable
<gmcastil> so the general idea is that the heavy lifting is all done by the function mark_debug() which can be called from visual line mode and then an operatorfunc wrapper exists
<igemnace> right!
<gmcastil> so the visual line mode comes first basically
<gmcastil> ah, i had it backwards
<gmcastil> is that a generally useful way to do this sort of thing? get it to work with visual line mode first, and then extend it to ranges?
<igemnace> more the other way around: if you can work with ranges, you automatically work with visual line mode for free (because '<,'> is a range that covers the visual selection)
<igemnace> operatorfunc is more of a special case. you kinda have to prepare a function specifically fit for it
<gmcastil> and then operator func is just a special instance of workign with a specific kind of range?
<igemnace> yep
<gmcastil> copy that, that makes a lot of sense
<gmcastil> you should uh...rewrite that portion of the manual
<igemnace> yeah i'm thinking perhaps start with a minimally illustrative example
<igemnace> one for that elusive Free Time i keep hearing about
```

37. Buffers are a normal part of the workflow, but some people apparently have a
    problem with this and need tabs to do it all for them.

The arglist is probably going to be something that I need to integrate into my
workflow.

38-39. The argument list is a way of grouping buffers together into a collection
- Can apply Ex commands to all of them using the `:argdo` command.
- Globbing is your friend

40. Window splits
- The `<C-w>_` and `<C-w>|` commands and their numbered variants can be used to
  maximize window height or width as well as 
- Window rotating is done with `CTRL-W_R`
- There are a lot of window controls that might be useful and I should read the
  page here on `:help CTRL-W`

41. Using tabs to contain different workspaces
- I already do this, but the `:lcd` command was new and that's awesome for tags
  and cscope output for sure
- So, `:lcd` sets a local working directory for a window, but `:windo lcd
  {path}` lets us set it for the entire tab page which is likely what i want
  more than anything.
- This is probably a really important tactic for working with multiple
  repositories that use tags and cscope files. Set the local window working
  directory for each tab

