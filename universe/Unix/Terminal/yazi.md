---
tags:
  - unix
  - cli
  - file-manager
---

# yazi

Blazing-fast terminal file manager written in Rust. Supports image previews, tabs, bulk operations, and plugin system.

## Install

```bash
cargo install --locked yazi-fm yazi-cli
```

## Usage

```bash
yazi              # open in current directory
yazi /path/to    # open in specific directory
```

Key bindings:

| Key | Action |
|---|---|
| `h` / `l` | Parent / enter directory |
| `j` / `k` | Move down / up |
| `Enter` | Open file |
| `Space` | Select file |
| `d` | Trash |
| `D` | Permanent delete |
| `r` | Rename |
| `y` / `p` | Yank / paste |
| `t` | New tab |
| `q` | Quit |
| `~` | Go to home |
| `/` | Search |

Config: `~/.config/yazi/`

## Links

- [yazi GitHub](https://github.com/sxyazi/yazi)
