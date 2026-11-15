#!/usr/bin/env bash
# setup/backup-before-reinstall.sh
# One-shot rsync of everything needed to survive a clean macOS reinstall:
# your projects folder (source excl. regenerable build junk) + dev/cloud credentials & CLI configs.
# Projects folder: AI_OS_PROJECTS_DIR, else the folder that holds this checkout.
#
# Usage:
#   bash setup/backup-before-reinstall.sh [DEST]
#   DEST defaults to ~/Backups/ai-os. Point it at an external disk: a backup on the disk
#   you are about to wipe does not survive the reinstall.
#
# Idempotent: rsync -a, safe to re-run to pick up new changes before the reinstall.

set -euo pipefail

DEST="${1:-$HOME/Backups/ai-os}"
AI_OS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECTS_DIR="${AI_OS_PROJECTS_DIR:-$(dirname "$AI_OS_ROOT")}"
PROJECTS_DEST="$DEST/Projects"
CONFIGS_DEST="$DEST/home-configs"

log() { echo "[backup] $*"; }

# rsync exit 24 = "some files vanished before transfer" (e.g. a live editing
# session touching a file mid-copy) — not a real failure, don't abort on it.
rsync_tolerant() {
  local rc=0
  rsync "$@" || rc=$?
  [ "$rc" -eq 0 ] || [ "$rc" -eq 24 ] || exit "$rc"
}

# A checkout directly in $HOME would make the projects folder the whole home folder.
if [ "$PROJECTS_DIR" = "$HOME" ] || [ "$PROJECTS_DIR" = "/" ]; then
  echo "[backup] the projects folder resolved to $PROJECTS_DIR; set AI_OS_PROJECTS_DIR to the folder that holds your projects" >&2; exit 1
fi
case "$DEST/" in "$PROJECTS_DIR"/*) echo "[backup] destination $DEST is inside $PROJECTS_DIR; pick another" >&2; exit 1 ;; esac
[ -d "$(dirname "$DEST")" ] || { echo "[backup] destination volume not mounted: $DEST" >&2; exit 1; }
case "$DEST" in "$HOME"/*) log "warning: $DEST is on this Mac's own disk; copy it off before reinstalling" ;; esac
mkdir -p "$PROJECTS_DEST" "$CONFIGS_DEST"

log "1/2 $PROJECTS_DIR → $PROJECTS_DEST (excluding node_modules/.venv/dist/build/.next/target/__pycache__/.turbo)"
rsync_tolerant -a --info=progress2 \
  --exclude 'node_modules' --exclude '.venv' --exclude 'venv' \
  --exclude 'dist' --exclude 'build' --exclude '.next' \
  --exclude 'target' --exclude '__pycache__' --exclude '.turbo' \
  "$PROJECTS_DIR/" "$PROJECTS_DEST/"

log "2/2 credentials & CLI configs → $CONFIGS_DEST"
# Each entry: source path relative to $HOME (only copied if it exists).
CONFIG_PATHS=(
  .ssh
  .gnupg
  .aws
  .config/gcloud
  .kube
  .docker/config.json
  .terraform.d
  .gitconfig
  .git-credentials
  .npmrc
  .pypirc
  .claude/settings.json
  .claude/CLAUDE.md
  .claude/skills
  .claude/agents
  .hermes/config.yaml
  .hermes/memories
  .hermes/state.db
  .codex/config.toml
  .codex/auth.json
  .codex/sessions
  .gemini/settings.json
  .gemini/config
  .agents
  "Library/Application Support/Claude/claude-code"
  "Library/Application Support/Claude/claude-code-sessions"
  "Library/Application Support/Claude/Claude Extensions"
)

for rel in "${CONFIG_PATHS[@]}"; do
  src="$HOME/$rel"
  [ -e "$src" ] || continue
  out="$CONFIGS_DEST/$rel"
  if [ -d "$src" ]; then
    # trailing slash on both sides: copy CONTENTS into $out, not $out/$(basename $src)
    mkdir -p "$out"
    rsync_tolerant -a "$src/" "$out/"
  else
    mkdir -p "$(dirname "$out")"
    rsync_tolerant -a "$src" "$out"
  fi
done

log "done. Verify with: du -sh '$DEST'"
