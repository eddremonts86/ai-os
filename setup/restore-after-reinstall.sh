#!/usr/bin/env bash
# setup/restore-after-reinstall.sh
# Companion to backup-before-reinstall.sh: copies everything back from the
# external volume onto a freshly reinstalled Mac, before running install-mac.sh.
#
# Usage:
#   bash restore-after-reinstall.sh [SRC]
#   SRC defaults to ~/Backups/ai-os (the backup script's default).
#   Projects land in AI_OS_PROJECTS_DIR, default ~/Projects.

set -euo pipefail

SRC="${1:-$HOME/Backups/ai-os}"
PROJECTS_DIR="${AI_OS_PROJECTS_DIR:-$HOME/Projects}"
PROJECTS_SRC="$SRC/Projects"
CONFIGS_SRC="$SRC/home-configs"

log() { echo "[restore] $*"; }

[ -d "$SRC" ] || { echo "[restore] not found: $SRC (plug in the backup volume first)" >&2; exit 1; }

log "1/2 $PROJECTS_SRC → $PROJECTS_DIR"
mkdir -p "$PROJECTS_DIR"
rsync -a --info=progress2 "$PROJECTS_SRC/" "$PROJECTS_DIR/"

log "2/2 $CONFIGS_SRC → \$HOME (preserving relative paths)"
rsync -a --info=progress2 "$CONFIGS_SRC/" "$HOME/"
chmod 700 "$HOME/.ssh" 2>/dev/null || true
chmod 600 "$HOME/.ssh/"* 2>/dev/null || true
[ -d "$HOME/.gnupg" ] && chmod 700 "$HOME/.gnupg"

log "done. Next: cd \"\$AI_OS_ROOT\" && bash setup/install-mac.sh  (AI_OS_ROOT = the restored ai-os checkout)"
