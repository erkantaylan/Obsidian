---
tags:
  - unix
  - cli
  - terminal-emulator
---

# Terminator

Terminal emulator that supports tiling — split your terminal into multiple panes within a single window. Useful for monitoring multiple things at once without a multiplexer like [[tmux]].

## Install

```bash
sudo apt install terminator
```

## Usage

Key shortcuts:

| Shortcut | Action |
|---|---|
| `Ctrl+Shift+O` | Split horizontally |
| `Ctrl+Shift+E` | Split vertically |
| `Ctrl+Shift+W` | Close pane |
| `Ctrl+Shift+T` | New tab |
| `Alt+Arrow` | Move between panes |
| `Ctrl+Shift+X` | Toggle zoom on pane |

Config file: `~/.config/terminator/config`

## Links

- [Terminator GitHub](https://github.com/gnome-terminator/terminator)
