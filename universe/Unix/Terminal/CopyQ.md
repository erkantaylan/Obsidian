---
tags:
  - unix
  - cli
  - utility
  - clipboard
---

# CopyQ

Advanced clipboard manager with history, search, editing, and scripting. Stores text, images, and rich content from your clipboard.

## Install

```bash
sudo apt install copyq
```

## Usage

```bash
copyq show               # open the clipboard manager window
copyq toggle             # toggle window visibility
```

Key features:

- Stores clipboard history (searchable)
- Edit clipboard items before pasting
- Organize items into tabs
- Custom commands and scripting
- Supports text, HTML, and images
- System tray integration

CLI commands:

```bash
copyq read 0             # read most recent item
copyq add "text"          # add text to clipboard
copyq count              # number of items in history
copyq select 3           # copy 4th item to clipboard
```

Tip: bind `copyq toggle` to a keyboard shortcut for quick access.

## Links

- [CopyQ GitHub](https://github.com/hluk/CopyQ)
