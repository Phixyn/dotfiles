#!/bin/bash
#
# Set up bash, vim and applications on MacOS.
# NOTE: Run from root directory of dotfiles, not bin folder or anywhere else!

if [[ "$(basename $PWD)" != "dotfiles" ]]; then
  echo "[ERROR] Please run from root directory of dotfiles, not bin or anywhere else."
  exit 1
fi

echo "[INFO] Installing Homebrew..."
echo "[WARN] This uses sudo, get ready to type password multiple times."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew tap Homebrew/bundle

echo "[INFO] Installing applications from Brewfile..."
echo "[WARN] Get ready to type password."
brew bundle

echo "[INFO] Downloading git-completion.bash and git-prompt.sh..."
curl -o $HOME/bin/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o $HOME/bin/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

echo "[INFO] Copying bin files to $HOME/bin..."
cp -v bin/* $HOME/bin/

echo "[INFO] Downloading ticker.sh..."
curl -o $HOME/bin/ticker.sh https://raw.githubusercontent.com/pstadler/ticker.sh/master/ticker.sh
chmod +x $HOME/bin/ticker.sh

echo "[INFO] Copying .bash_profile to user folder."
cp .bash_profile $HOME/.bash_profile

echo "[INFO] Executing vim-setup.sh script..."
/bin/bash ./bin/vim-setup.sh

echo "[INFO] MacOS setup done."
