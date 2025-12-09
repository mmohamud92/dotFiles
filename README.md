# Dotfiles

My personal dotfiles managed with GNU Stow.

The actual configuration files live in this repository, and symlinks are created in your home directory pointing to them. This means when you edit files in `~/.config/nvim/`, `~/.zshrc`, or `~/.tmux.conf`, you're actually editing the files in this repository.

## Prerequisites

Install the following via Homebrew:

```bash
brew install stow
brew install pkg-config
brew install imagemagick
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/mmohamud92/dotFiles.git ~/dotfiles
cd ~/dotfiles
```

2. Install dotfiles using stow:

**Option A: Use the install script (recommended)**
```bash
./install.sh
```

**Option B: Manual installation**
```bash
# Backup existing configs first (if needed)
# Then create symlinks:
stow zsh
stow nvim
stow tmux
```

This will create symlinks from your home directory to the files in this repository:
- `~/.zshrc` → `~/dotfiles/zsh/.zshrc`
- `~/.config/nvim` → `~/dotfiles/nvim/.config/nvim`
- `~/.tmux.conf` → `~/dotfiles/tmux/.tmux.conf`
- `~/.tmux` → `~/dotfiles/tmux/.tmux`

## What's Included

- **zsh**: Zsh configuration (`.zshrc`)
- **nvim**: Neovim configuration (`.config/nvim/`)
- **tmux**: Tmux configuration (`.tmux.conf` and `.tmux/`)

## Tmux Setup

After installing the dotfiles, you need to install the Tmux Plugin Manager (TPM):

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then reload your tmux configuration:
```bash
tmux source ~/.tmux.conf
```

Or if you're already in a tmux session, press `Ctrl-a + r` (or your configured prefix + r) to reload the config.

After TPM is installed, install the plugins by pressing `prefix + I` (capital I) in tmux.

## Updating

After making changes to your dotfiles:

```bash
cd ~/dotfiles
git add .
git commit -m "Update dotfiles"
git push
```

## Workflow

Since files are symlinked, you can edit them in either location:

1. **Edit files** in their normal locations (they're symlinks):
   - `~/.config/nvim/` for Neovim
   - `~/.zshrc` for Zsh
   - `~/.tmux.conf` for Tmux
   
   Or edit directly in the dotfiles repo:
   - `~/dotfiles/nvim/.config/nvim/`
   - `~/dotfiles/zsh/.zshrc`
   - `~/dotfiles/tmux/.tmux.conf`

2. **Commit and push** changes:
   ```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update config"
   git push
   ```

No syncing needed - changes are immediate because of symlinks!

## Restowing

If you need to recreate symlinks (e.g., after pulling changes):

```bash
cd ~/dotfiles
stow -D zsh    # Unlink
stow zsh       # Relink

stow -D nvim   # Unlink
stow nvim      # Relink

stow -D tmux   # Unlink
stow tmux      # Relink
```

Or use the install script again (it will handle backups).

## Required Homebrew Packages

The following packages are required:

- `stow` - Symlink manager for dotfiles
- `pkg-config` - Required for building `telescope-fzf-native.nvim`
- `imagemagick` - Required for `image.nvim` plugin (LuaRocks magick package)

Install all at once:
```bash
brew install stow pkg-config imagemagick
```

