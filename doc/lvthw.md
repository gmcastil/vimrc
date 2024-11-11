# Chapter 1 Echoing Messages

There is a 'messages' buffer of some sort that you can send messages to using
the `echom` command. Helpful if trying to figure out if a particular file is
being source or not.

# Chapter 2 Setting Options

The 'number', 'numberwidth', and 'relativenumber' options are useful,
particularly for commands that use them.

# Chapter 3 Basic Mappings

To revert a key to its default settings, just use `unmap <key>`

# Chapter 4 Modal Mapping

Normal mode                     `:nmap <key> mapping`
Visual mode                     `:vmap <key> mapping`
Insert mode                     `:imap <key> mapping`

Need to write a mapping that capitalizes the current word while in insert mode.

# Chapter 5 Strict Mappings

This just looks like a crazy problem added by people getting too crazy with key
mappings.

# Chapter 6 Leaders

Leaders are basically keys that can be used as a <leader> prior to a new
keybind. It allows one to use the leading key to expand keybind options, without
requiring the key to be unbound from its normal function. An example of this is
using <Space> as a keybind character, which unmaps it from its normal usage.

# Chapter 7 Editing Your Vimrc

Liked the idea of making a temporary keybind to edit my ~/.vim/vimrc file.

# Chapter 8 Abbreviations

# Chapter 9 More Mappings

Also added a couple of keybinds with the `:let mapleader="-"` option, so then
`-ev` opens up my $MYVIMRC and `-sv` sources it into the current running instance
of Vim.

# Chapter 10 Training Your Fingers

I unmapped all of the arrow keys in normal, insert, and visual mode.
