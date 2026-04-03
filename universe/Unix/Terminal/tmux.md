---
tags:
  - unix
  - cli
  - terminal-multiplexer
---

# tmux

Terminal multiplexer — run multiple terminal sessions inside a single window, detach and reattach to sessions. Sessions persist even if you close your terminal.

## Install

```bash
sudo apt install tmux
```

## Usage

```bash
tmux                    # start new session
tmux new -s name        # start named session
tmux ls                 # list sessions
tmux attach -t name     # reattach to session
tmux kill-session -t name  # kill session
```

Default prefix is `Ctrl+B`, then:

| Key | Action |
|---|---|
| `c` | New window |
| `n` / `p` | Next / previous window |
| `%` | Split vertically |
| `"` | Split horizontally |
| `d` | Detach |
| `x` | Kill pane |
| `z` | Toggle pane zoom |
| `[` | Scroll mode (q to exit) |

Config file: `~/.config/tmux/tmux.conf`

## Links

- [tmux GitHub](https://github.com/tmux/tmux)
- [tmux cheat sheet](https://tmuxcheatsheet.com/)
