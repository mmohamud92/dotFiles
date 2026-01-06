#!/bin/bash

# Dotfiles installation script using GNU Stow

set -e

BREW_FORMULAE=(stow pkg-config imagemagick)
BREW_CASKS=(kitty keymapp shottr)

# Ensure required Homebrew packages/casks exist
if command -v brew &> /dev/null; then
    echo "Ensuring required Homebrew packages are installed..."
    for formula in "${BREW_FORMULAE[@]}"; do
        if brew list "$formula" &> /dev/null; then
            echo "  ✓ $formula already installed"
        else
            echo "  → Installing $formula"
            brew install "$formula"
        fi
    done

    for cask in "${BREW_CASKS[@]}"; do
        if brew list --cask "$cask" &> /dev/null; then
            echo "  ✓ $cask already installed"
        else
            echo "  → Installing $cask"
            brew install --cask "$cask"
        fi
    done
else
    echo "Warning: Homebrew not found. Install it from https://brew.sh and manually install: ${BREW_FORMULAE[*]} plus casks: ${BREW_CASKS[*]}"
fi

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

if [ -d "$HOME/.config/kitty" ] && [ ! -L "$HOME/.config/kitty" ]; then
    echo "Backing up existing ~/.config/kitty to ~/.config/kitty.backup"
    cp -r "$HOME/.config/kitty" "$HOME/.config/kitty.backup"
    echo "Removing ~/.config/kitty (will be replaced with symlinks)"
    rm -rf "$HOME/.config/kitty"
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
stow -v kitty
stow -v tmux

echo ""
echo "✓ Dotfiles installed successfully!"
echo ""
echo "Your files are now symlinked:"
echo "  ~/.zshrc → ~/dotfiles/zsh/.zshrc"
echo "  ~/.config/nvim → ~/dotfiles/nvim/.config/nvim"
echo "  ~/.config/kitty → ~/dotfiles/kitty/.config/kitty"
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
echo "  stow -D kitty"
echo "  stow -D tmux"
