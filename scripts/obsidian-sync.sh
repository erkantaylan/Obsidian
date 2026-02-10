#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
VAULT_DIR="$REPO_DIR/universe"
LOCK_FILE="$REPO_DIR/.sync.lock"
LOG_FILE="$REPO_DIR/.sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"
}

# Prevent concurrent runs
if [ -f "$LOCK_FILE" ]; then
    lock_pid=$(cat "$LOCK_FILE" 2>/dev/null || echo "")
    if [ -n "$lock_pid" ] && kill -0 "$lock_pid" 2>/dev/null; then
        log "Another sync is running (PID $lock_pid), skipping"
        exit 0
    fi
    # Stale lock
    rm -f "$LOCK_FILE"
fi
echo $$ > "$LOCK_FILE"
trap 'rm -f "$LOCK_FILE"' EXIT

cd "$REPO_DIR"

# ── Step 1: Auto-commit local changes ──
has_changes() {
    ! git diff --quiet HEAD -- universe/ 2>/dev/null || \
    [ -n "$(git ls-files --others --exclude-standard -- universe/)" ]
}

if has_changes; then
    git add universe/
    git commit -m "vault backup: $(date '+%Y-%m-%d %H:%M:%S')" --quiet
    log "Committed local changes"
fi

# ── Step 2: Pull remote changes ──
# Fetch first to check if there's anything new
git fetch origin master --quiet 2>/dev/null || {
    log "Fetch failed (no network?), skipping pull"
    exit 0
}

LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/master)
BASE=$(git merge-base HEAD origin/master 2>/dev/null || echo "")

if [ "$LOCAL" = "$REMOTE" ]; then
    log "Already up to date"
    exit 0
fi

if [ "$LOCAL" = "$BASE" ]; then
    # We're behind, fast-forward
    git merge origin/master --ff-only --quiet 2>/dev/null && {
        log "Fast-forwarded to origin/master"
        exit 0
    }
fi

# ── Step 3: Merge with conflict resolution ──
# Try a normal merge first
if git merge origin/master --no-edit --quiet 2>/dev/null; then
    log "Merged origin/master cleanly"
    exit 0
fi

# Merge has conflicts — resolve them
log "Merge conflict detected, resolving by latest modification time"

conflicted_files=$(git diff --name-only --diff-filter=U)

for file in $conflicted_files; do
    if [ ! -f "$file" ]; then
        # File was deleted on one side — accept whatever exists
        git add "$file" 2>/dev/null || git rm "$file" 2>/dev/null
        log "  $file: accepted deletion"
        continue
    fi

    # Get both versions to temp files
    local_tmp=$(mktemp)
    remote_tmp=$(mktemp)

    # Extract ours (local) and theirs (remote) versions
    git show :2:"$file" > "$local_tmp" 2>/dev/null || true
    git show :3:"$file" > "$remote_tmp" 2>/dev/null || true

    # Get modification times
    # For local: use the file's mtime on disk (our working copy had this before merge)
    # For remote: use the commit time of the latest commit that touched this file on origin/master
    local_mtime=$(stat -c %Y "$local_tmp" 2>/dev/null || echo 0)

    # Get the timestamp of the last commit on origin/master that modified this file
    remote_commit_time=$(git log -1 --format=%ct origin/master -- "$file" 2>/dev/null || echo 0)
    local_commit_time=$(git log -1 --format=%ct HEAD -- "$file" 2>/dev/null || echo 0)

    if [ "$remote_commit_time" -ge "$local_commit_time" ]; then
        # Remote is newer — take theirs
        cp "$remote_tmp" "$file"
        log "  $file: took remote (remote: $remote_commit_time >= local: $local_commit_time)"
    else
        # Local is newer — take ours
        cp "$local_tmp" "$file"
        log "  $file: took local (local: $local_commit_time > remote: $remote_commit_time)"
    fi

    git add "$file"
    rm -f "$local_tmp" "$remote_tmp"
done

git commit -m "vault backup: $(date '+%Y-%m-%d %H:%M:%S') (resolved conflicts)" --quiet
log "Committed conflict resolution"

# ── Step 4: Push ──
git push origin master --quiet 2>/dev/null && {
    log "Pushed to origin/master"
} || {
    log "Push failed, will retry next run"
}
