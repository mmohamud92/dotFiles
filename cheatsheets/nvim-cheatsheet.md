# Neovim Cheatsheet (Leader = `Space`)

### Core movement (built-in)
- Lines: `j` / `k` move down/up, `gj` / `gk` respect wrapped lines.
- Words: `w` next word start, `e` next word end, `b` previous word start; use uppercase (`W/E/B`) for whitespace-delimited jumps.
- Line bounds: `0` column 1, `^` first non-blank, `$` line end.
- Files: `gg` top, `G` bottom; `:{line}` jumps to exact line.
- Paragraphs / blocks: `}` / `{` jump by blank-line-separated blocks; `%` jumps between matching braces.
- Functions (treesitter-aware motions): `[[` / `]]` (prev/next function start), `[{` / `]}` (prev/next end) when supported; alternatively, `]m` / `[m` jump between method definitions.
- Scrolling: `Ctrl+b` up a page, `Ctrl+f` down a page; `Ctrl+u` up half page, `Ctrl+d` down half page.

### Everyday normal/insert helpers
| Keys | Action |
| --- | --- |
| `jk` (insert) | Leave insert mode |
| `<leader>nh` | Clear search highlight |
| `<leader>+` / `<leader>-` | Increment / decrement number under cursor |

### Splits & tabs
| Keys | Action |
| --- | --- |
| `<leader>sv` / `<leader>sh` | Split window vertically / horizontally |
| `<leader>se` | Equalize split sizes |
| `<leader>sx` | Close current split |
| `<leader>to` / `<leader>tx` | Open / close tab |
| `<leader>tn` / `<leader>tp` | Next / previous tab |
| `<leader>tf` | Open current buffer in a new tab |

### File explorer (nvim-tree)
| Keys | Action |
| --- | --- |
| `<leader>ee` | Toggle tree |
| `<leader>ef` | Focus tree on current file |
| `<leader>ec` | Collapse all nodes |
| `<leader>er` | Refresh tree |

### Search & picker workflows (Telescope)
| Keys | Action |
| --- | --- |
| `<leader>ff` | Find files |
| `<leader>fr` | Recent files |
| `<leader>fs` | Live grep in cwd |
| `<leader>fc` | Grep word under cursor |
| `<leader>ft` | Todo comments picker |
| `<leader>fk` | Telescope keymaps picker |

Telescope insert-mode mappings inside pickers:
- `Ctrl+j` / `Ctrl+k` move selection down/up.
- `Ctrl+q` sends selected items to the quickfix list and opens it in Trouble.
- `Ctrl+t` opens current picker results inside Trouble.

### Editing, formatting & linting
| Keys | Action |
| --- | --- |
| `<leader>r` | Substitute with motion (operator-pending) |
| `<leader>rr` | Substitute entire line |
| `<leader>R` | Substitute to end of line |
| Visual `<leader>r` | Substitute selected block |
| `<leader>mp` | Run configured formatter (Conform) |
| `<leader>l` | Trigger configured linters (nvim-lint) |

### Surround editing (`nvim-surround`)
| Keys | Action |
| --- | --- |
| `ys{motion}{char}` | Wrap text object/motion with given surrounding (e.g., `ysiw)` wraps word in parentheses) |
| `cs{old}{new}` | Change the surrounding delimiters (e.g., `cs"'` from double to single quotes) |
| `ds{char}` | Delete the surrounding pair matching `{char}` (e.g., `ds)` removes parentheses but keeps contents) |

### Session management
| Keys | Action |
| --- | --- |
| `<leader>wr` | Restore session for cwd (auto-session) |
| `<leader>ws` | Save session for cwd |

### Git (gitsigns)
| Keys | Action |
| --- | --- |
| `]h` / `[h` | Next / previous hunk |
| `<leader>hs` / `<leader>hr` | Stage / reset hunk (normal or visual range) |
| `<leader>hS` / `<leader>hR` | Stage / reset entire buffer |
| `<leader>hu` | Undo last staged hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line (full) |
| `<leader>hB` | Toggle inline blame |
| `<leader>hd` / `<leader>hD` | Diff against index / HEAD~ |
| `ih` (text object) | Select current hunk in operator/visual mode |

### Git (vim-fugitive)
| Keys | Action |
| --- | --- |
| `<leader>gg` | Git status (Fugitive) |
| `<leader>gc` | Git commit |
| `<leader>gp` / `<leader>gP` | Git push / pull --rebase |
| `<leader>gb` | Git blame |
| `<leader>gd` | Git diff (vertical split) |
| `<leader>gl` | Git log |
| `<leader>lg` | LazyGit (TUI) |

### GitHub (octo.nvim)
| Keys | Action |
| --- | --- |
| `<leader>O` | Open Octo command palette |

### Todo comments
- `]t` / `[t` jump to next / previous TODO-style comment anywhere in the buffer.

### Debugging (DAP, DAP UI, Go helpers)
| Keys | Action |
| --- | --- |
| `<leader>dc` | Continue / start debugging |
| `<leader>ds` / `<leader>di` / `<leader>do` | Step over / into / out |
| `<leader>dr` / `<leader>dt` | Restart / terminate session |
| `<leader>db` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dl` | Set log point |
| `<leader>dC` | Clear all breakpoints |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` (normal/visual) | Evaluate expression under cursor / selection |
| `<leader>dgt` / `<leader>dgl` | Debug Go test / rerun last Go debug |

### Go-specific helpers
- `<leader>gsj` adds `json` struct tags; `<leader>gsy` adds `yaml` tags (requires gopher tooling).

### Other useful reminders
- Formatter/linter config uses filetype-aware tools (Prettier, Stylua, gofmt/goimports, isort/black, etc.).
- Sessions auto-save is disabled by default, so trigger `<leader>ws` when you want a checkpoint.

Open alongside the tmux cheatsheet when pairing terminal multiplexing with Neovim (e.g., `nvim ~/dotfiles/nvim-cheatsheet.md`).
