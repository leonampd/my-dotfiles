#!/bin/bash

command -v brew >/dev/null 2>&1 || {
  echo >&2 "Installing Homebrew Now"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

apps_brew=(
  zsh
  zsh-syntax-highlighting
  zsh-autosuggestions
  git
  stow
  neovim
  clojure-lsp/brew/clojure-lsp-native
  tmux
  tmuxinator
  bat
  ripgrep
  fd
  fzf
)

stow_packs=(
  zsh
  git
  neovim
  tmux
  tmuxinator
)

echo ""
echo "Installing some basic apps"

for app in "${apps_brew[@]}"; do
  if ! command -v "$app" >/dev/null 2>&1; then
    echo >&2 "Installing $app using brew..."
    if ! brew install "$app"; then
      echo >&2 "Failed to install $app. Please check for errors and try again."
      exit 1
    fi
  fi
done

echo ""
echo "Installing packer for neovim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo ""
echo "Installing Oh my Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ""
echo "Stowing the apps"

for app in ${stow_packs[@]}; do
  stow --dotfiles -vRt ${HOME} $app
done

stow --dotfiles -vRt $HOME/Library/Application\ Support/com.mitchellh.ghostty/ ghostty
