#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

# Vim looks for its config at ~/.vimrc or ~/.vim/vimrc. Link this repo into
# place as ~/.vim so it's found either way, backing up anything already
# there (a real ~/.vim, a symlink to somewhere else, an old ~/.vimrc)
# instead of clobbering it.
link_vim_dir() {
    local target="$HOME/.vim"

    if [ "$target" = "$script_dir" ]; then
        echo "==> Already running from $target, nothing to link"
        return
    fi

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$script_dir" ]; then
        echo "==> $target already linked to this repo, skipping"
        return
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
        local backup="$target.old"
        local n=1
        while [ -e "$backup" ] || [ -L "$backup" ]; do
            backup="$target.old.$n"
            n=$((n + 1))
        done
        echo "==> Moving existing $target out of the way -> $backup"
        mv "$target" "$backup"
    fi

    if [ -f "$HOME/.vimrc" ]; then
        echo "==> Moving existing $HOME/.vimrc -> $HOME/.vimrc.old"
        mv "$HOME/.vimrc" "$HOME/.vimrc.old"
    fi

    echo "==> Linking $target -> $script_dir"
    ln -s "$script_dir" "$target"
}

echo "==> Linking this repo as ~/.vim..."
link_vim_dir

echo "==> Fetching plugin submodules..."
git submodule update --init --recursive

fzf_dir="pack/plugins/start/fzf"
if command -v fzf >/dev/null 2>&1; then
    echo "==> fzf already on PATH, skipping binary install"
elif [ -x "$fzf_dir/install" ]; then
    echo "==> Installing fzf binary..."
    "$fzf_dir/install" --bin --no-update-rc
else
    echo "==> Warning: fzf submodule not found at $fzf_dir - skipping"
fi

echo "==> Checking optional external tools..."
check_optional() {
    local bin="$1" feature="$2"
    if command -v "$bin" >/dev/null 2>&1; then
        echo "    [ok]      $bin found"
    else
        echo "    [missing] $bin not found - $feature"
    fi
}
check_optional rg "needed for fzf.vim's :Rg live grep"
check_optional shellcheck "needed for shell script linting (lint.vim)"
check_optional par "needed for gq/gw reflow (falls back to Vim's internal formatter)"

echo "==> Done."
