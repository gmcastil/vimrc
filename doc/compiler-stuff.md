<gmcastil> I want to supply my own errorformat strings for a language / tool that isn't part of the standard vim ($VIMRUNTIME/compiler/*.vim doesn't contain one anyway) - can i make my own compiler file in ~/.vim/ or something of that nature?
* #vim :Cannot send message to channel (+R) - you need to be logged into your NickServ account
>nickserv< identify ****
-NickServ- You are now identified for gmcastil.
-NickServ- Last login from: ~gmcastil@185.238.231.116 on Jan 08 02:51:14 2025 +0000.
<gmcastil> I want to supply my own errorformat strings for a language / tool that isn't part of the standard vim ($VIMRUNTIME/compiler/*.vim doesn't contain one anyway) - can i make my own compiler file in ~/.vim/ or something of that nature?
<romainl> yes
<gmcastil> specifically, i want to set my own errorformat string with all of the tools notes, woarnings, errors, etc.
<romainl> ~/.vim/compiler/foo.vim
<gmcastil> is it as simple as making a ~/.vim/compiler/unsupported-language-name.vim and then dumping it in there? and if so, when would that get run?
<romainl> you load it manually: :compiler foo
<gmcastil> so would an autocmd to load that be appropirate and have that in ~/.vim/ftdetect/foo.vim ?
<gmcastil> its systemverilog, which is a supported filetype, but doesnt have anything in compiler
<romainl> not an autocommand, just put `compiler foo` in ~/.vim/ftplugin/foo.vim
<romainl> ho, if it exists already, do it in ~/.vim/after/ftplugin/foo.vim instead
<gmcastil> so `compiler systemverilog` will let me define compiler stuff for anything that matches that ftdetect type?
<romainl> ftdetect sets the filetype -> filetype/foo.vim is sourced -> compiler foo loads the compiler
<gmcastil> there isnt a compiler for foo int he standard installation
<gmcastil> but there is a filetyep
<romainl> yes
<gmcastil> is the section in :help compiler on writing a compiler plugin basically what i need to do?
<digmbot> :help compiler -> http://vimhelp.appspot.com/quickfix.txt.html#%3Acompiler
<romainl> 1. create ~/.vim/compiler/systemverilog.vim
<romainl> 2. create ~/.vim/after/ftplugin/systemverilog.vim
<romainl> 3. with one line in it: `compiler systemverilog`
<gmcastil> ok, i wasn't getting those all together
<romainl> copy an existing one to bootstrap your work
<gmcastil> then the compiler/systemverilog.vim file will define all the compiler stuff
<romainl> once you have something working, consider making a PR so that it is added to Vim. I did that with a couple of ones
<gmcastil> oh this is so much easier than the autocmd shenangians i've been hopping around with
<gmcastil> yeah, there isn't one for vhdl or systemverilog, both of which i use....it should be tool specific though
<gmcastil> so somethign like "if (&target_sim = 'vsim') then set errorformat with all these vlog / vsim / vcom / etc. stuff"
<romainl> if you can manage to write something generic enough, adding it to Vim will help
<gmcastil> yes, it would be - i started using make to build my simulations and such and its great, but it interprets the errors completely stupid and opens up a variety of nonsensicnal buffers
<gmcastil> setting errorformat with just a little knowledge of the tool output was huge so yes, i think it'd be a good first plugin of any sort to write
<romainl> yeah, creating a custom compiler is the way to go in that case
<gmcastil> so the actual machinery to add to the actual vim tree would be in $MYVIMTIME/compiler/{systemverilog,verilog,vhdl}.vim and then that would provide the function seamlessly
<gmcastil> not sure how extensive it would be - the tool outputs are pretty variable
<gmcastil> and people build stuff in all sorts of wild ways
<gmcastil> but just putting somethign there would be an improvement?
<romainl> only your domain knowledge can tell taht
<romainl> that
<gmcastil> well, putting somethign there would at least let other people have something to engage with
<romainl> just to be sure have you tried to find an existing one?
<gmcastil> and i guess i can at least say "This assumes you're using questa sim as your simulation"
<gmcastil> there is a tiny note on the vim wiki
<romainl> https://github.com/vhda/verilog_systemverilog.vim/tree/master/compiler
<gmcastil> but the actual legwork of adding vsim, vopt, vlog, vcom message parsing to an errorformat string hasn't been done that i can tell
<gmcastil> i didnt know the compiler thing was what to look for yet
<romainl> ^
<mckeanbs> Is there a new canon rsync URL for getting vim to mirror it? I've tried a few URLs from the documentation here: https://www.vim.org/mirrors.php , but ftp.home.vim.org and ftp.vim.org don't resolve.
<romainl> mckeanbs: you should ask that on the official mailing list. maybe something is broken and they don't know
<mckeanbs> romainl, I'll do that. Thanks! I do see one of them has been retired, looking at the github issues, so I guess the documentation was never updated: https://github.com/vim/vim/issues/16361
<gmcastil> romainl, so, should i abandon the idea of adding systemverilog compiler support to vim?
<romainl> gmcastil: hard to say. on one hand it would certainly have value, if only for you. on the other hand, it looks like there already is at least one seemingly extensive plugin that already does that
<romainl> maybe you can poke around that plugin and see if you can contribute?
<gmcastil> i like the idea of somethign minimal at least in the defautl install - that plugin does try to do a lot of stuff that isnt just a compiler
<romainl> indeed
<romainl> I added eslint and standard compilers to Vim for that reason
<gmcastil> the default compiler out of the box is unusable because you just litter your buffer list with nonsense
<gmcastil> so maybe just restrict my addition to just the three verilog, systemverilog, and vhdl compiler entries with the notion that people could extend them if they wanted to
<romainl> +1


I need to make a systemverilog compiler, submit it to Vim as a PR or put it in
my own stuff.

