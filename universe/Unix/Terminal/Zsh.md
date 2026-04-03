---
tags:
  - unix
  - cli
  - shell
---

# Zsh

Z Shell — an extended Bourne shell with many improvements over Bash, including better tab completion, globbing, spelling correction, and plugin support.

## Install

```bash
sudo apt install zsh
```

Set as default shell:

```bash
chsh -s $(which zsh)
```

## Usage

```bash
# Tab completion is context-aware
git che<TAB>  # completes to checkout, cherry-pick, etc.

# Glob qualifiers
ls **/*.md          # recursive glob
ls *(.)             # files only
ls *(/)             # directories only

# History substring search
# Start typing, then press Up to search history
```

## Links

- [Zsh Website](https://www.zsh.org/)
- [Zsh - ArchWiki](https://wiki.archlinux.org/title/Zsh)
