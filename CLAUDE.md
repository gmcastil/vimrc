# What this is

A portable, minimal-dependency Vim (not Neovim) configuration. Its purpose is
to be quickly deployable on remote, ephemeral, containerized, or embedded
machines where installing and configuring a full Neovim + LSP + plugin
manager setup isn't practical — machines you're logging into once, or
infrequently, and don't want to spend real setup time on.

It was extracted from a separate, full Neovim configuration (LSP, Treesitter,
Telescope, lazy.nvim, etc.). This tree deliberately does *without* all of
that — it is a smaller, less capable subset by design, not by accident. Where
a setting/keybind/workflow has a plain-Vim equivalent, it was ported to match
the Neovim config's current behavior. Where something is fundamentally
LSP/Treesitter/Lua-only, it was left out rather than faked.

# Layout

```
vimrc                       top-level entry point
vimrc.d/
  globals.vim                SafeSource() + PrintError()/PrintWarn() - loads first
  set.vim                     all core options (see below)
  remaps.vim                  keybindings
  appearance.vim               colorscheme setup
  statusline.vim               hand-rolled statusline
  autocmds.vim                 autocommands
  builtins.vim                 built-in Vim runtime features (matchit, :Man)
  spelling.vim                  spell settings
  lint.vim                      shellcheck integration
colors/gruvbox.vim            vendored colorscheme (not a plugin)
spell/en.utf-8.add             custom dictionary
tmp/                           swap file directory (tracked via .gitignore keeper)
pack/plugins/start/            native Vim packages, as git submodules
```

`set.vim` absorbed what used to be several separate files in the source
config (`basic.vim`, `locale.vim`, `folding.vim`, `filetype.vim`,
`backup-swap.vim`) — core options, UTF-8-gated `listchars`/`fillchars`/
`pumborder`, fold level, filetype/syntax enabling, the swap directory,
`formatprg`, and completion (`complete`/`completeopt`/`wildoptions`) all live
there now. This was a deliberate tradeoff: fewer files to reason about for a
config meant to be legible on a box you don't own, at the cost of `set.vim`
covering more ground than its name suggests.

# Plugins

Native Vim packages only — no plugin manager. Each is a git submodule under
`pack/plugins/start/`, which Vim auto-loads at startup with zero
configuration. Currently: `vim-fugitive`, `vim-unimpaired`, `vim-gitgutter`,
`vim-surround`, `vim-commentary`, `vim-repeat`, `fzf`, `fzf.vim`.

**Submodules are pinned, not automatically updated.** Adding one records a
fixed commit SHA in this repo's history; it never moves on its own. Updating
one is a deliberate, explicit action (`cd` into it, pull, commit the new
pointer — or `git submodule update --remote --merge` for all of them).

**A fresh clone of this repo does not populate the submodules.** After
cloning, run `git submodule update --init --recursive` (or clone with
`--recurse-submodules`) or `pack/plugins/start/*` will just be empty
directories — Vim won't error, the plugins will simply be silently absent.

# Design principles

- **`SafeSource(path, label)`** (in `globals.vim`) is how every `vimrc.d/*.vim`
  file gets loaded from `vimrc`. A missing file is treated as an optional
  module and silently skipped. A file that exists but throws while sourcing
  is a real bug, and gets reported with the actual `v:exception` text, not a
  generic message — this distinction matters, don't collapse it back into a
  bare `try/catch` that swallows both cases the same way.
- Options live in `set.vim`; keybindings live in `remaps.vim`. Keep that
  split.
- External-tool dependencies (`par`, `shellcheck`, etc.) are always gated
  behind an `executable()` check, degrading gracefully (silently, or via
  `PrintWarn`) rather than erroring when the tool isn't installed.
- Nothing in here should require LSP, Treesitter, or a Lua runtime. If a
  feature needs one of those, it belongs in the Neovim config, not here.

# Gotchas already found and fixed during migration (don't reintroduce)

- `set nocompatible` must be set before anything else loads — several
  plugins (`vim-unimpaired` included) gate their own loading on
  `&compatible` being off.
- `mapleader` is set directly in `vimrc` itself, before `globals.vim` is even
  sourced — not in `set.vim`. This is deliberate: if `set.vim` ever breaks,
  `SafeSource` would otherwise swallow the error and leave every `<leader>`
  mapping silently unbound.
- Don't map `<C-Space>` directly. Most terminals send a literal NUL byte for
  Ctrl+Space rather than a distinguishable sequence, which collides with
  Vim's own built-in `<C-@>` binding ("insert previously inserted text and
  leave Insert mode") — map `<Nul>` instead.
- `signcolumn=yes:1` (colon-width suffix) is Neovim-only syntax. Plain Vim's
  `'signcolumn'` only accepts `auto`, `no`, `yes`, `number`.
- `termguicolors` is currently forced on unconditionally. This is untested
  over tmux/screen without truecolor passthrough and may need to become
  conditional if it misrenders there.

# Deliberately dropped (not oversights — don't re-add without asking)

- cscope, HDL/Verilog/VHDL-specific tooling (port-swapping, MARK_DEBUG
  attributes, the `vlog` compiler `errorformat`) — that workflow lives
  entirely in the Neovim config now.
- LSP-specific keybinds (diagnostic jump, hover, LSP completion trigger),
  LuaSnip snippet keybinds, the Lua scratch buffer — Neovim/Lua-only, no
  plain-Vim equivalent exists.
- Python-specific syntax configuration — language-specific concerns stay in
  Neovim/LSP, not here.

# Working style

This config is built incrementally and deliberately — one piece reviewed,
discussed, and tested at a time, not bulk-ported from the source Neovim
config. When extending it: propose changes before writing them, prefer
porting only what's actually still in use (check the Neovim config as the
source of truth for current behavior, not just the old plain-Vim version this
was migrated from), and smoke-test additions (a headless `vim -u vimrc -es`
invocation works for most things — real terminal behavior like popup
rendering or raw keycodes sometimes has to be verified live instead).
