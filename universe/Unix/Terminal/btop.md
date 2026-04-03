---
tags:
  - unix
  - cli
  - system-monitoring
---

# btop

Modern resource monitor with a polished TUI. Shows CPU, memory, disks, network, and processes with graphs. Successor to bpytop and bashtop.

## Install

```bash
sudo apt install btop
```

## Usage

```bash
btop
```

Key bindings:

| Key | Action |
|---|---|
| `h` | Toggle help |
| `Esc` | Back / exit menu |
| `m` | Toggle memory display mode |
| `n` | Toggle network display mode |
| `d` | Toggle disk display mode |
| `e` | Toggle process tree view |
| `f` | Filter processes |
| `Enter` | Expand process details |
| `q` | Quit |

Config: `~/.config/btop/btop.conf`

## Links

- [btop GitHub](https://github.com/aristocratos/btop)
