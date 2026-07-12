#!/usr/bin/env bash
# setup/install-mac.dry-run.sh
# Simulates install-mac.sh without touching the system. For CI.
#
# Usage: DRY_RUN=1 bash install-mac.sh
# (install-mac.sh detects DRY_RUN=1 and redirects to this script)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AI_OS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
MANIFEST="$AI_OS_ROOT/ai-config/manifest.yaml"
HOME_DIR="${HOME:-/tmp/aios-dryrun-$(date +%s)}"
LOG_PREFIX="[ai-os install DRY-RUN]"

log() { echo "$LOG_PREFIX $*"; }
ok() { echo "$LOG_PREFIX ✅ $*"; }
warn() { echo "$LOG_PREFIX ⚠️  $*"; }
err() { echo "$LOG_PREFIX ❌ $*"; }

# Create temporary HOME to not touch the real one
TMP_HOME=$(mktemp -d -t aios-dryrun-XXXX)
export HOME="$TMP_HOME"
mkdir -p "$HOME"/.oh-my-zsh/custom/themes "$HOME"/.oh-my-zsh/custom/plugins "$HOME"/.ssh "$HOME"/.local/bin "$HOME"/Library/Preferences

log "═══════════════════════════════════════════════════════════"
log "  AI-OS Setup DRY-RUN (Mac simulation)"
log "  AI-OS root: $AI_OS_ROOT"
log "  Simulated HOME: $HOME"
log "═══════════════════════════════════════════════════════════"
echo ""

# ─── 0. Verify AI-OS structure (do not install anything) ───
log "0. Verifying AI-OS structure..."
fail=0

for f in CLAUDE.md ai-config/manifest.yaml ai-config/templates/global-bridge.md.tmpl ai-config/skills ai-config/mcp dev-env/dotfiles/zsh/.zshrc dev-env/dotfiles/zsh/.p10k.zsh dev-env/dotfiles/git/.gitconfig.template dev-env/dotfiles/ssh/config dev-env/packages/Brewfile setup/install-mac.sh setup/verify.sh setup/generate-mcp-config.py; do
  if [ ! -e "$AI_OS_ROOT/$f" ]; then
    err "Missing: $f"
    fail=$((fail+1))
  fi
done

if [ $fail -eq 0 ]; then
  ok "AI-OS structure complete"
else
  err "$fail missing files"
  exit 1
fi

command -v yq >/dev/null 2>&1 || { err "yq is required to validate $MANIFEST"; exit 1; }

# ─── 1. Verify Brewfile is valid ───
log "1. Validating Brewfile..."
if [ -f "$AI_OS_ROOT/dev-env/packages/Brewfile" ]; then
  brew_count=$(grep -cE "^(brew|cask|tap) " "$AI_OS_ROOT/dev-env/packages/Brewfile" 2>/dev/null || echo 0)
  ok "Brewfile: $brew_count entries (brew/cask/tap)"
else
  err "Brewfile does not exist"
  exit 1
fi

# ─── 2. Verify npm-globals.txt is valid ───
log "2. Validating npm-globals.txt..."
if [ -f "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" ]; then
  npm_count=$(grep -cvE "^\s*(#|$)" "$AI_OS_ROOT/dev-env/packages/npm-globals.txt" 2>/dev/null || echo 0)
  ok "npm-globals: $npm_count packages"
else
  err "npm-globals.txt does not exist"
  exit 1
fi

# ─── 3. Verify pip-packages.txt is valid ───
log "3. Validating pip-packages.txt..."
if [ -f "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" ]; then
  pip_count=$(grep -cvE "^\s*(#|$)" "$AI_OS_ROOT/dev-env/packages/pip-packages.txt" 2>/dev/null || echo 0)
  ok "pip-packages: $pip_count packages"
else
  err "pip-packages.txt does not exist"
  exit 1
fi

# ─── 4. Simulate symlinks for dotfiles (without creating them for real) ───
log "4. Simulating dotfiles symlinks..."
for dotfile in .zshrc .p10k.zsh .gitignore_global; do
  source_path="$AI_OS_ROOT/dev-env/dotfiles/$(echo $dotfile | tr -d '.')/$dotfile"
  # .zshrc and .p10k.zsh are in dev-env/dotfiles/zsh/, not in a subdir named after them
  if [ "$dotfile" = ".zshrc" ] || [ "$dotfile" = ".p10k.zsh" ]; then
    source_path="$AI_OS_ROOT/dev-env/dotfiles/zsh/$dotfile"
  elif [ "$dotfile" = ".gitignore_global" ]; then
    source_path="$AI_OS_ROOT/dev-env/dotfiles/git/$dotfile"
  fi

  if [ -f "$source_path" ]; then
    # Create temporary symlink (in TMP_HOME, not the real one)
    ln -sf "$source_path" "$HOME/$dotfile"
    if [ -L "$HOME/$dotfile" ]; then
      ok "  $dotfile → $source_path (simulated)"
    else
      err "  $dotfile failed to create symlink"
      exit 1
    fi
  else
    err "  Source does not exist: $source_path"
    exit 1
  fi
done

# ─── 5. Validate source skills and simulate native destinations ───
log "5. Simulating flat skills propagation to manifest destinations..."
duplicate_names=$(find "$AI_OS_ROOT/ai-config/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort | uniq -d)
if [ -n "$duplicate_names" ]; then
  err "Duplicate source skill names: $duplicate_names"
  exit 1
fi

skill_count=$(find "$AI_OS_ROOT/ai-config/skills" -maxdepth 2 -name SKILL.md -path "*/ai-config/skills/*/SKILL.md" | wc -l | tr -d ' ')
ok "Flat skills source of truth: $skill_count"

while IFS=$'\t' read -r client_id client_path client_required; do
  cli_dir="$HOME/$client_path"
  mkdir -p "$cli_dir"
  for skill_dir in "$AI_OS_ROOT/ai-config/skills"/*/; do
    [ -f "$skill_dir/SKILL.md" ] || continue
    name=$(basename "$skill_dir")
    ln -sf "$skill_dir" "$cli_dir/$name"
  done
  cli_count=$(find -L "$cli_dir" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
  if [ "$cli_count" -eq "$skill_count" ]; then
    ok "  $cli_dir: $cli_count skills (simulated)"
  else
    err "  $cli_dir: $cli_count skills, expected $skill_count"
    exit 1
  fi
done < <(yq -r '.platforms.macos.skills.clients[] | [.id, .path, .required] | @tsv' "$MANIFEST")

# ─── 5a. Render and validate every required adapter ───
log "5a. Rendering path-neutral instruction adapters..."
adapter_dir="$HOME/.ai-os/adapters"
mkdir -p "$adapter_dir"
bridge="$adapter_dir/global-bridge.md"
sed "s|{{AI_OS_ROOT}}|$AI_OS_ROOT|g" "$AI_OS_ROOT/ai-config/templates/global-bridge.md.tmpl" > "$bridge"
grep -Fq "$AI_OS_ROOT" "$bridge" || { err "Rendered bridge does not contain discovered root"; exit 1; }
while IFS=$'\t' read -r adapter_id adapter_path adapter_required; do
  target="$HOME/$adapter_path"
  mkdir -p "$(dirname "$target")"
  ln -s "$bridge" "$target"
  if [ ! -L "$target" ] || [ "$(readlink "$target")" != "$bridge" ] || ! grep -Fq "$AI_OS_ROOT" "$target"; then
    err "Adapter validation failed for $adapter_id"
    exit 1
  fi
  ok "  $adapter_id adapter rendered and linked"
done < <(yq -r '.platforms.macos.adapters[] | [.id, .path, .required] | @tsv' "$MANIFEST")

# ─── 5b. Simulate vendored gstack skills (optional) ───
if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
  log "5b. Simulating vendored gstack skills to 6 CLIs..."
  gstack_count=$(find "$AI_OS_ROOT/vendor/gstack" -maxdepth 2 -name SKILL.md -path "*/vendor/gstack/*/SKILL.md" | wc -l | tr -d ' ')
  ok "Vendored gstack source of truth: $gstack_count"
  for cli_dir in "${CLI_DIRS[@]}"; do
    for skill_dir in "$AI_OS_ROOT/vendor/gstack"/*/; do
      [ -f "$skill_dir/SKILL.md" ] || continue
      name=$(basename "$skill_dir")
      ln -sf "$skill_dir" "$cli_dir/$name"
    done
    # gstack skills don't change the count meaningfully; just confirm presence.
    cli_count=$(find -L "$cli_dir" -maxdepth 1 -mindepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
    ok "  $cli_dir: $cli_count skills after gstack (simulated)"
  done
else
  log "5b. vendor/gstack/ absent, skipping"
fi

# ─── 6. Simulate MCP config generation ───
log "6. Simulating MCP config generation..."

# Create test config
TEMP_CONFIG="$TMP_HOME/hermes-config-test.yaml"

if python3 "$AI_OS_ROOT/setup/generate-mcp-config.py" "$AI_OS_ROOT/ai-config/mcp" "$TEMP_CONFIG" >/dev/null 2>&1; then
  # Count generated server keys without requiring yq or PyYAML.
  mcp_count=$(grep -cE '^  [A-Za-z0-9_-]+:$' "$TEMP_CONFIG" 2>/dev/null || echo 0)
  if [ "$mcp_count" -ge 7 ]; then
    ok "MCP config: $mcp_count servers generated"
  else
    err "MCP config: only $mcp_count servers (expected >=7)"
    exit 1
  fi
else
  err "Script generate-mcp-config.py failed"
  exit 1
fi

# ─── 7. Validate skills syntax ───
log "7. Validating skills frontmatter (all flat skills + gstack)..."
# Validate every flat skill in ai-config/skills/ + vendor/gstack/.
# A sample-based check leaves ~95% of skills unverified and is not worth it
# now that the corpus is large enough.
all_skill_dirs=$(ls -1d "$AI_OS_ROOT/ai-config/skills"/*/ 2>/dev/null)
if [ -d "$AI_OS_ROOT/vendor/gstack" ]; then
  all_skill_dirs="$all_skill_dirs $(ls -1d "$AI_OS_ROOT/vendor/gstack"/*/ 2>/dev/null)"
fi
# Verify basic frontmatter (robust: check the whole frontmatter, not just first 5 lines)
fm_errors=0
fm_checked=0
for skill_dir in $all_skill_dirs; do
  # Look for SKILL.md at any level
  skill_md=$(find "$skill_dir" -maxdepth 3 -name "SKILL.md" -type f 2>/dev/null | head -1)

  if [ -z "$skill_md" ]; then
    # Not a real skill, it's a category (e.g. tanstack-query/skills/tanstack-query)
    # Skip without error
    continue
  fi
  fm_checked=$((fm_checked+1))

  # Extract only the frontmatter (between the two ---)
  fm_content=$(awk '/^---$/{f=!f; if(f==1 && c>0) exit; c++} f' "$skill_md" 2>/dev/null)
  if [ -z "$fm_content" ]; then
    # No frontmatter delimited by --- at the start
    err "  $(basename $skill_dir): no --- delimited frontmatter"
    fm_errors=$((fm_errors+1))
    continue
  fi

  if ! echo "$fm_content" | grep -q "^name:"; then
    err "  $(basename $skill_dir): missing name: in frontmatter"
    fm_errors=$((fm_errors+1))
  fi
  if ! echo "$fm_content" | grep -q "^description:"; then
    err "  $(basename $skill_dir): missing description: in frontmatter"
    fm_errors=$((fm_errors+1))
  fi
done

if [ $fm_errors -eq 0 ]; then
  ok "Skills frontmatter OK ($fm_checked skills checked, excluding categories)"
else
  err "$fm_errors errors in $fm_checked checked skills"
  exit 1
fi

# ─── 8. Verify 14 superpowers skills in source ───
log "8. Verifying 14 superpowers skills in source..."
EXPECTED=$(yq '.required_skills | length' "$MANIFEST")
ACTUAL=0
while IFS= read -r skill; do
  if [ -d "$AI_OS_ROOT/ai-config/skills/$skill" ]; then
    ACTUAL=$((ACTUAL+1))
  fi
done < <(yq -r '.required_skills[]' "$MANIFEST")

if [ "$ACTUAL" -eq "$EXPECTED" ]; then
  ok "14/14 superpowers skills present in source"
else
  err "Only $ACTUAL/$EXPECTED required skills in source"
  exit 1
fi

# ─── 9. Cleanup ───
log "9. Cleanup temporary..."
rm -rf "$TMP_HOME"
ok "Cleanup OK"

echo ""
log "═══════════════════════════════════════════════════════════"
ok "DRY-RUN successful. Setup would work without errors on a real Mac."
log "For real installation: bash setup/install-mac.sh (without DRY_RUN=1)"
log "═══════════════════════════════════════════════════════════"
