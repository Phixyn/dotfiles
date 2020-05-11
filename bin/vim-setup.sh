#!/usr/bin/env bash

BASE_DIR="$HOME/.vim"
PACK_DIR="$BASE_DIR/pack/phix"
PLUGINS=(
  # "dracula/vim"
  "ctrlpvim/ctrlp.vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "freitass/todo.txt-vim"
  "terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  "gabrielelana/vim-markdown"
  # "leafgarland/typescript-vim"
  # "bigfish/vim-js-context-coloring"
  "pangloss/vim-javascript"
)

mkdir -p $PACK_DIR

# Get latest .vimrc from dotfiles repo
curl -o $HOME/.vimrc https://raw.githubusercontent.com/Phixyn/dotfiles/master/.vimrc
# The basename for this repo is 'vim', so clone it outside of the
# loop to give it a more descriptive name.
git clone https://github.com/dracula/vim.git "$PACK_DIR/start/dracula"
# Git clone remaining plugins into pack/start folder
for PLUGIN in ${PLUGINS[@]}; do
  DIRNAME="$(basename $PLUGIN)"
  git clone https://github.com/$PLUGIN.git "$PACK_DIR/start/$DIRNAME"
done

echo "[INFO] Vim setup done."
