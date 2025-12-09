#!/bin/bash

# Dotfiles installation script using GNU Stow

set -e

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed."
    echo "Install it with: brew install stow"
    exit 1
fi

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to dotfiles directory
cd "$DOTFILES_DIR"

echo "Installing dotfiles with GNU Stow..."
echo ""
echo "This will create symlinks from your home directory to the dotfiles repository."
echo ""

# Backup existing files if they exist
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    echo "Backing up existing ~/.zshrc to ~/.zshrc.backup"
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
    echo "Backing up existing ~/.config/nvim to ~/.config/nvim.backup"
    cp -r "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
    echo "Removing ~/.config/nvim (will be replaced with symlinks)"
    rm -rf "$HOME/.config/nvim"
fi

if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo "Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup"
    cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi

if [ -d "$HOME/.tmux" ] && [ ! -L "$HOME/.tmux" ]; then
    echo "Backing up existing ~/.tmux to ~/.tmux.backup"
    cp -r "$HOME/.tmux" "$HOME/.tmux.backup"
    echo "Removing ~/.tmux (will be replaced with symlinks)"
    rm -rf "$HOME/.tmux"
fi

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Install dotfiles using stow
echo ""
echo "Creating symlinks with stow..."
stow -v zsh
stow -v nvim
stow -v tmux

echo ""
echo "✓ Dotfiles installed successfully!"
echo ""
echo "Your files are now symlinked:"
echo "  ~/.zshrc → ~/dotfiles/zsh/.zshrc"
echo "  ~/.config/nvim → ~/dotfiles/nvim/.config/nvim"
echo "  ~/.tmux.conf → ~/dotfiles/tmux/.tmux.conf"
echo "  ~/.tmux → ~/dotfiles/tmux/.tmux"
echo ""
echo "Note: After installation, install TPM for tmux:"
echo "  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
echo ""
echo "To uninstall, run:"
echo "  cd ~/dotfiles"
echo "  stow -D zsh"
echo "  stow -D nvim"
echo "  stow -D tmux"

