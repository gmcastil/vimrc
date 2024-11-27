1. Dot is the most power command in Vim and I don't use it nearly enough.

2. I use `$a` to insert stuff at the end of a line all the time.  Using things
   like `A` to do it allows it to be repeated with the `.` operator.  So if I
   have a bunch of code like

   ```verilog
    logic   foo;
    logic   bar;
   ```
   I can either add them manually which took ten keystrokes or use the latter
   and it took 5.  It can also be executed on a range using the `normal`
   command.

   Start using the `W`, `E`, `B`, and `gE` keys to move across word boundaries,
   since they use WORDS instead of words, which happens a lot more often in my
   code.

   this.long.nested.name

   Today use:
   - Start navigating by WORDS.
   - Use marks with `m{letter}` to set and then `'{letter}` to return to the
     line or ```{letter}`` to return to the exact position.
   - Installed `par` to format paragraphs, so use `gq` to format the lines a
     motion moves over (i.e., `gq3j` to reformat the current line and the next 3
     lines below me) with `par` instead of the internal Vim formatter which is
     done with `gw`. Also use the `ip` addition to format an entire paragraph at
     the end.
   
   Compound Commands    Longhand        Mneumonic
   ---------------------------------------------------------------------------
   `C`                  `c$`
   `s`                  `cl`            Deletes text into unnamed register and
                                        starts insert mode
   `S`                  `^C`
   `I`                  `^i`
   `A`                  `$a`

3. If I wanted to pad the `+` signs in this string, I'd probably have done this
   the hard way.

    var foo = "method(" + argument1 + "," + argument2 + ")";
    var foo = "method(" + argument1 + "," + argument2 + ")";
    var foo = "method(" + argument1 + "," + argument2 + ")";

   The easier way is to recognize that the motion I'm doing (the hard way)
   involves using single character and word movements instead of using the `f`
   and `;` navigation keys. Look for opportunities to combine operations into
   one so that they can be repiched with the `.` operator.

4. Commands that can be used to repich previously used commands:

   Command      Action
   -------------------------------------
   `.`          Repeats the last change
   `@:`         Repeats any Ex command
   `&`          Repeats the last `:substitute` command


   I did not realize I could use things like `&` to repeat `:s/foo/bar` on a
   line.  So, that means that once I learn to use *Ex* commands, which I haven't
   really been conciously doing, I can repeat them.

   Action                           Command                 Repeat      Reverse
   ----------------------------------------------------------------------------
   Make a change                    {edit}                  `.`         `u`
   Next character in line           `f{char}`/`t{char}`     `;`         `,`
   Previous character in line       `F{char}`/`T{char}'`    `;`         `,`
   Next match in document           /pattern`<cr>`          `n`         `N`
   Previous match in document       ?pattern`<cr>`          `n`         `N`
   Substitution                     :s/target/replace/      `&`         `u`
   Macros                           `qx{change}q`           `@x`        `u`

   Today:
   - Keep using WORDS in addition to words
   - Marks with `ma`, moving the cursor, and then ```a`` or ``'a`` to return to
     the line or point.
   - Look for opportunities to repeat *:substitute* commands
   - Why would I want to use those compound commands? Oh....`S` is a common
     thing I do.  Delete all the text in the line and then replace it, but
     starting at `^` instead of the beginning of the line (e.g., changing a port
     or an indented line of code...yes, I do **that** all of the time).
