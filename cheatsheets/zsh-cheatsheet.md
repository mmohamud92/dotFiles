# zsh / .zshrc Cheatsheet

### Reload / restart
- Reload config: `source ~/.zshrc`
- Restart shell: `exec zsh`

### Handy functions
| Command | Action |
| --- | --- |
| `mkcd <dir>` | Create a directory (parents ok) and `cd` into it |

### Keybindings (your `.zshrc`)
| Keys | Action |
| --- | --- |
| `Ctrl+p` | History search backward (matches what you’ve typed) |
| `Ctrl+n` | History search forward (matches what you’ve typed) |
| `Esc` `w` | Kill region (emacs keymap) |

### fzf (via `eval "$(fzf --zsh)"`)
| Keys | Action |
| --- | --- |
| `Ctrl+r` | Fuzzy search command history |
| `Ctrl+t` | Fuzzy pick files/dirs to insert |
| `Alt+c` | Fuzzy `cd` into a directory |

### zoxide (your `cd` is zoxide-powered)
- Jump by frecency: `cd <partial-name>`
- List matches: `zoxide query -l <partial-name>`

### Aliases (your `.zshrc`)
- `vim` → `nvim`
- `c` → `clear`
- `ls` → `ls --color`
- `g++` → `g++ -std=c++23`

### Prompt / plugins
- Powerlevel10k: configure with `p10k configure`
- Zinit: update plugins with `zinit update`
