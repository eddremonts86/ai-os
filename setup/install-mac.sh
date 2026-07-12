#!/usr/bin/env bash
# setup/install-mac.sh
# Setup AI-OS on Mac from zero. 1-command.
#
# Usage:
#   git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
#   cd ~/Projects/ai-os
#   bash setup/install-mac.sh
#
# Idempotent: runs multiple times without breaking anything.
# Options (env vars):
#   SKIP_BREW=1      → skip brew packages
#   SKIP_NPM=1       → skip npm packages
#   SKIP_PIP=1       → skip Python user packages
#   SKIP_DOTFILES=1  → skip dotfile symlinks
#   SKIP_MCP=1       → skip MCP config regeneration
#   SKIP_VERIFY=1    → skip verification at the end
#   DRY_RUN=1        → simulate without executing (CI mode)

set -euo pipefail

# ─── Paths ───
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
HOME_DIR="$HOME"
LOG_PREFIX="[ai-os install]"
MANIFEST="$AI_OS_ROOT/ai-config/manifest.yaml"
ADAPTER_TEMPLATE="$AI_OS_ROOT/ai-config/templates/global-bridge.md.tmpl"

# ─── Logging ───
log() { echo "$LOG_PREFIX $*"; }
err() { echo "$LOG_PREFIX ❌ $*" >&2; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }

require_manifest_tool() {
  command -v yq >/dev/null 2>&1 || { err "yq is required to read $MANIFEST"; exit 1; }
  [ -f "$MANIFEST" ] || { err "Manifest missing: $MANIFEST"; exit 1; }
}

preserve_or_replace() {
  local target="$1"
  if [ -e "$target" ] && [ ! -L "$target" ] && [ "${REPLACE_EXISTING:-0}" != "1" ]; then
    warn "Preserving existing $target (set REPLACE_EXISTING=1 to replace it)"
    return 1
  fi
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$target.pre-aios.bak"
  fi
  return 0
}

# ─── DRY_RUN mode (CI) ───
if [ "${DRY_RUN:-0}" = "1" ]; then
  exec bash "$SCRIPT_DIR/install-mac.dry-run.sh"
fi

# ─── Header ───
log "═══════════════════════════════════════════════════════════"
log "  AI-OS Setup (Mac)"
log "  Source: $AI_OS_ROOT"
log "  Target: $HOME_DIR"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Prereqs ───
log "0. Verifying prerequisites..."

command -v git >/dev/null || { err "git not installed. Install Xcode CLI Tools: xcode-select --install"; exit 1; }
command -v brew >/dev/null || {
  err "Homebrew not installed."
  log "Install it with:"
  log '  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit 1
}
command -v gh >/dev/null || { err "gh (GitHub CLI) not installed. brew install gh"; exit 1; }
command -v yq >/dev/null || { warn "yq not installed, installing with brew..."; brew install yq; }

ok "Prerequisites OK"
echo ""

# ─── 1. Brew packages ───
if [ "${SKIP_BREW:-0}" != "1" ]; then
  log "1. Installing Brew packages (may take 5-15 min)..."
  cd "$AI_OS_ROOT"
  brew bundle install --file=dev-env/packages/Brewfile --verbose
  ok "Brew packages installed"
else
  log "1. SKIP_BREW=1, skipping brew"
fi
echo ""

# ─── 2. npm global packages ───
if [ "${SKIP_NPM:-0}" != "1" ]; then
  log "2. Installing npm globals from dev-env/packages/npm-globals.txt..."
  if command -v npm >/dev/null 2>&1; then
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      npm install -g "$pkg"
    done < "$AI_OS_ROOT/dev-env/packages/npm-globals.txt"
    ok "npm globals installed"
  else
    warn "npm not found; skipping npm globals"
  fi
else
  log "2. SKIP_NPM=1, skipping npm globals"
fi
echo ""

# ─── 3. Python user packages ───
if [ "${SKIP_PIP:-0}" != "1" ]; then
  log "3. Installing Python user packages from dev-env/packages/pip-packages.txt..."
  if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD=python3
  elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD=python
  else
    PYTHON_CMD=""
  fi

  if [ -n "$PYTHON_CMD" ]; then
    while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
      pkg="${raw_pkg%%#*}"
      pkg="$(printf '%s' "$pkg" | xargs)"
      [ -z "$pkg" ] && continue
      "$PYTHON_CMD" -m pip install --user "$pkg"
    done < "$AI_OS_ROOT/dev-env/packages/pip-packages.txt"
    ok "Python user packages installed"
  else
    warn "Python not found; skipping Python user packages"
  fi
else
  log "3. SKIP_PIP=1, skipping Python user packages"
fi
echo ""

# ─── 4. Fonts ───
log "4. Verifying Nerd Fonts..."
CASKE_FONT="$HOME/Library/Fonts/CaskaydiaCoveNerdFont-Regular.ttf"
if [ ! -f "$CASKE_FONT" ]; then
  warn "CaskaydiaCove Nerd Font not installed. Installing..."
  brew install --cask font-caskaydia-cove-nerd-font
else
  ok "CaskaydiaCove Nerd Font already installed"
fi
echo ""

# ─── 5. Symlinks for dotfiles ───
if [ "${SKIP_DOTFILES:-0}" != "1" ]; then
  log "5. Creating dotfiles symlinks..."

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
      ok "  .gitconfig already exists, not overwriting"
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
  log "5. SKIP_DOTFILES=1, skipping dotfiles"
fi
echo ""

# ─── 6. Oh My Zsh + Powerlevel10k ───
# Pinned refs (P1-4): Oh My Zsh has no version tags, so pin a specific commit
# SHA instead of the mutable `master` branch. Bump deliberately after review,
# e.g.: curl -s https://api.github.com/repos/ohmyzsh/ohmyzsh/commits/master
OHMYZSH_REF="677a4592b18c08ddea737f8aca70bac0e9fc9313"
P10K_TAG="v1.20.0"
ZSH_AUTOSUGGESTIONS_TAG="v0.7.1"
ZSH_SYNTAX_HIGHLIGHTING_TAG="0.8.0"
ZSH_COMPLETIONS_TAG="0.36.0"
if [ ! -d "$HOME_DIR/.oh-my-zsh" ]; then
  log "6. Installing Oh My Zsh (pinned to commit ${OHMYZSH_REF:0:12})..."
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/${OHMYZSH_REF}/tools/install.sh")" 2>&1 | tail -3
  ok "Oh My Zsh installed"
else
  ok "Oh My Zsh already installed"
fi

if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  log "   Installing Powerlevel10k (${P10K_TAG})..."
  git clone --depth=1 --branch "$P10K_TAG" https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/themes/powerlevel10k" 2>&1 | tail -2
  ok "   Powerlevel10k installed"
fi

# Additional plugins (pinned tags, not the default branch)
declare -A ZSH_PLUGIN_TAGS=(
  [zsh-autosuggestions]="$ZSH_AUTOSUGGESTIONS_TAG"
  [zsh-syntax-highlighting]="$ZSH_SYNTAX_HIGHLIGHTING_TAG"
  [zsh-completions]="$ZSH_COMPLETIONS_TAG"
)
for plugin in zsh-autosuggestions zsh-syntax-highlighting zsh-completions; do
  if [ ! -d "$HOME_DIR/.oh-my-zsh/custom/plugins/$plugin" ]; then
    plugin_tag="${ZSH_PLUGIN_TAGS[$plugin]}"
    log "   Installing plugin: $plugin (${plugin_tag})"
    git clone --depth=1 --branch "$plugin_tag" "https://github.com/zsh-users/$plugin" \
      "${ZSH_CUSTOM:-$HOME_DIR/.oh-my-zsh/custom}/plugins/$plugin" 2>&1 | tail -1
  fi
done
ok "Oh My Zsh + plugins OK"
echo ""

# ─── 7. Global skills (native destinations from manifest) ───
require_manifest_tool
log "7. Setting global skills in native client destinations..."
# Only flat skills (a dir with a top-level SKILL.md) are symlinked here. Plugin
# bundles in ai-config/skills/ that have a NESTED layout (claude.tools, ECC) are
# installed by their own scripts (install-claude-tools.sh, install-ecc.sh).
#   Claude ~/.claude/skills | Codex ~/.codex/skills | Gemini ~/.gemini/skills
#   Antigravity ~/.agents/skills | Hermes ~/.hermes/skills/imported
#   MiniMax Code ~/.minimax/skills (global skills.paths entry in opencode.json)
while IFS=$'\t' read -r client_id client_path client_required; do
  cli_dir="$HOME_DIR/$client_path"
  mkdir -p "$cli_dir"
  # Prune stale ai-os symlinks whose target no longer has a top-level SKILL.md
  # (e.g. a plugin bundle wrongly linked by an older run). Keeps re-runs clean.
  for link in "$cli_dir"/*; do
    [ -L "$link" ] || continue
    tgt=$(readlink "$link")
    case "$tgt" in
      *"/ai-config/skills/"*) [ -f "${tgt%/}/SKILL.md" ] || rm -f "$link" ;;
    esac
  done
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    name=$(basename "$skill_dir")
    if [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ]; then
      preserve_or_replace "$cli_dir/$name" || continue
    fi
    ln -sfn "$skill_dir" "$cli_dir/$name"
  done
done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")

SKILL_COUNT=$(find "$AI_OS_ROOT/ai-config/skills" -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" | wc -l | tr -d ' ')
ok "Skills propagated to manifest client destinations ($SKILL_COUNT flat skills in source)"
echo ""

# ─── 7c. Vendored gstack skills (read-only subtree at vendor/gstack/) ───
# Mirrors the ECC pattern: optional, third-party, propagated to the same 6 CLIs.
# Currently inlines 3 skills (spec, context-save, context-restore). Refresh with:
#   git -C "$AI_OS_ROOT/vendor/gstack" pull  (when an upstream is configured)
if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
  log "7c. Setting vendored gstack skills in 6 CLIs..."
  GSTACK_COUNT=0
  while IFS=$'\t' read -r client_id client_path client_required; do
    cli_dir="$HOME_DIR/$client_path"
    mkdir -p "$cli_dir"
    # Prune stale gstack symlinks whose target is gone.
    for link in "$cli_dir"/*; do
      [ -L "$link" ] || continue
      tgt=$(readlink "$link")
      case "$tgt" in
        *"/vendor/gstack/"*) [ -f "${tgt%/}/SKILL.md" ] || rm -f "$link" ;;
      esac
    done
    for skill_dir in "$AI_OS_ROOT/vendor/gstack"/*/; do
      [ -f "$skill_dir/SKILL.md" ] || continue
      name=$(basename "$skill_dir")
      if [ -e "$cli_dir/$name" ] && [ ! -L "$cli_dir/$name" ]; then
        preserve_or_replace "$cli_dir/$name" || continue
      fi
      ln -sfn "$skill_dir" "$cli_dir/$name"
    done
  done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")
  GSTACK_COUNT=$(find "$AI_OS_ROOT/vendor/gstack" -maxdepth 2 -name SKILL.md -path "*/vendor/gstack/*/SKILL.md" | wc -l | tr -d ' ')
  ok "Vendored gstack skills propagated ($GSTACK_COUNT skills in source)"
else
  log "7c. vendor/gstack/ absent, skipping"
fi
echo ""

# ─── 7b. Rendered instruction adapters ───
log "7b. Rendering path-neutral instruction adapters..."
[ -f "$ADAPTER_TEMPLATE" ] || { err "Adapter template missing: $ADAPTER_TEMPLATE"; exit 1; }
ADAPTER_DIR="$HOME_DIR/.ai-os/adapters"
mkdir -p "$ADAPTER_DIR"
BRIDGE="$ADAPTER_DIR/global-bridge.md"
sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$ADAPTER_TEMPLATE" > "$BRIDGE"
while IFS=$'\t' read -r adapter_id adapter_path adapter_required; do
  target="$HOME_DIR/$adapter_path"
  mkdir -p "$(dirname "$target")"
  preserve_or_replace "$target" || continue
  ln -sfn "$BRIDGE" "$target"
done < <(yq -r '.platforms.macos.adapters[] | [.id, .path, .required] | @tsv' "$MANIFEST")
# Hermes is optional: only amend an existing SOUL.md and never replace it.
SOUL="$HOME_DIR/.hermes/SOUL.md"
HERMES_TEMPLATE="$AI_OS_ROOT/ai-config/templates/hermes-soul-block.md.tmpl"
if [ -f "$SOUL" ] && ! grep -q "AI-OS BRIDGE" "$SOUL"; then
  sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$HERMES_TEMPLATE" >> "$SOUL"
fi
# MiniMax Code (mavis, opencode-based): each agent's agent.md is appended to the
# system prompt at runtime. Overwrite the stub with the AI-OS overlay (real file,
# not a symlink — mavis re-seeds this path).
MM_OVERLAY="$AI_OS_ROOT/ai-config/clis/minimax-overlay.md"
if [ "${MODIFY_OPTIONAL_INTEGRATIONS:-0}" = "1" ] && [ -d "$HOME_DIR/.minimax/agents" ] && [ -f "$MM_OVERLAY" ]; then
  for agent_dir in "$HOME_DIR/.minimax/agents"/*/; do
    [ -d "$agent_dir" ] && cp "$MM_OVERLAY" "$agent_dir/agent.md"
  done
fi
# VS Code (GitHub Copilot Chat): unlike the 6 CLIs above, Copilot Chat already
# discovers ~/.agents/skills on this Mac by whatever mechanism backs its custom
# chat mode, so no skill-symlink step is needed here. It only needs the bridge
# block, appended (idempotent) to its global custom-instructions file — the
# `applyTo: '**'` frontmatter makes it load on every request in every workspace,
# same role as CLAUDE.md/AGENTS.md/GEMINI.md for the other CLIs. The file lives
# under a per-account subfolder we can't predict, so glob for it; best-effort,
# never fails the install if VS Code / Copilot Chat isn't set up on this Mac.
VSCODE_INSTR_GLOBS=(
  "$HOME_DIR/Library/Application Support/Code/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
  "$HOME_DIR/Library/Application Support/Code - Insiders/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"
)
VSCODE_WIRED=0
for f in "${VSCODE_INSTR_GLOBS[@]}"; do
  [ -f "$f" ] || continue
  if [ "${MODIFY_OPTIONAL_INTEGRATIONS:-0}" = "1" ] && ! grep -q "AI-OS BRIDGE" "$f"; then
    cat >> "$f" <<AIOS_VSCODE

<!-- AI-OS BRIDGE — managed by $AI_OS_ROOT; remove this block to unlink -->
- AI-OS (operating context): single source of truth is \`$AI_OS_ROOT\`. For non-trivial work, read \`context/00_profile.md\`, \`context/03_preferences.md\`, and \`CLAUDE.md\` from that repo before proceeding.
- Method: Spec → Verifier → Environment (Karpathy loop). Use the \`using-superpowers\` skill as the router for EVERY task, even simple ones — check whether a skill applies before responding, not just for domain-specific work.
- Chat in Spanish (lowercase, terse, no ceremony, no "espero que esto ayude"). Code, commits, docs, comments, and logs stay in English always.
- Verify before claiming something is done: run the actual checks (tests/build/typecheck/browser) and report concrete evidence, never "looks fine" without proof.
- Confirm before irreversible or outward-facing actions (force-push, prod changes, sending messages, spending money) unless already explicitly authorized.
- Durable, cross-session facts go in this environment's own memory tool (\`/memories/\`); sync notable, cross-CLI-relevant facts back into \`context/\` in the ai-os repo so Claude Code/Hermes/Codex/Gemini benefit too.
<!-- /AI-OS BRIDGE -->
AIOS_VSCODE
  fi
  VSCODE_WIRED=$((VSCODE_WIRED + 1))
done
ok "Required instruction adapters rendered from manifest"
[ "$VSCODE_WIRED" -gt 0 ] || warn "VS Code Copilot Chat adapter skipped (optional integration absent)"
echo ""

# ─── 8. Superpowers skills (REQUIRED) ───
log "8. Verifying superpowers skills (REQUIRED)..."
EXPECTED=$(yq '.required_skills | length' "$MANIFEST")
ACTUAL=0
while IFS= read -r skill; do
  [ -d "$HOME_DIR/.claude/skills/$skill" ] && ACTUAL=$((ACTUAL + 1))
done < <(yq -r '.required_skills[]' "$MANIFEST")
if [ "$ACTUAL" -ne "$EXPECTED" ]; then
  warn "Only $ACTUAL/$EXPECTED superpowers skills installed. Linking from local source..."
  # The 14 superpowers are vendored in ai-config/skills/ (committed to this repo),
  # so link from there — no network dependency on obra/superpowers.
  while IFS= read -r skill; do
    src="$AI_OS_ROOT/ai-config/skills/$skill"
    if [ ! -d "$src" ]; then
      err "Superpower '$skill' missing from $AI_OS_ROOT/ai-config/skills — repo is incomplete, re-clone it"
      exit 1
    fi
    while IFS=$'\t' read -r client_id client_path client_required; do
      cli_dir="$HOME_DIR/$client_path"
      mkdir -p "$cli_dir"
      [ -e "$cli_dir/$skill" ] || ln -sfn "$src" "$cli_dir/$skill"
    done < <(yq -r '.platforms.macos.skills.clients[] | select(.required) | [.id, .path, .required] | @tsv' "$MANIFEST")
  done < <(yq -r '.required_skills[]' "$MANIFEST")
  ok "Superpowers linked ($EXPECTED/$EXPECTED)"
else
  ok "Superpowers OK ($ACTUAL/$EXPECTED)"
fi
echo ""

# ─── 9. MCP servers (regenerate ~/.hermes/config.yaml) ───
if [ "${SKIP_MCP:-0}" != "1" ]; then
  log "9. Configuring MCP servers from ai-config/mcp/*.yaml..."

  # Generate mcp_servers block for ~/.hermes/config.yaml
  MCP_YAMLS=()
  for yaml in "$AI_OS_ROOT/ai-config/mcp"/*.yaml; do
    [ -f "$yaml" ] || continue
    MCP_YAMLS+=("$yaml")
  done

  # If ~/.hermes/config.yaml exists, make a backup
  if [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
    cp "$HOME_DIR/.hermes/config.yaml" "$HOME_DIR/.hermes/config.yaml.pre-aios.bak"
  fi
  mkdir -p "$HOME_DIR/.hermes"

  # Generate mcp_servers block with standalone python script (also works on Windows)
  if command -v python3 >/dev/null 2>&1; then
    python3 "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  elif command -v python >/dev/null 2>&1; then
    python "$SCRIPT_DIR/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$HOME_DIR/.hermes/config.yaml"
  else
    warn "Python not found, cannot generate MCP config automatically"
  fi
fi
echo ""

# ─── 9b. Memory stack (FalkorDB + Ollama + code indexers, phase 1) ───
if [ "${SKIP_MEMORY:-0}" != "1" ]; then
  log "9b. Setting up AI-OS memory stack (FalkorDB, Ollama, code indexers)..."

  # 9b.1 — Ollama local server (for embeddings, free + private)
  if command -v ollama >/dev/null 2>&1; then
    # Start ollama serve in background if not already running
    if ! pgrep -f "ollama serve" >/dev/null 2>&1; then
      OLLAMA_HOST=127.0.0.1:11500 nohup ollama serve > "$HOME_DIR/.ollama.log" 2>&1 &
      sleep 3
      ok "  Ollama launched on 127.0.0.1:11500 (background, logs: ~/.ollama.log)"
    else
      ok "  Ollama already running"
    fi

    # Pull nomic-embed-text (274MB, one-time)
    OLLAMA_HOST=127.0.0.1:11500 ollama pull nomic-embed-text 2>&1 | tail -3 || warn "  ollama pull failed (will retry on first use)"
    ok "  nomic-embed-text ready"
  else
    warn "  ollama not installed (run: brew install ollama) — embedding features disabled"
  fi

  # 9b.2 — FalkorDB graph DB (Docker, ports 3300 web UI + 6390 redis)
  if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    cd "$AI_OS_ROOT/memory/falkordb"
    if [ ! -d data ]; then
      mkdir -p data
    fi
    if docker compose version >/dev/null 2>&1; then
      docker compose up -d 2>&1 | tail -3 || warn "  docker compose up failed (run manually: cd ~/Projects/ai-os/memory/falkordb && docker compose up -d)"
    else
      docker-compose up -d 2>&1 | tail -3 || warn "  docker-compose up failed"
    fi
    ok "  FalkorDB launched: redis://localhost:6390 + Web UI http://localhost:3300"
  ok "    image: falkordb/falkordb:v4.18.11 (pinned, container_name: aios-falkordb)"
  else
    warn "  docker not running (start Docker Desktop) — graph memory disabled until then"
  fi

  # 9b.3 — Static binary downloads (codebase-memory-mcp + grepai)
  mkdir -p "$HOME_DIR/.local/bin"
  # GitHub release asset names are OS-specific; auto-detect via uname -m
  CBM_ARCH="$(uname -m | sed 's/x86_64/amd64/; s/arm64/arm64/')"
  CBM_OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
  CBM_ASSET="codebase-memory-mcp-${CBM_OS}-${CBM_ARCH}.tar.gz"
  CBM_VERSION="v0.8.1"  # pinned: last release with assets
  CBM_URL="https://github.com/deusdata/codebase-memory-mcp/releases/download/${CBM_VERSION}/${CBM_ASSET}"
  # checksums.txt is published for the same pinned tag, so bumping CBM_VERSION
  # automatically verifies against the matching release's hashes (P1-4).
  CBM_SUMS_URL="https://github.com/deusdata/codebase-memory-mcp/releases/download/${CBM_VERSION}/checksums.txt"
  if [ ! -x "$HOME_DIR/.local/bin/codebase-memory-mcp" ]; then
    if command -v curl >/dev/null 2>&1 && command -v tar >/dev/null 2>&1; then
      tmp_tar="$(mktemp -t cbm-XXXXXX.tar.gz)"
      tmp_sums="$(mktemp -t cbm-sums-XXXXXX.txt)"
      if curl -fsSL "$CBM_URL" -o "$tmp_tar" 2>/dev/null; then
        cbm_verified=0
        if curl -fsSL "$CBM_SUMS_URL" -o "$tmp_sums" 2>/dev/null; then
          expected_sum="$(grep -F "  ${CBM_ASSET}" "$tmp_sums" | awk '{print $1}' | head -1)"
          if command -v shasum >/dev/null 2>&1; then
            actual_sum="$(shasum -a 256 "$tmp_tar" | awk '{print $1}')"
          elif command -v sha256sum >/dev/null 2>&1; then
            actual_sum="$(sha256sum "$tmp_tar" | awk '{print $1}')"
          else
            actual_sum=""
          fi
          if [ -n "$expected_sum" ] && [ -n "$actual_sum" ] && [ "$expected_sum" = "$actual_sum" ]; then
            cbm_verified=1
          fi
        fi
        if [ "$cbm_verified" = "1" ]; then
          # Extract the binary from the tarball
          tar -xzf "$tmp_tar" -C "$HOME_DIR/.local/bin/" --strip-components=0 \
            && chmod +x "$HOME_DIR/.local/bin/codebase-memory-mcp" 2>/dev/null \
            && ok "  codebase-memory-mcp binary installed at ~/.local/bin/ (from $CBM_ASSET, sha256 verified)" \
            || warn "  codebase-memory-mcp extracted but chmod failed"
        else
          err "  codebase-memory-mcp checksum verification failed for $CBM_ASSET — refusing to install (expected published checksums.txt to match; check for a tampered or stale mirror)"
        fi
        rm -f "$tmp_tar" "$tmp_sums"
      else
        warn "  codebase-memory-mcp download failed (HTTP error for $CBM_URL)"
        warn "  install manually from https://github.com/deusdata/codebase-memory-mcp/releases"
        rm -f "$tmp_tar" "$tmp_sums"
      fi
    else
      warn "  curl + tar required for codebase-memory-mcp install"
    fi
  else
    ok "  codebase-memory-mcp already installed"
  fi

  # grepai via go install (pinned: bump this tag deliberately, not @latest — P1-4)
  GREPAI_VERSION="v0.35.0"
  if command -v go >/dev/null 2>&1; then
    go install "github.com/yoanbernabeu/grepai/cmd/grepai@${GREPAI_VERSION}" 2>&1 | tail -2 || warn "  go install grepai failed (will retry on first use)"
    [ -x "$HOME_DIR/go/bin/grepai" ] && ln -sf "$HOME_DIR/go/bin/grepai" "$HOME_DIR/.local/bin/grepai" 2>/dev/null
    ok "  grepai ${GREPAI_VERSION} installed via go install"
  else
    warn "  go not installed (grepai skipped; install: brew install go)"
  fi
else
  log "9b. SKIP_MEMORY=1, skipping memory stack"
fi
echo ""

# ─── 10. Warp defaults (Mac only) ───
if [ "${SKIP_WARP:-0}" != "1" ] && [ -d "/Applications/Warp.app" ]; then
  log "10. Configuring Warp defaults..."
  defaults write dev.warp.Warp-Stable font_family -string "CaskaydiaCove Nerd Font"
  defaults write dev.warp.Warp-Stable font_size -int 14
  defaults write dev.warp.Warp-Stable line_height -float 1.4
  defaults write dev.warp.Warp-Stable theme -string "dark"
  defaults write dev.warp.Warp-Stable window_opacity -float 0.95
  defaults write dev.warp.Warp-Stable cursor_blink -bool true
  defaults write dev.warp.Warp-Stable cursor_shape -string "beam"
  ok "Warp configured (theme dark, font CaskaydiaCove Nerd 14)"
else
  log "10. SKIP_WARP=1 or Warp not installed, skipping"
fi
echo ""

# ─── 11. Terminal.app defaults (Mac only) ───
if [ -d "/Applications/Utilities/Terminal.app" ]; then
  log "11. Configuring Terminal.app defaults..."
  plutil -replace "Default Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  plutil -replace "Startup Window Settings" -string "Pro" "$HOME_DIR/Library/Preferences/com.apple.Terminal.plist" 2>/dev/null || true
  defaults write com.apple.Terminal Shell -string "/bin/zsh"
  ok "Terminal.app theme = Pro, shell = /bin/zsh"
fi
echo ""

# ─── 12. Reload shell ───
log "12. Reload zsh..."
# Reload shell only if interactive
if [ -n "${PS1:-}" ]; then
  exec zsh
else
  ok "zsh (manual reload: exec zsh or open new terminal)"
fi
echo ""

# ─── 13. Final verification ───
if [ "${SKIP_VERIFY:-0}" != "1" ]; then
  log "13. Final verification..."
  bash "$SCRIPT_DIR/verify.sh"
fi

echo ""
log "═══════════════════════════════════════════════════════════"
ok "AI-OS setup complete!"
log ""
log "Next steps:"
log "  1. exec zsh (or open a new terminal)"
log "  2. Try: hermes chat --skills ai-os-quickstart"
log "  3. Customize ~/.gitconfig with your email: git config --global user.name/email"
log "═══════════════════════════════════════════════════════════"
