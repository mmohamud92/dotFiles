# tmux Cheatsheet (Prefix = `Ctrl+a`)

### Prefix & window basics
| Keys | Action |
| --- | --- |
| `prefix` `c` | New window |
| `prefix` `,` | Rename current window |
| `prefix` `w` | List windows |
| `prefix` `n` / `p` | Next / previous window |
| `prefix` `&` | Close window (after prompt) |
| `prefix` `d` | Detach session (keep it running) |

### Pane layout bindings (customized)
| Keys | Action |
| --- | --- |
| `prefix` `|` | Split pane vertically (new pane on the right in cwd) |
| `prefix` `-` | Split pane horizontally (new pane below in cwd) |
| `prefix` `j` / `k` | Resize pane down / up by 5 cells |
| `prefix` `h` / `l` | Resize pane left / right by 5 cells |
| `prefix` `m` | Toggle pane zoom (keep held for repeat) |
| `prefix` `r` | Reload `~/.tmux.conf` |

> Mouse support is on, so you can drag to resize panes or select windows if preferred.

### Copy mode (vi keys)
- Enter copy mode with `prefix` `[`; leave with `Esc`.
- `v` starts a visual selection, `y` copies selection to the tmux buffer.
- Mouse drag selection stays in copy mode (`MouseDragEnd1Pane` is unbound).

### Movement & navigation tips
- Use the arrow keys or `prefix` with arrows to focus panes; `Ctrl+h/j/k/l` also jump between tmux and Neovim splits via `vim-tmux-navigator`.
- `prefix` `Space` cycles layouts, `prefix` `o` swaps panes.

### Persisting sessions
- `tmux-resurrect`: `prefix` `Ctrl+s` saves and `prefix` `Ctrl+r` restores (plugin defaults).
- `tmux-continuum`: auto-saves every 15 minutes and can auto-restore on start.

Keep this sheet handy inside tmux (e.g., `tmux split-window 'nvim ~/dotfiles/tmux-cheatsheet.md'`) and pair it with the Neovim sheet for in-editor mappings.
