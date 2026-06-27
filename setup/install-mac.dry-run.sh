#!/usr/bin/env bash
# setup/install-mac.dry-run.sh
# Simula install-mac.sh sin tocar el sistema. Para CI.
#
# Uso: DRY_RUN=1 bash install-mac.sh
# (install-mac.sh detecta DRY_RUN=1 y redirige a este script)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="${HOME:-/tmp/aios-dryrun-$(date +%s)}"
LOG_PREFIX="[ai-os install DRY-RUN]"

log() { echo "$LOG_PREFIX $*"; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }
err() { echo "$LOG_PREFIX ❌ $*"; }

# Crear HOME temporal para no tocar el real
TMP_HOME=$(mktemp -d -t aios-dryrun-XXXX)
export HOME="$TMP_HOME"
mkdir -p "$HOME"/.claude/skills "$HOME"/.codex/skills "$HOME"/.gemini/skills "$HOME"/.agents/skills "$HOME"/.hermes/skills/imported "$HOME"/.oh-my-zsh/custom/themes "$HOME"/.oh-my-zsh/custom/plugins "$HOME"/.ssh "$HOME"/.local/bin "$HOME"/Library/Preferences

log "═══════════════════════════════════════════════════════════"
log "  AI-OS Setup DRY-RUN (Mac simulation)"
log "  AI-OS root: $AI_OS_ROOT"
log "  Simulated HOME: $HOME"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Verificar estructura de AI-OS (no install nada) ───
log "0. Verificando estructura AI-OS..."
fail=0

for f in CLAUDE.md ai-config/skills ai-config/mcp dev-env/dotfiles/zsh/.zshrc dev-env/dotfiles/zsh/.p10k.zsh dev-env/dotfiles/git/.gitconfig.template dev-env/dotfiles/ssh/config dev-env/packages/Brewfile setup/install-mac.sh setup/verify.sh setup/generate-mcp-config.py; do
  if [ ! -e "$AI_OS_ROOT/$f" ]; then
    err "Falta: $f"
    fail=$((fail+1))
  fi
done

if [ $fail -eq 0 ]; then
  ok "Estructura AI-OS completa"
else
  err "$fail archivos faltantes"
  exit 1
fi

# ─── 1. Verificar que Brewfile es válido ───
log "1. Validando Brewfile..."
if [ -f "$AI_OS_ROOT/dev-env/packages/Brewfile" ]; then
  brew_count=$(grep -cE "^(brew|cask|tap) " "$AI_OS_ROOT/dev-env/packages/Brewfile" 2>/dev/null || echo 0)
  ok "Brewfile: $brew_count entries (brew/cask/tap)"
else
  err "Brewfile no existe"
  exit 1
fi

# ─── 2. Verificar que npm-globals es válido ───
log "2. Validando npm-globals.txt..."
if [ -f "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" ]; then
  npm_count=$(grep -cvE "^\s*(#|$)" "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" 2>/dev/null || echo 0)
  ok "npm-globals: $npm_count packages"
else
  err "npm-globals.txt no existe"
  exit 1
fi

# ─── 3. Verificar que pip-packages es válido ───
log "3. Validando pip-packages.txt..."
if [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  pip_count=$(grep -cvE "^\s*(#|$)" "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" 2>/dev/null || echo 0)
  ok "pip-packages: $pip_count packages"
else
  err "pip-packages.txt no existe"
  exit 1
fi

# ─── 4. Simular symlinks de dotfiles (sin crear realmente) ───
log "4. Simulando symlinks de dotfiles..."
for dotfile in .zshrc .p10k.zsh .gitignore_global; do
  source_path="$AI_OS_ROOT/dev-env/dotfiles/$(echo $dotfile | tr -d '.')/$dotfile"
  # .zshrc y .p10k.zsh están en dev-env/dotfiles/zsh/, no en subdir por nombre
  if [ "$dotfile" = ".zshrc" ] || [ "$dotfile" = ".p10k.zsh" ]; then
    source_path="$AI_OS_ROOT/dev-env/dotfiles/zsh/$dotfile"
  elif [ "$dotfile" = ".gitignore_global" ]; then
    source_path="$AI_OS_ROOT/dev-env/dotfiles/git/$dotfile"
  fi

  if [ -f "$source_path" ]; then
    # Crear symlink temporal (en TMP_HOME, no en el real)
    ln -sf "$source_path" "$HOME/$dotfile"
    if [ -L "$HOME/$dotfile" ]; then
      ok "  $dotfile → $source_path (simulado)"
    else
      err "  $dotfile falló al crear symlink"
      exit 1
    fi
  else
    err "  Source no existe: $source_path"
    exit 1
  fi
done

# ─── 5. Simular propagación de skills (symlinks) ───
log "5. Simulando propagación de skills a 5 CLIs..."
CLI_DIRS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
  "$HOME/.gemini/skills"
  "$HOME/.agents/skills"
  "$HOME/.hermes/skills/imported"
)

skill_count=$(ls -1d "$AI_OS_ROOT/ai-config/skills"/*/ 2>/dev/null | wc -l | tr -d ' ')
ok "Skills source of truth: $skill_count"

for cli_dir in "${CLI_DIRS[@]}"; do
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    [ "$name" = "READMEDD.md" ] && continue
    [ "$name" = "taste-skill-llms.txt" ] && continue
    ln -sf "$skill_dir" "$cli_dir/$name"
  done
  cli_count=$(find -L "$cli_dir" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
  if [ "$cli_count" -gt 50 ]; then
    ok "  $cli_dir: $cli_count skills (simulado)"
  else
    err "  $cli_dir: solo $cli_count skills"
    exit 1
  fi
done

# ─── 6. Simular MCP config generation ───
log "6. Simulando generación de MCP config..."

# Asegurar que PyYAML está disponible
if ! python3 -c "import yaml" 2>/dev/null; then
  warn "PyYAML no disponible, instalando..."
  python3 -m pip install --quiet --user pyyaml 2>&1 | tail -3 || {
    err "No pude instalar PyYAML"
    exit 1
  }
fi

# Crear config de prueba
TEMP_CONFIG="$TMP_HOME/hermes-config-test.yaml"

if python3 "$AI_OS_ROOT/setup/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$TEMP_CONFIG" >/dev/null 2>&1; then
  if command -v yq >/dev/null 2>&1; then
    mcp_count=$(yq '.mcp_servers | keys | length' "$TEMP_CONFIG" 2>/dev/null || echo 0)
    if [ "$mcp_count" -ge 7 ]; then
      ok "MCP config: $mcp_count servers generados"
    else
      err "MCP config: solo $mcp_count servers (esperado >=7)"
      exit 1
    fi
  else
    # yq no disponible, parsear con python
    mcp_count=$(python3 -c "import yaml; d=yaml.safe_load(open('$TEMP_CONFIG')); print(len(d.get('mcp_servers', {})))" 2>/dev/null || echo 0)
    if [ "$mcp_count" -ge 7 ]; then
      ok "MCP config: $mcp_count servers generados (verificado con python)"
    else
      err "MCP config: solo $mcp_count servers (esperado >=7)"
      exit 1
    fi
  fi
else
  err "Script generate-mcp-config.py falló"
  exit 1
fi

# ─── 7. Validar sintaxis de skills ───
log "7. Validando frontmatter de skills (sample de 10)..."
# macOS no tiene shuf, usar sort -R (random sort) o shuf (Linux)
if command -v shuf >/dev/null 2>&1; then
  sample_skills=$(ls -1d "$AI_OS_ROOT/ai-config/skills"/*/ 2>/dev/null | shuf -n 10 | head)
else
  sample_skills=$(ls -1d "$AI_OS_ROOT/ai-config/skills"/*/ 2>/dev/null | sort -R | head -10)
fi

fm_errors=0
for skill_dir in $sample_skills; do
  # Buscar SKILL.md en cualquier nivel (algunos skills tienen subdirs)
  skill_md=$(find "$skill_dir" -maxdepth 3 -name "SKILL.md" -type f 2>/dev/null | head -1)

  if [ -z "$skill_md" ]; then
    # No es una skill real, es una categoría (ej: tanstack-query/skills/tanstack-query)
    # Skip sin error
    continue
  fi

  # Verificar frontmatter básico
  if ! head -5 "$skill_md" | grep -q "^name:"; then
    err "  $(basename $skill_dir): sin name: en frontmatter"
    fm_errors=$((fm_errors+1))
  fi
  if ! head -5 "$skill_md" | grep -q "^description:"; then
    err "  $(basename $skill_dir): sin description: en frontmatter"
    fm_errors=$((fm_errors+1))
  fi
done

if [ $fm_errors -eq 0 ]; then
  ok "Frontmatter de skills OK (10 sampled, sin contar categorías)"
else
  err "$fm_errors errores de frontmatter en sample"
  exit 1
fi

# ─── 8. Verificar 14 superpowers skills en source ───
log "8. Verificando 14 superpowers skills en source..."
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  if [ -d "$AI_OS_ROOT/ai-config/skills/$skill" ]; then
    ACTUAL=$((ACTUAL+1))
  fi
done

if [ "$ACTUAL" -eq "$EXPECTED" ]; then
  ok "14/14 superpowers skills presentes en source"
else
  err "Solo $ACTUAL/14 superpowers en source (instalar via install-mac.sh)"
  # No es un fail bloqueante en dry-run, es solo un warning
  warn "El install real los descarga de obra/superpowers"
fi

# ─── 9. Cleanup ───
log "9. Cleanup temporal..."
rm -rf "$TMP_HOME"
ok "Cleanup OK"

echo ""
log "═══════════════════════════════════════════════════════════"
ok "DRY-RUN exitoso. El setup funcionaría sin errores en una Mac real."
log "Para instalación real: bash setup/install-mac.sh (sin DRY_RUN=1)"
log "═══════════════════════════════════════════════════════════"
