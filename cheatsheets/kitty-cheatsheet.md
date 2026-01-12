# Kitty cheatsheet

Note: these are Kitty defaults unless you’ve remapped them in `~/.config/kitty/kitty.conf`. `kitty_mod` defaults to `ctrl+shift`.

## Tabs & windows

- New tab: `kitty_mod+t`
- Close tab/window: `kitty_mod+w`
- Next/prev tab: `kitty_mod+right` / `kitty_mod+left`
- New window (split within a tab): `kitty_mod+enter`
- Next/prev window: `kitty_mod+]` / `kitty_mod+[`

## Copy/paste & scrollback

- Copy: select text (copies on select by default in many configs) or use `kitty_mod+c` (if enabled)
- Paste: `kitty_mod+v`
- Scrollback up/down: `kitty_mod+page_up` / `kitty_mod+page_down`
- Open scrollback in pager: `kitty_mod+g` (if enabled)

## Search & URLs

- Open URLs: `kitty_mod+e` (hints; if enabled)
- Search scrollback: `kitty_mod+f` (if enabled)

## Config

- Reload config: `kitty_mod+f5`
- Edit config: `kitty_mod+f2` (opens `kitty.conf` in `$EDITOR` if configured)

## Remote control (CLI)

- List windows/tabs: `kitty @ ls`
- Focus a window: `kitty @ focus-window --match id:<ID>`
- Send text: `kitty @ send-text --match id:<ID> "echo hi\\n"`

