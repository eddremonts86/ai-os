#!/usr/bin/env bash
# setup/verify.sh
# Verifica que AI-OS está correctamente instalado. 1-comando.
# Uso: bash setup/verify.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"

LOG_PREFIX="[ai-os verify]"
log() { echo "$LOG_PREFIX $*"; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
section() { echo ""; echo "$LOG_PREFIX ─── $* ───"; }

PASS=0
FAIL=0

# ─── 1. AI-OS path ───
section "1. AI-OS path"
if [ -d "$AI_OS_ROOT" ] && [ -f "$AI_OS_ROOT/CLAUDE.md" ]; then
  ok "AI-OS en $AI_OS_ROOT"
  PASS=$((PASS+1))
else
  err "AI-OS no encontrado en $AI_OS_ROOT"
  FAIL=$((FAIL+1))
fi

# ─── 2. Dotfiles ───
section "2. Dotfiles symlinks"
for dotfile in ".zshrc" ".p10k.zsh" ".gitignore_global"; do
  if [ -L "$HOME_DIR/$dotfile" ]; then
    target=$(readlink "$HOME_DIR/$dotfile")
    if [ -e "$target" ]; then
      ok "  $dotfile → $target"
      PASS=$((PASS+1))
    else
      err "  $dotfile → $target (BROKEN)"
      FAIL=$((FAIL+1))
    fi
  else
    warn "  $dotfile no es symlink (puede ser OK si tenías tu config custom)"
  fi
done

# ─── 3. Skills en 5 CLIs ───
section "3. Skills globales (5 CLIs)"
CLI_DIRS=(
  "$HOME_DIR/.claude/skills"
  "$HOME_DIR/.codex/skills"
  "$HOME_DIR/.gemini/skills"
  "$HOME_DIR/.agents/skills"
  "$HOME_DIR/.hermes/skills/imported"
)
for cli_dir in "${CLI_DIRS[@]}"; do
  if [ -d "$cli_dir" ]; then
    # Contar skills: cada skill es un directorio o symlink-a-directorio.
    # Excluir archivos de meta (READMEDD, llms, .system).
    count=$(find "$cli_dir" -maxdepth 1 -mindepth 1 ! -name "READMEDD.md" ! -name "taste-skill-llms.txt" ! -name ".system" 2>/dev/null | wc -l | tr -d ' ')
    label="~/${cli_dir#$HOME_DIR/}"
    ok "  ${label}: $count skills"
    PASS=$((PASS+1))
  else
    err "  $cli_dir no existe"
    FAIL=$((FAIL+1))
  fi
done

# ─── 4. Superpowers (14 required) ───
section "4. Superpowers skills (REQUIRED = 14)"
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  if [ -d "$HOME_DIR/.claude/skills/$skill" ]; then
    ACTUAL=$((ACTUAL+1))
  fi
done
if [ "$ACTUAL" -eq "$EXPECTED" ]; then
  ok "14/14 superpowers skills OK"
  PASS=$((PASS+1))
else
  err "Solo $ACTUAL/14 superpowers skills instaladas"
  FAIL=$((FAIL+1))
fi

# ─── 5. MCP servers ───
section "5. MCP servers"
if [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
  if command -v yq >/dev/null 2>&1; then
    mcp_count=$(yq '.mcp_servers | length' "$HOME_DIR/.hermes/config.yaml" 2>/dev/null || echo "0")
    if [ "$mcp_count" -gt 0 ]; then
      ok "MCP servers configurados: $mcp_count"
      PASS=$((PASS+1))
    else
      err "MCP servers = 0 (regenerar config)"
      FAIL=$((FAIL+1))
    fi
  else
    warn "yq no instalado, no puedo contar MCP servers"
  fi
else
  err "~/.hermes/config.yaml no existe"
  FAIL=$((FAIL+1))
fi

# ─── 6. Oh My Zsh + Powerlevel10k ───
section "6. Shell (Oh My Zsh + Powerlevel10k)"
if [ -d "$HOME_DIR/.oh-my-zsh" ]; then
  ok "Oh My Zsh instalado"
  PASS=$((PASS+1))
else
  err "Oh My Zsh no instalado"
  FAIL=$((FAIL+1))
fi
if [ -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  ok "Powerlevel10k instalado"
  PASS=$((PASS+1))
else
  err "Powerlevel10k no instalado"
  FAIL=$((FAIL+1))
fi

# ─── 7. Warp (opcional) ───
section "7. Warp (opcional)"
if [ -d "/Applications/Warp.app" ]; then
  if defaults read dev.warp.Warp-Stable font_family 2>/dev/null | grep -q "CaskaydiaCove"; then
    ok "Warp con CaskaydiaCove Nerd Font"
    PASS=$((PASS+1))
  else
    warn "Warp instalado pero font no configurada (puede ser OK)"
  fi
else
  warn "Warp no instalado (puede ser OK si usas otro terminal)"
fi

# ─── 8. Brew packages ───
section "8. Brew packages (verifica que brew funciona)"
# Lista de packages que el AI-OS asume via brew (ajustar según tu stack)
# Nota: git/gh/python/node suelen venir con macOS/Xcode CLI, no siempre via brew.
BREW_PACKAGES=("uv" "yq" "warp")
INSTALLED=0
for pkg in "${BREW_PACKAGES[@]}"; do
  if brew list 2>/dev/null | grep -qE "(^|/)$pkg(\s|$)"; then
    ok "  $pkg instalado via brew"
    INSTALLED=$((INSTALLED+1))
  else
    warn "  $pkg NO instalado via brew (puede estar en otro lado)"
  fi
done
if [ "$INSTALLED" -gt 0 ]; then
  ok "brew funciona ($INSTALLED/${#BREW_PACKAGES[@]} packages instalados)"
  PASS=$((PASS+1))
else
  warn "ningún package vía brew detectado — pero puede estar OK si usás system packages"
fi

# ─── Resumen ───
section "Resumen"
echo ""
log "Pasados: $PASS"
if [ "$FAIL" -gt 0 ]; then
  err "Fallados: $FAIL"
  exit 1
else
  ok "Fallados: 0"
  echo ""
  ok "AI-OS está correctamente instalado. 🎉"
  exit 0
fi
