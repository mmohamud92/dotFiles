# LazyGit Cheatsheet (defaults — press `?` to confirm your bindings)

### Global navigation
| Keys | Action |
| --- | --- |
| `?` | Show keybindings/help |
| `q` / `Ctrl+c` | Quit |
| `Tab` / `Shift+Tab` | Next / previous panel |
| `j` / `k` (or arrows) | Move selection down / up |
| `Enter` | Open/confirm (diff, details, prompt) |
| `Esc` | Back/cancel/close popup |
| `/` | Search/filter in the active panel |

### Status / files (staging + discard)
| Keys | Action |
| --- | --- |
| `s` | Stage/unstage selected file/hunk (context-dependent) |
| `a` | Stage all |
| `d` | Discard selected change (careful) |
| `e` | Edit file (opens `$EDITOR`) |
| `o` | Open file (system opener, if configured) |

### Commit workflow
| Keys | Action |
| --- | --- |
| `c` | Commit (prompts for message) |
| `A` | Amend last commit |
| `C` | Commit with options (e.g., sign, --no-verify; varies by version) |

### Branches, checkout, and history
| Keys | Action |
| --- | --- |
| `b` | Branches panel / branch actions |
| `n` | New branch (from current) |
| `Enter` | Checkout selected branch/commit |
| `r` | Rebase (interactive/options vary by context) |
| `M` | Merge (from selected into current; context-dependent) |

### Remotes (fetch/pull/push)
| Keys | Action |
| --- | --- |
| `f` | Fetch |
| `p` | Pull |
| `P` | Push |

### Stash
| Keys | Action |
| --- | --- |
| `S` | Stash actions (stash/apply/pop/drop; context-dependent) |

### Quick “daily driver” flows
- Stage a file → `s`, stage everything → `a`
- Commit → `c` (or amend → `A`)
- Pull latest → `p`, push your work → `P`, fetch → `f`
- Need the exact mapping in your build → press `?` in the relevant panel

