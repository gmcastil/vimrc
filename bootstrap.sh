#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir"

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
