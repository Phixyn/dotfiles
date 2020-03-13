#!/usr/bin/env bash

BASE_DIR="$HOME/.vim"
# PLUGIN_DIR="$BASE_DIR/bundle"
# COLORS_DIR="$BASE_DIR/colors"
# AUTOLOAD_DIR="$BASE_DIR/autoload"
PACK_DIR="$BASE_DIR/pack/phix"
PLUGINS=(
  "dracula/vim"
  "ctrlpvim/ctrlp.vim"
  "vim-airline/vim-airline"
  "vim-airline/vim-airline-themes"
  "scrooloose/nerdtree"
  "tpope/vim-pathogen"
  "terryma/vim-multiple-cursors"
  "airblade/vim-gitgutter"
  "gabrielelana/vim-markdown"
  # "leafgarland/typescript-vim"
  # "bigfish/vim-js-context-coloring"
  "pangloss/vim-javascript"
)

# mkdir -p $PLUGIN_DIR
# mkdir -p $COLORS_DIR
# mkdir -p $AUTOLOAD_DIR
mkdir -p $PACK_DIR

curl -o $HOME/.vimrc https://raw.githubusercontent.com/Phixyn/dotfiles/master/.vimrc
# wget https://raw.githubusercontent.com/dracula/vim/master/colors/dracula.vim -O $COLORS_DIR/dracula.vim
# git clone https://github.com/dracula/vim.git "$PACK_DIR/start/dracula"

for PLUGIN in ${PLUGINS[@]}; do
  DIRNAME="$(basename $PLUGIN)"
  git clone https://github.com/$PLUGIN.git "$PACK_DIR/start/$DIRNAME"
done

# cp $PLUGIN_DIR/vim-pathogen/autoload/pathogen.vim $AUTOLOAD_DIR/pathogen.vim

echo "[INFO] Vim setup done."
