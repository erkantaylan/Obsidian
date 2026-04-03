---
tags:
  - unix
  - cli
  - search
---

# fzf

General-purpose command-line fuzzy finder. Pipe any list into it for interactive filtering. Integrates with shell history, file search, and more.

## Install

```bash
sudo apt install fzf
```

## Usage

```bash
# Interactive file finder
fzf

# Pipe anything into it
cat file.txt | fzf
history | fzf
ps aux | fzf

# Find and open file in editor
vim $(fzf)

# Preview files while browsing
fzf --preview 'cat {}'
```

Shell key bindings (if enabled):

| Shortcut | Action |
|---|---|
| `Ctrl+T` | Paste selected file path |
| `Ctrl+R` | Search command history |
| `Alt+C` | cd into selected directory |

## Links

- [fzf GitHub](https://github.com/junegunn/fzf)
