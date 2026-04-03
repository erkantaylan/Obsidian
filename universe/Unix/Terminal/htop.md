---
tags:
  - unix
  - cli
  - system-monitoring
---

# htop

Interactive process viewer for the terminal. Improved replacement for `top` with color output, mouse support, and easy process management.

## Install

```bash
sudo apt install htop
```

## Usage

```bash
htop              # launch
htop -u kamyon    # show only your processes
htop -p 1234      # monitor specific PID
```

Key bindings:

| Key | Action |
|---|---|
| `F2` | Setup / settings |
| `F3` | Search process |
| `F4` | Filter |
| `F5` | Tree view |
| `F6` | Sort by column |
| `F9` | Kill process |
| `F10` | Quit |
| `u` | Filter by user |
| `t` | Toggle tree view |
| `H` | Toggle user threads |

Config: `~/.config/htop/htoprc`

## Links

- [htop GitHub](https://github.com/htop-dev/htop)
