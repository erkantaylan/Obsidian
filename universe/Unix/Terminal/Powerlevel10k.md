---
tags:
  - unix
  - cli
  - shell
---

# Powerlevel10k

Fast and highly customizable [[Zsh]] theme. Works with [[Oh My Zsh]]. Shows git status, command execution time, directory, and more in the prompt.

## Install

With Oh My Zsh:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Set in `~/.zshrc`:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

## Usage

```bash
p10k configure    # run the interactive configuration wizard
```

Config file is at `~/.p10k.zsh`.

## Recommended Fonts

Uses Meslo Nerd Font for icons. The configuration wizard will offer to install it.

## Links

- [Powerlevel10k GitHub](https://github.com/romkatv/powerlevel10k)
