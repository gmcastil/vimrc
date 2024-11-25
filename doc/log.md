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

3. Start using the `W`, `E`, `B`, and `gE` keys to move across word boundaries,
   since they use WORDS instead of words, which happens a lot more often in my
   code.

   this.long.nested.name

   Today use:
   - Start navigating by WORDS.
   - Use marks with `m{letter}` to set and then `'{letter}` to return to the
     line or ```{letter}`` to return to the exact position.
   - 




