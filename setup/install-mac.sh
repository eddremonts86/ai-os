#!/usr/bin/env bash
# setup/install-mac.sh
# Setup AI-OS en Mac desde cero. 1-comando.
#
# Uso:
#   git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
#   cd ~/Projects/ai-os
#   bash setup/install-mac.sh
#
# Idempotente: corre múltiples veces sin romper nada.
# Opciones (env vars):
#   SKIP_BREW=1      → no instalar packages de brew
#   SKIP_NPM=1       → no instalar packages de npm
#   SKIP_DOTFILES=1  → no crear symlinks de dotfiles
#   SKIP_MCP=1       → no regenerar config de MCP
#   SKIP_VERIFY=1    → no correr tests de verificación al final

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install]"

# ─── Logging ───
log() { echo "$LOG_PREFIX $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }

# ─── Header ───
log "═══════════════════════════════════════════════════════════"
log "  AI-OS Setup (Mac)"
log "  Source: $AI_OS_ROOT"
log "  Target: $HOME_DIR"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Prereqs ───
log "0. Verificando prerequisites..."

command -v git >/dev/null || { err "git no instalado. Instala Xcode CLI Tools: xcode-select --install"; exit 1; }
command -v brew >/dev/null || {
  err "Homebrew no instalado."
  log "Instálalo con:"
  log '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
}
command -v gh >/dev/null || { err "gh (GitHub CLI) no instalado. brew install gh"; exit 1; }
command -v yq >/dev/null || { warn "yq no instalado, instalando con brew..."; brew install yq; }

ok "Prerequisites OK"
echo ""

# ─── 1. Brew packages ───
if [ "${SKIP_BREW:-0}" != "1" ]; then
  log "1. Instalando Brew packages (puede tardar 5-15 min)..."
  cd "$AI_OS_ROOT"
  brew bundle install --file=dev-env/packages/Brewfile --verbose
  ok "Brew packages instalados"
else
  log "1. SKIP_BREW=1, saltando brew"
fi
echo ""

# ─── 2. Fonts ───
log "2. Verificando Nerd Fonts..."
CASKE_FONT="$HOME/Library/Fonts/CaskaydiaCoveNerdFont-Regular.ttf"
if [ ! -f "$CASKE_FONT" ]; then
  warn "CaskaydiaCove Nerd Font no instalado. Instalando..."
  brew install --cask font-caskaydia-cove-nerd-font
else
  ok "CaskaydiaCove Nerd Font ya instalado"
fi
echo ""

# ─── 3. Symlinks de dotfiles ───
if [ "${SKIP_DOTFILES:-0}" != "1" ]; then
  log "3. Creando symlinks de dotfiles..."

  # zsh
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc" ]; then
    [ -e "$HOME_DIR/.zshrc" ] && [ ! -L "$HOME_DIR/.zshrc" ] && mv "$HOME_DIR/.zshrc" "$HOME_DIR/.zshrc.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.zshrc" "$HOME_DIR/.zshrc"
    ok "  .zshrc → ai-os"
  fi
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh" ]; then
    [ -e "$HOME_DIR/.p10k.zsh" ] && [ ! -L "$HOME_DIR/.p10k.zsh" ] && mv "$HOME_DIR/.p10k.zsh" "$HOME_DIR/.p10k.zsh.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/zsh/.p10k.zsh" "$HOME_DIR/.p10k.zsh"
    ok "  .p10k.zsh → ai-os"
  fi

  # git (template + work/personal)
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/git/.gitconfig.template" ]; then
    if [ ! -e "$HOME_DIR/.gitconfig" ]; then
      cp "$AI_OS_ROOT/dev-env/dotfiles/git/.gitconfig.template" "$HOME_DIR/.gitconfig"
      # Set git identity from env if provided
      if [ -n "${GIT_USER_NAME:-}" ]; then
        git config --global user.name "$GIT_USER_NAME"
      fi
      if [ -n "${GIT_USER_EMAIL:-}" ]; then
        git config --global user.email "$GIT_USER_EMAIL"
      fi
      ok "  .gitconfig → template (customize: git config --global user.name/email)"
    else
      ok "  .gitconfig ya existe, no se sobreescribe"
    fi
  fi
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/git/.gitignore_global" ]; then
    [ -e "$HOME_DIR/.gitignore_global" ] && [ ! -L "$HOME_DIR/.gitignore_global" ] && mv "$HOME_DIR/.gitignore_global" "$HOME_DIR/.gitignore_global.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/git/.gitignore_global" "$HOME_DIR/.gitignore_global"
    git config --global core.excludesfile "$HOME_DIR/.gitignore_global" 2>/dev/null || true
    ok "  .gitignore_global → ai-os"
  fi

  # ssh
  if [ -f "$AI_OS_ROOT/dev-env/dotfiles/ssh/config" ]; then
    mkdir -p "$HOME_DIR/.ssh"
    chmod 700 "$HOME_DIR/.ssh"
    [ -e "$HOME_DIR/.ssh/config" ] && [ ! -L "$HOME_DIR/.ssh/config" ] && mv "$HOME_DIR/.ssh/config" "$HOME_DIR/.ssh/config.pre-aios.bak"
    ln -sf "$AI_OS_ROOT/dev-env/dotfiles/ssh/config" "$HOME_DIR/.ssh/config"
    chmod 600 "$HOME_DIR/.ssh/config"
    ok "  .ssh/config → ai-os"
  fi
else
  log "3. SKIP_DOTFILES=1, saltando dotfiles"
fi
echo ""

# ─── 4. Oh My Zsh + Powerlevel10k ───
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
  log "4. Instalando Oh My Zsh..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 2>&1 | tail -3
  ok "Oh My Zsh instalado"
else
  ok "Oh My Zsh ya instalado"
fi

if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  log "   Instalando Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/themes/powerlevel10k" 2>&1 | tail -2
  ok "   Powerlevel10k instalado"
fi

# Plugins adicionales
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/plugins/$plugin" ]; then
    log "   Instalando plugin: $plugin"
    git clone --depth=1 "https://github.com/zsh-users/$plugin" \
      "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/plugins/$plugin" 2>&1 | tail -1
  fi
done
ok "Oh My Zsh + plugins OK"
echo ""

# ─── 5. Skills globales (symlinks) ───
log "5. Seteando skills globales en 5 CLIs..."

for cli_dir in "$HOME_DIR/.claude/skills" "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills"; do
  mkdir -p "$cli_dir"
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    [ "$name" = "READMEDD.md" ] && continue
    [ "$name" = "taste-skill-llms.txt" ] && continue
    [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ] && mv "$cli_dir/$name" "$cli_dir/$name.pre-aios.bak"
    ln -sf "$skill_dir" "$cli_dir/$name"
  done
done
# READMEDD y llms solo en claude/
ln -sf "$AI_OS_ROOT/ai-config/skills/READMEDD.md" "$HOME_DIR/.claude/skills/READMEDD.md" 2>/dev/null || true
ln -sf "$AI_OS_ROOT/ai-config/skills/taste-skill-llms.txt" "$HOME_DIR/.claude/skills/taste-skill-llms.txt" 2>/dev/null || true

# Hermes imported
mkdir -p "$HOME_DIR/.hermes/skills/imported"
for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  [ "$name" = "READMEDD.md" ] && continue
  [ "$name" = "taste-skill-llms.txt" ] && continue
  [ -e "$HOME_DIR/.hermes/skills/imported/$name" ] && [ ! -L "$HOME_DIR/.hermes/skills/imported/$name" ] && mv "$HOME_DIR/.hermes/skills/imported/$name" "$HOME_DIR/.hermes/skills/imported/$name.pre-aios.bak"
  ln -sf "$skill_dir" "$HOME_DIR/.hermes/skills/imported/$name"
done

SKILL_COUNT=$(ls "$AI_OS_ROOT/ai-config/skills/" | wc -l | tr -d ' ')
ok "Skills propagadas a 5 CLIs ($SKILL_COUNT archivos en source)"
echo ""

# ─── 6. Superpowers skills (REQUIRED) ───
log "6. Verificando superpowers skills (REQUIRED)..."
EXPECTED=14
ACTUAL=0
for skill in brainstorming dispatching-parallel-agents executing-plans finishing-a-development-branch receiving-code-review requesting-code-review subagent-driven-development systematic-debugging test-driven-development using-git-worktrees using-superpowers verification-before-completion writing-plans writing-skills; do
  [ -d "$HOME_DIR/.claude/skills/$skill" ] && ACTUAL=$((ACTUAL + 1))
done
if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  warn "Solo $ACTUAL/$EXPECTED superpowers skills instaladas. Instalando..."
  TMP_SP="/tmp/superpowers-aios-$$"
  trap "rm -rf '$TMP_SP'" EXIT
  gh repo clone obra/superpowers "$TMP_SP" -- --depth=1 2>&1 | tail -1
  for skill in "$TMP_SP"/skills/*/; do
    name=$(basename "$skill")
    if [ -d "$skill" ] && [ ! -d "$HOME_DIR/.claude/skills/$name" ]; then
      cp -R "$skill" "$HOME_DIR/.claude/skills/$name"
      # Re-symlink a otros CLIs
      for cli_dir in "$HOME_DIR/.codex/skills" "$HOME_DIR/.gemini/skills" "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/skills/imported"; do
        ln -sf "$HOME_DIR/.claude/skills/$name" "$cli_dir/$name"
      done
    fi
  done
  ok "Superpowers instaladas ($EXPECTED/$EXPECTED)"
else
  ok "Superpowers OK ($ACTUAL/$EXPECTED)"
fi
echo ""

# ─── 7. MCP servers (regenerar ~/.hermes/config.yaml) ───
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "7. Configurando MCP servers desde ai-config/mcp/*.yaml..."

  # Generar bloque mcp_servers para ~/.hermes/config.yaml
  MCP_YAMLS=()
  for yaml in "$AI_OS_ROOT/ai-config/mcp"/*.yaml; do
    [ -f "$yaml" ] || continue
    MCP_YAMLS+=("$yaml")
  done

  # Si ~/.hermes/config.yaml existe, hacer backup
  if [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
    cp "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.hermes/config.yaml.pre-aios.bak"
  fi
  mkdir -p "$HOME_DIR/.hermes"

  # Generar mcp_servers block con script Python standalone (que también sirve para Windows)
  if command -v python3 >/dev/null 2>&1; then
    python3 "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  elif command -v python >/dev/null 2>&1; then
    python "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  else
    warn "Python no encontrado, no puedo generar config MCP automáticamente"
  fi
fi
echo ""

# ─── 8. Warp defaults (Mac only) ───
if [ "${SKIP_WARP:-0}" != "1" ] && [ -d "/Applications/Warp.app" ]; then
  log "8. Configurando Warp defaults..."
  defaults write dev.warp.Warp-Stable font_family -string "CaskaydiaCove Nerd Font"
  defaults write dev.warp.Warp-Stable font_size -int 14
  defaults write dev.warp.Warp-Stable line_height -float 1.4
  defaults write dev.warp.Warp-Stable theme -string "dark"
  defaults write dev.warp.Warp-Stable window_opacity -float 0.95
  defaults write dev.warp.Warp-Stable cursor_blink -bool true
  defaults write dev.warp.Warp-Stable cursor_shape -string "beam"
  ok "Warp configurado (theme dark, font CaskaydiaCove Nerd 14)"
else
  log "8. SKIP_WARP=1 o Warp no instalado, saltando"
fi
echo ""

# ─── 9. Terminal.app defaults (Mac only) ───
if [ -d "/Applications/Utilities/Terminal.app" ]; then
  log "9. Configurando Terminal.app defaults..."
  plutil -replace "Default Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  plutil -replace "Startup Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  defaults write com.apple.Terminal Shell -string "/bin/zsh"
  ok "Terminal.app theme = Pro, shell = /bin/zsh"
fi
echo ""

# ─── 10. Reload shell ───
log "10. Reload zsh..."
# Recargar shell solo si es interactivo
if [ -n "${PS1:-}" ]; then
  exec zsh
else
  ok "zsh (reload manual: exec zsh o abrir nueva terminal)"
fi
echo ""

# ─── 11. Verificación final ───
if [ "${SKIP_VERIFY:-0}" != "1" ]; then
  log "11. Verificación final..."
  bash "$SCRIPT_DIR/verify.sh"
fi

echo ""
log "═══════════════════════════════════════════════════════════"
ok "AI-OS setup completo!"
log ""
log "Próximos pasos:"
log "  1. exec zsh (o abrir nueva terminal)"
log "  2. Probar: hermes chat --skills ai-os-quickstart"
log "  3. Customizar ~/.gitconfig con tu email: git config --global user.name/email"
log "═══════════════════════════════════════════════════════════"
