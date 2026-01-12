#!/bin/bash

# Dotfiles installation script using GNU Stow

set -euo pipefail

BREW_FORMULAE=(stow pkg-config imagemagick tmux neovim gh lazygit ripgrep go rust)
BREW_CASKS=(kitty keymapp shottr bentobox maccy)

log() { printf "%s\n" "$*"; }
warn() { printf "Warning: %s\n" "$*" >&2; }
die() { printf "Error: %s\n" "$*" >&2; exit 1; }

have() { command -v "$1" >/dev/null 2>&1; }

ver_ge() {
    local a="$1" b="$2"
    IFS='.' read -r a1 a2 a3 <<<"${a%%[^0-9.]*}"
    IFS='.' read -r b1 b2 b3 <<<"${b%%[^0-9.]*}"
    a1=${a1:-0}; a2=${a2:-0}; a3=${a3:-0}
    b1=${b1:-0}; b2=${b2:-0}; b3=${b3:-0}
    if [ "$a1" -ne "$b1" ]; then [ "$a1" -gt "$b1" ]; return; fi
    if [ "$a2" -ne "$b2" ]; then [ "$a2" -gt "$b2" ]; return; fi
    [ "$a3" -ge "$b3" ]
}

ensure_cmd() {
    local cmd="$1"
    local hint="${2:-}"
    if ! have "$cmd"; then
        if [ -n "$hint" ]; then
            die "Missing required command: $cmd. $hint"
        fi
        die "Missing required command: $cmd"
    fi
}

print_prereq_summary() {
    log ""
    log "Prerequisite check:"
    for cmd in git stow nvim rg go cargo make; do
        if have "$cmd"; then
            log "  ✓ $cmd"
        else
            log "  ✗ $cmd (missing)"
        fi
    done

    if have nvim; then
        local nvim_ver
        nvim_ver="$(nvim --version | head -n1 | awk '{print $2}' | sed 's/^v//')"
        if ! ver_ge "$nvim_ver" "0.11.0"; then
            warn "Neovim $nvim_ver detected; this config expects Neovim 0.11+."
        fi
    fi
}

# Ensure required Homebrew packages/casks exist
if command -v brew &> /dev/null; then
    log "Ensuring required Homebrew packages are installed..."
    for formula in "${BREW_FORMULAE[@]}"; do
        if brew list "$formula" &> /dev/null; then
            log "  ✓ $formula already installed"
        else
            log "  → Installing $formula"
            brew install "$formula"
        fi
    done

    for cask in "${BREW_CASKS[@]}"; do
        if brew list --cask "$cask" &> /dev/null; then
            log "  ✓ $cask already installed"
        else
            log "  → Installing $cask"
            brew install --cask "$cask"
        fi
    done
else
    warn "Homebrew not found."
    warn "Install it from https://brew.sh and manually install: ${BREW_FORMULAE[*]} plus casks: ${BREW_CASKS[*]}"
fi

ensure_cmd git
ensure_cmd stow "Install it with: brew install stow"

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Change to dotfiles directory
cd "$DOTFILES_DIR"

log "Installing dotfiles with GNU Stow..."
log ""
log "This will create symlinks from your home directory to the dotfiles repository."
log ""

# Backup existing files if they exist
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
    log "Backing up existing ~/.zshrc to ~/.zshrc.backup"
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
    log "Backing up existing ~/.config/nvim to ~/.config/nvim.backup"
    cp -r "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
    log "Removing ~/.config/nvim (will be replaced with symlinks)"
    rm -rf "$HOME/.config/nvim"
fi

if [ -d "$HOME/.config/kitty" ] && [ ! -L "$HOME/.config/kitty" ]; then
    log "Backing up existing ~/.config/kitty to ~/.config/kitty.backup"
    cp -r "$HOME/.config/kitty" "$HOME/.config/kitty.backup"
    log "Removing ~/.config/kitty (will be replaced with symlinks)"
    rm -rf "$HOME/.config/kitty"
fi

if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    log "Backing up existing ~/.tmux.conf to ~/.tmux.conf.backup"
    cp "$HOME/.tmux.conf" "$HOME/.tmux.conf.backup"
fi

if [ -d "$HOME/.tmux" ] && [ ! -L "$HOME/.tmux" ]; then
    log "Backing up existing ~/.tmux to ~/.tmux.backup"
    cp -r "$HOME/.tmux" "$HOME/.tmux.backup"
    log "Removing ~/.tmux (will be replaced with symlinks)"
    rm -rf "$HOME/.tmux"
fi

# Create .config directory if it doesn't exist
mkdir -p "$HOME/.config"

# Install dotfiles using stow
log ""
log "Creating symlinks with stow..."
stow -v zsh
stow -v nvim
stow -v kitty
stow -v tmux

log ""
log "✓ Dotfiles installed successfully!"
log ""
log "Your files are now symlinked:"
log "  ~/.zshrc → ~/dotfiles/zsh/.zshrc"
log "  ~/.config/nvim → ~/dotfiles/nvim/.config/nvim"
log "  ~/.config/kitty → ~/dotfiles/kitty/.config/kitty"
log "  ~/.tmux.conf → ~/dotfiles/tmux/.tmux.conf"
log "  ~/.tmux → ~/dotfiles/tmux/.tmux"

print_prereq_summary
log ""
log "Notes:"
log "  - Neovim config assumes Neovim 0.11+ (uses vim.lsp.config/vim.lsp.enable)."
log "  - blink.cmp builds with cargo; LuaSnip builds a regex dependency with make."
log ""

if [ "${INSTALL_TPM:-1}" = "1" ]; then
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        log "Installing TPM (tmux plugin manager) to ~/.tmux/plugins/tpm..."
        mkdir -p "$HOME/.tmux/plugins"
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        log "TPM already installed at ~/.tmux/plugins/tpm"
    fi
else
    log "Skipping TPM install (set INSTALL_TPM=1 to enable)."
fi

if [ "${BOOTSTRAP_NVIM:-0}" = "1" ]; then
    if have nvim; then
        log ""
        log "Bootstrapping Neovim plugins (Lazy sync) in headless mode..."
        nvim --headless "+Lazy! sync" +qa || warn "Neovim bootstrap failed; open nvim and run :Lazy sync"
        log "If tools/LSPs don't install automatically, open Neovim and run :Mason"
    else
        warn "Neovim not found; skipping BOOTSTRAP_NVIM."
    fi
fi

log ""
log "To uninstall, run:"
log "  cd ~/dotfiles"
log "  stow -D zsh"
log "  stow -D nvim"
log "  stow -D kitty"
log "  stow -D tmux"
