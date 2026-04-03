---
tags:
  - unix
  - cli
  - shell
---

# Oh My Zsh

Community-driven framework for managing [[Zsh]] configuration. Comes with hundreds of plugins and themes out of the box.

## Install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Usage

Configuration lives in `~/.zshrc`:

```bash
# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable plugins
plugins=(git z)
```

Useful commands:

```bash
omz update              # update Oh My Zsh
omz plugin list         # list available plugins
omz plugin enable <name>  # enable a plugin
```

## Links

- [Oh My Zsh GitHub](https://github.com/ohmyzsh/ohmyzsh)
- [Plugin list](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
