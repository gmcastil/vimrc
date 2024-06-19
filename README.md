# Vim Configuration
Incrementally improving Vim configuration.

## Setting up CoC and Tab Completion in C++
Getting C++ auto-completion to work requires some extra work.

1. First, build and install Vim version 9
2. Pretty sure that `clang` needs to be installed on the system as well
3. Also, install nodejs >= 16.18.0:
```bash
curl -sL install-node.vercel.app/lts | sudo -E bash
```
4. Install CoC from github and the help tags
```bash
mkdir -pv ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
vim -c "helptags coc.nvim/doc/ | q"
```
5. Run `:CocInstall coc-clangd` to install the extension for `clangd`
6. Then, open a C++ file and it should warn that there is no `clangd` in the
   current PATH and instruct me to run `CocCommand clangd.install`.
7. Then, tab completion can be configured as desired (or as is already done in
   the `vimrc` file. This almost certainly required the `build-essential`
   package installed on the system.

