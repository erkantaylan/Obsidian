---
tags:
  - unix
  - cli
  - search
---

# ripgrep

Extremely fast recursive search tool written in Rust. Replacement for `grep -r`. Respects `.gitignore` by default, supports regex, and searches compressed files.

## Install

```bash
sudo apt install ripgrep
```

## Usage

```bash
rg "pattern"                # search current directory recursively
rg "pattern" src/           # search specific directory
rg -i "pattern"             # case insensitive
rg -l "pattern"             # list matching files only
rg -t py "pattern"          # search only Python files
rg -g "*.md" "pattern"      # search only markdown files
rg --no-ignore "pattern"    # don't respect .gitignore
rg -C 3 "pattern"           # show 3 lines of context
rg -w "word"                # match whole words only
```

## Links

- [ripgrep GitHub](https://github.com/BurntSushi/ripgrep)
