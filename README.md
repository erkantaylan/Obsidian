# Obsidian Vault - Universe

Auto-synced Obsidian vault using git.

## Structure

```
.
├── README.md
├── scripts/
│   └── obsidian-sync.sh    # auto-commit, pull, push with conflict resolution
└── universe/               # ← open this folder in Obsidian
    ├── .obsidian/
    └── *.md
```

## Setup

### 1. Clone

```bash
git clone git@github.com:erkantaylan/Obsidian.git ~/Documents/obsidian-vault/universe
```

### 2. Open vault in Obsidian

Open the `universe/` subfolder as your vault (not the repo root).

### 3. Enable the systemd timer

```bash
# Copy the service and timer files
cp scripts/obsidian-sync.service ~/.config/systemd/user/
cp scripts/obsidian-sync.timer ~/.config/systemd/user/

# Enable and start
systemctl --user daemon-reload
systemctl --user enable --now obsidian-sync.timer

# Check status
systemctl --user status obsidian-sync.timer
systemctl --user list-timers
```

### 4. Check logs

```bash
tail -f .sync.log
```

## Conflict resolution

When a merge conflict occurs, the script compares the last commit timestamp for each conflicted file on both sides (local vs remote). The version from the **more recent commit wins**. This is logged in `.sync.log`.

## Manual sync

```bash
./scripts/obsidian-sync.sh
```
