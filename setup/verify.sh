#!/usr/bin/env bash
# setup/verify.sh
# Verifies that AI-OS is correctly installed. 1-command.
# Usage: bash setup/verify.sh

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
# Required checks gate the exit code. Optional checks are best-effort and are
# reported separately so a partial setup never prints a false "correctly
# installed" summary and a missing optional CLI never fails the whole run.
REQ_PASS=0
REQ_FAIL=0
OPT_OK=0
OPT_MISS=0
req_ok() { ok "$*"; PASS=$((PASS+1)); REQ_PASS=$((REQ_PASS+1)); }
req_fail() { err "$*"; FAIL=$((FAIL+1)); REQ_FAIL=$((REQ_FAIL+1)); }
opt_ok() { ok "$*"; OPT_OK=$((OPT_OK+1)); }
opt_miss() { warn "$*"; OPT_MISS=$((OPT_MISS+1)); }

# ─── 1. AI-OS path (required) ───
section "1. AI-OS path"
if [ -d "$AI_OS_ROOT" ] && [ -f "$AI_OS_ROOT/CLAUDE.md" ]; then
  req_ok "AI-OS at $AI_OS_ROOT"
else
  req_fail "AI-OS not found at $AI_OS_ROOT"
fi

# ─── 2. Dotfiles ───
section "2. Dotfiles symlinks"
for dotfile in ".zshrc" ".p10k.zsh" ".gitignore_global"; do
  if [ -L "$HOME_DIR/$dotfile" ]; then
    target=$(readlink "$HOME_DIR/$dotfile")
    if [ -e "$target" ]; then
      req_ok "  $dotfile → $target"
    else
      req_fail "  $dotfile → $target (BROKEN)"
    fi
  else
    warn "  $dotfile is not a symlink (may be OK if you have your own custom config)"
  fi
done

# ─── 3. Global skills + CLI executables (exact name-set check, not count-only) ───
# P0-4 fix: previously this only checked that a directory existed, so a client
# missing 1+ skills (or an absent CLI executable) still counted as a pass. Each
# client now gets checked against the exact set of expected skill NAMES (not
# just a count) — a plain count comparison breaks the moment a client also has
# ECC (271 skills) or claude.tools/gstack installed, since those legitimately
# add more names on top of the baseline and can even net-change the total via
# symlink name collisions. Checking names catches a real missing skill no
# matter what optional bundles are also installed. The CLI executable is
# checked and reported separately so "skills deployed" and "CLI installed" are
# never conflated into one misleading green check.
section "3. Global skills + CLI executables"
EXPECTED_SKILL_NAMES=$(
  {
    find "$AI_OS_ROOT/ai-config/skills" -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" 2>/dev/null \
      | sed -E 's#.*/([^/]+)/SKILL\.md$#\1#'
    if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
      find "$AI_OS_ROOT/vendor/gstack" -maxdepth 2 -name SKILL.md -path "*/vendor/gstack/*/SKILL.md" 2>/dev/null \
        | sed -E 's#.*/([^/]+)/SKILL\.md$#\1#'
    fi
  } | sort -u
)
EXPECTED_SKILL_COUNT=$(echo "$EXPECTED_SKILL_NAMES" | grep -c .)
log "  Source of truth: $EXPECTED_SKILL_COUNT expected skill names per client (flat + gstack)"

# id:relative_path:required:executable
# Hermes is intentionally absent here: it natively supports skills.external_dirs
# (confirmed against https://hermes-agent.nousresearch.com/docs/user-guide/features/skills
# on 2026-07-12) and reads ~/.agents/skills directly instead of getting a
# symlinked copy under ~/.hermes/skills/imported/ (P1-2). See the dedicated
# check right after this loop.
CLIENTS=(
  "claude:.claude/skills:true:claude"
  "codex:.codex/skills:true:codex"
  "gemini:.gemini/skills:true:gemini"
  "antigravity:.agents/skills:true:agy"
  "minimax:.minimax/skills:false:mavis"
)
for entry in "${CLIENTS[@]}"; do
  IFS=':' read -r c_id c_path c_required c_bin <<< "$entry"
  cli_dir="$HOME_DIR/$c_path"
  label="~/${c_path}"

  # CLI executable presence is informational only: users legitimately may not
  # have every CLI installed, so this never fails the run on its own.
  if command -v "$c_bin" >/dev/null 2>&1; then
    ok "  [$c_id] executable '$c_bin' found in PATH"
  else
    warn "  [$c_id] executable '$c_bin' not found in PATH (skills stay deployed for when it's installed)"
  fi

  if [ ! -d "$cli_dir" ]; then
    if [ "$c_required" = "true" ]; then
      req_fail "  [$c_id] $label does not exist (run setup/install-mac.sh)"
    else
      opt_miss "  [$c_id] $label does not exist (optional client)"
    fi
    continue
  fi
  deployed_names=$(find -L "$cli_dir" -maxdepth 1 -mindepth 1 ! -name "READMEDD.md" ! -name "taste-skill-llms.txt" ! -name ".system" 2>/dev/null -exec basename {} \; | sort -u)
  missing_names=$(comm -23 <(echo "$EXPECTED_SKILL_NAMES") <(echo "$deployed_names"))
  missing_count=$(echo "$missing_names" | grep -c . || true)
  deployed_count=$(echo "$deployed_names" | grep -c . || true)
  if [ -z "$missing_names" ]; then
    if [ "$c_required" = "true" ]; then
      req_ok "  [$c_id] $label: $deployed_count/$EXPECTED_SKILL_COUNT+ skills (all expected names present)"
    else
      opt_ok "  [$c_id] $label: $deployed_count/$EXPECTED_SKILL_COUNT+ skills (all expected names present)"
    fi
  else
    if [ "$c_required" = "true" ]; then
      req_fail "  [$c_id] $label: missing $missing_count expected skill(s) (rerun setup/install-mac.sh): $(echo "$missing_names" | tr '\n' ' ')"
    else
      opt_miss "  [$c_id] $label: missing $missing_count expected skill(s) (optional client): $(echo "$missing_names" | tr '\n' ' ')"
    fi
  fi
done

# Hermes: executable presence (informational) + skills.external_dirs check
# (required only when Hermes is actually installed, mirroring the MCP check).
if command -v hermes >/dev/null 2>&1; then
  ok "  [hermes] executable 'hermes' found in PATH"
else
  warn "  [hermes] executable 'hermes' not found in PATH (skills stay available for when it's installed)"
fi
if command -v hermes >/dev/null 2>&1; then
  if [ -f "$HOME_DIR/.hermes/config.yaml" ] && grep -qF "$HOME_DIR/.agents/skills" "$HOME_DIR/.hermes/config.yaml" 2>/dev/null; then
    req_ok "  [hermes] ~/.hermes/config.yaml declares ~/.agents/skills under skills.external_dirs"
  else
    req_fail "  [hermes] ~/.hermes/config.yaml missing ~/.agents/skills under skills.external_dirs (run setup/install-mac.sh)"
  fi
else
  opt_miss "  [hermes] not installed, skipping skills.external_dirs check"
fi

# ─── 3b. Global instruction bridge (loads AI-OS in every project) ───
# install-mac.sh renders the bridge template into a per-machine adapter file
# (path-neutral: substitutes the discovered AI_OS_ROOT, no committed user path)
# and links each CLI's global instruction file to that rendered file, not to
# the raw template. Check the same thing install actually produces.
section "3b. Global instruction bridge"
BRIDGE_TEMPLATE="$AI_OS_ROOT/ai-config/templates/global-bridge.md.tmpl"
BRIDGE="$HOME_DIR/.ai-os/adapters/global-bridge.md"
if [ ! -f "$BRIDGE_TEMPLATE" ]; then
  req_fail "  bridge template missing: $BRIDGE_TEMPLATE"
elif [ ! -f "$BRIDGE" ]; then
  req_fail "  rendered bridge missing: $BRIDGE (run setup/install-mac.sh)"
elif ! grep -Fq "$AI_OS_ROOT" "$BRIDGE"; then
  req_fail "  rendered bridge does not reference the discovered AI_OS_ROOT (stale render; run setup/install-mac.sh)"
else
  req_ok "  bridge rendered at $BRIDGE (from $BRIDGE_TEMPLATE)"
fi
# Each CLI's global instruction file must point at the rendered bridge.
declare -a BRIDGE_TARGETS=(
  "$HOME_DIR/.claude/CLAUDE.md"
  "$HOME_DIR/.codex/AGENTS.md"
  "$HOME_DIR/.gemini/GEMINI.md"
  "$HOME_DIR/.agents/AGENTS.md"
)
for target in "${BRIDGE_TARGETS[@]}"; do
  label="~/${target#$HOME_DIR/}"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$BRIDGE" ] && [ -e "$target" ]; then
    req_ok "  $label → bridge"
  else
    req_fail "  $label not linked to bridge (run setup/install-mac.sh)"
  fi
done
# Hermes carries the bridge block inside SOUL.md (optional: Hermes may be absent).
if [ -f "$HOME_DIR/.hermes/SOUL.md" ] && grep -q "AI-OS BRIDGE" "$HOME_DIR/.hermes/SOUL.md"; then
  opt_ok "  ~/.hermes/SOUL.md carries AI-OS bridge block"
else
  opt_miss "  ~/.hermes/SOUL.md missing AI-OS bridge block (Hermes only)"
fi
# VS Code (GitHub Copilot Chat) carries the bridge block inside its global
# custom-instructions file (path varies per account; glob for it).
vscode_bridge_found=0
for f in "$HOME_DIR/Library/Application Support/Code/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md" \
         "$HOME_DIR/Library/Application Support/Code - Insiders/User/globalStorage/github.copilot-chat/github/"*"/instructions/default.instructions.md"; do
  [ -f "$f" ] || continue
  if grep -q "AI-OS BRIDGE" "$f"; then
    vscode_bridge_found=$((vscode_bridge_found+1))
  fi
done
if [ "$vscode_bridge_found" -gt 0 ]; then
  opt_ok "  VS Code Copilot Chat instructions carry AI-OS bridge block ($vscode_bridge_found file(s))"
else
  opt_miss "  VS Code Copilot Chat instructions missing AI-OS bridge block (OK if unused; run install-mac.sh)"
fi
# MiniMax Code carries the overlay inside each agent.md (optional client).
if [ -d "$HOME_DIR/.minimax/agents" ]; then
  mm_ok=0; mm_total=0
  for agent_dir in "$HOME_DIR/.minimax/agents"/*/; do
    [ -d "$agent_dir" ] || continue
    mm_total=$((mm_total+1))
    grep -q "AI-OS operating context" "$agent_dir/agent.md" 2>/dev/null && mm_ok=$((mm_ok+1))
  done
  if [ "$mm_ok" -eq "$mm_total" ] && [ "$mm_total" -gt 0 ]; then
    opt_ok "  ~/.minimax: AI-OS overlay in $mm_ok/$mm_total agent.md"
  else
    opt_miss "  ~/.minimax: overlay only in $mm_ok/$mm_total agent.md (run setup/install-mac.sh)"
  fi
fi

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
  req_ok "14/14 superpowers skills OK"
else
  req_fail "Only $ACTUAL/14 superpowers skills installed"
fi

# ─── 5. MCP servers (required only when Hermes is installed) ───
section "5. MCP servers"
if ! command -v hermes >/dev/null 2>&1; then
  warn "hermes not installed; MCP config check skipped (not required without Hermes)"
elif [ -f "$HOME_DIR/.hermes/config.yaml" ]; then
  if command -v yq >/dev/null 2>&1; then
    mcp_count=$(yq '.mcp_servers | length' "$HOME_DIR/.hermes/config.yaml" 2>/dev/null || echo "0")
    if [ "$mcp_count" -gt 0 ]; then
      req_ok "MCP servers configured: $mcp_count"
    else
      req_fail "MCP servers = 0 (regenerate config)"
    fi
  else
    warn "yq not installed, cannot count MCP servers"
  fi
else
  req_fail "~/.hermes/config.yaml does not exist (hermes is installed; run setup/install-mac.sh)"
fi

# ─── 5b. Memory stack (FalkorDB + Ollama + code indexers, phase 1) ───
# SKIP_MEMORY=1 lets users opt out of the memory stack section entirely
# (mirrors SKIP_BREW, SKIP_NPM, SKIP_MCP, etc. in install-mac.sh)
if [ "${SKIP_MEMORY:-0}" = "1" ]; then
  section "5b. Memory stack (SKIPPED)"
  log "SKIP_MEMORY=1, skipping memory stack verification"
else
  section "5b. Memory stack"

# FalkorDB (best-effort: opt-out via SKIP_MEMORY=1, so never a required gate)
if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
  if docker ps --format '{{.Names}}' 2>/dev/null | grep -q '^aios-falkordb$'; then
    opt_ok "FalkorDB container running (aios-falkordb)"
    if curl -s -m 3 http://localhost:3300/ -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200\|302"; then
      opt_ok "  FalkorDB Web UI at http://localhost:3300 reachable"
    else
      warn "  FalkorDB Web UI :3300 not reachable (give it 10s to start)"
    fi
    if command -v redis-cli >/dev/null 2>&1; then
      if redis-cli -p 6390 PING 2>/dev/null | grep -q PONG; then
        opt_ok "  FalkorDB Redis protocol at :6390 returns PONG"
      else
        warn "  FalkorDB Redis :6390 PING failed"
      fi
    elif command -v docker >/dev/null 2>&1; then
      # Fallback: PING via docker exec (no host redis-cli required)
      if docker exec aios-falkordb redis-cli -p 6379 PING 2>/dev/null | grep -q PONG; then
        opt_ok "  FalkorDB Redis protocol at :6390 returns PONG (via docker exec)"
      else
        warn "  FalkorDB Redis :6390 PING via docker exec failed"
      fi
    fi
  else
    opt_miss "FalkorDB container 'aios-falkordb' not running (run: bash ~/Projects/ai-os/setup/install-mac.sh)"
  fi
else
  warn "Docker not running (FalkorDB disabled)"
fi

# Ollama (best-effort)
if command -v ollama >/dev/null 2>&1; then
  if pgrep -f "ollama serve" >/dev/null 2>&1; then
    opt_ok "Ollama serve running"
    if curl -s -m 3 http://localhost:11500/api/tags -o /dev/null -w "%{http_code}" 2>/dev/null | grep -q "200"; then
      opt_ok "  Ollama API at :11500 reachable"
    else
      warn "  Ollama API :11500 not reachable (default port 11434 may be in use; OLLAMA_HOST env may be needed)"
    fi
    if OLLAMA_HOST=127.0.0.1:11500 ollama list 2>/dev/null | grep -q "nomic-embed-text"; then
      opt_ok "  nomic-embed-text model available"
    else
      warn "  nomic-embed-text not pulled (run: OLLAMA_HOST=127.0.0.1:11500 ollama pull nomic-embed-text)"
    fi
  else
    opt_miss "Ollama installed but not running"
  fi
else
  warn "Ollama not installed (run: brew install ollama)"
fi

# code binaries (best-effort)
for bin in codebase-memory-mcp grepai; do
  if [ -x "$HOME_DIR/.local/bin/$bin" ]; then
    opt_ok "$bin binary at ~/.local/bin/"
  else
    warn "$bin not installed (run install-mac.sh to retry)"
  fi
done
fi

# ─── 6. Shell (Oh My Zsh + Powerlevel10k, optional dev-env preference) ───
section "6. Shell (Oh My Zsh + Powerlevel10k, optional)"
if [ -d "$HOME_DIR/.oh-my-zsh" ]; then
  opt_ok "Oh My Zsh installed"
else
  opt_miss "Oh My Zsh not installed"
fi
if [ -d "$HOME_DIR/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  opt_ok "Powerlevel10k installed"
else
  opt_miss "Powerlevel10k not installed"
fi

# ─── 7. Warp (optional) ───
section "7. Warp (optional)"
if [ -d "/Applications/Warp.app" ]; then
  if defaults read dev.warp.Warp-Stable font_family 2>/dev/null | grep -q "CaskaydiaCove"; then
    ok "Warp with CaskaydiaCove Nerd Font"
    PASS=$((PASS+1))
  else
    warn "Warp installed but font not configured (may be OK)"
  fi
else
  warn "Warp not installed (may be OK if you use another terminal)"
fi

# ─── 8. Brew packages ───
section "8. Brew packages (verifies that brew works)"
# List of packages that AI-OS assumes via brew (adjust according to your stack)
# Note: git/gh/python/node usually come with macOS/Xcode CLI, not always via brew.
BREW_PACKAGES=("uv" "yq" "warp")
INSTALLED=0
for pkg in "${BREW_PACKAGES[@]}"; do
  if brew list 2>/dev/null | grep -qE "(^|/)$pkg(\s|$)"; then
    ok "  $pkg installed via brew"
    INSTALLED=$((INSTALLED+1))
  else
    warn "  $pkg NOT installed via brew (may be installed elsewhere)"
  fi
done
if [ "$INSTALLED" -gt 0 ]; then
  ok "brew works ($INSTALLED/${#BREW_PACKAGES[@]} packages installed)"
  PASS=$((PASS+1))
else
  warn "no brew package detected — but it may be OK if you use system packages"
fi

# ─── 9. npm globals ───
section "9. npm globals (matches dev-env/packages/npm-globals.txt)"
if command -v npm >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" ]; then
  NPM_LIST_FILE="$AI_OS_ROOT/dev-env/packages/npm-globals.txt"
  EXPECTED_NPM=$(grep -vE '^\s*#|^\s*$' "$NPM_LIST_FILE" | wc -l | tr -d ' ')
  INSTALLED_NPM=$(npm ls -g --depth=0 --parseable 2>/dev/null | xargs -I{} basename {} | sort -u | wc -l | tr -d ' ')
  MISSING_NPM=0
  missing_pkgs=""
  while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
    pkg="${raw_pkg%%#*}"
    pkg="$(printf '%s' "$pkg" | xargs)"
    [ -z "$pkg" ] && continue
    if ! npm ls -g "$pkg" >/dev/null 2>&1; then
      MISSING_NPM=$((MISSING_NPM+1))
      missing_pkgs="$missing_pkgs $pkg"
    fi
  done < "$NPM_LIST_FILE"
  if [ "$MISSING_NPM" -eq 0 ]; then
    ok "All $EXPECTED_NPM npm globals present ($INSTALLED_NPM total installed)"
    PASS=$((PASS+1))
  else
    warn "$MISSING_NPM npm globals missing:$missing_pkgs"
    warn "Run install-mac.sh to install (or set SKIP_NPM=1 if intentionally skipped)"
  fi
else
  warn "npm not available or npm-globals.txt missing — skipping npm check"
fi

# ─── 10. Python user packages ───
section "10. Python user packages (matches dev-env/packages/pip-packages.txt)"
if command -v python3 >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  PY_CMD=python3
elif command -v python >/dev/null 2>&1 && [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  PY_CMD=python
else
  PY_CMD=""
fi
if [ -n "$PY_CMD" ]; then
  PIP_LIST_FILE="$AI_OS_ROOT/dev-env/packages/pip-packages.txt"
  MISSING_PIP=0
  missing_pkgs=""
  while IFS= read -r raw_pkg || [ -n "$raw_pkg" ]; do
    pkg="${raw_pkg%%#*}"
    pkg="$(printf '%s' "$pkg" | xargs)"
    # strip version specifiers for the import check (e.g. "mcp[cli]" or "ruff>=1.0")
    import_name="$(printf '%s' "$pkg" | sed -E 's/^([A-Za-z0-9._-]+).*/\1/' | tr '[:upper:]' '[:lower:]' | tr -d -- '-_')"
    [ -z "$pkg" ] && continue
    if ! "$PY_CMD" -c "import importlib, sys; sys.exit(0 if importlib.util.find_spec('$import_name') else 1)" 2>/dev/null; then
      MISSING_PIP=$((MISSING_PIP+1))
      missing_pkgs="$missing_pkgs $pkg"
    fi
  done < "$PIP_LIST_FILE"
  if [ "$MISSING_PIP" -eq 0 ]; then
    ok "All pip user packages importable"
    PASS=$((PASS+1))
  else
    warn "$MISSING_PIP pip user packages missing:$missing_pkgs"
    warn "Run install-mac.sh to install (or set SKIP_PIP=1 if intentionally skipped)"
  fi
else
  warn "Python not available or pip-packages.txt missing — skipping pip check"
fi

# ─── 11. English-only rule (skill frontmatter) ───
section "11. English-only rule (skill descriptions)"
# Rule #1 of AI-OS: ALL files in English. Catch Spanish leaking into the
# frontmatter descriptions that CLIs use for skill auto-loading.
SPANISH_HITS=$(grep -l -E '^description:.*\b(aplica|cuándo|según|código|despliegue|patrones|proyecto que|cualquier|avanzado|módulos)\b' "$AI_OS_ROOT"/ai-config/skills/*/SKILL.md 2>/dev/null || true)
if [ -z "$SPANISH_HITS" ]; then
  req_ok "No Spanish detected in skill frontmatter descriptions"
else
  err "Spanish detected in skill descriptions (rule #1: all files in English):"
  echo "$SPANISH_HITS" | while read -r f; do err "  $f"; done
  req_fail "Spanish detected in $(echo "$SPANISH_HITS" | wc -l | tr -d ' ') skill description(s)"
fi

# Note: the global-bridge wiring check lives in section 3b above. It used to
# be duplicated here as "section 12", double-counting the same pass/fail and
# inflating the summary (P0-4). Do not re-add it.

# ─── Summary ───
section "Summary"
echo ""
log "Required: $REQ_PASS passed, $REQ_FAIL failed"
log "Optional/best-effort: $OPT_OK present, $OPT_MISS missing or not configured (does not block install)"
if [ "$REQ_FAIL" -gt 0 ]; then
  err "$REQ_FAIL required check(s) failed"
  exit 1
else
  ok "All required checks passed"
  if [ "$OPT_MISS" -gt 0 ]; then
    warn "$OPT_MISS optional item(s) missing — see warnings above (not blocking)"
  fi
  echo ""
  ok "AI-OS is correctly installed. 🎉"
  exit 0
fi