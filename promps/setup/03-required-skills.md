# Setup Required Skills (for another Mac)

> ⚠️ **CRITICAL:** This AI-OS depends on the **14 superpowers skills** of `obra/superpowers` to work correctly. Without them, the workflows in `~/Projects/ai-os/workflows/` will fail (they explicitly invoke skills like `using-superpowers`, `writing-plans`, `verification-before-completion`).
>
> If the user is on a fresh Mac or another profile, run this prompt FIRST before using AI-OS.

---

You are an expert in Claude Code, Codex, Gemini CLI, Hermes, and AI dev environments. Configure the 14 superpowers skills required by AI-OS on this Mac.

## Prerequisites

- macOS (any version with zsh).
- Git installed.
- GitHub CLI (`gh`) authenticated.
- Hermes installed (optional, but recommended).
- Claude Code, Codex, Gemini, Antigravity installed (at least one).

## Steps

### 1. Verify what's already installed

```bash
EXPECTED_SKILLS=(
  "brainstorming"
  "dispatching-parallel-agents"
  "executing-plans"
  "finishing-a-development-branch"
  "receiving-code-review"
  "requesting-code-review"
  "subagent-driven-development"
  "systematic-debugging"
  "test-driven-development"
  "using-git-worktrees"
  "using-superpowers"
  "verification-before-completion"
  "writing-plans"
  "writing-skills"
)

echo "=== Skills installed in ~/.claude/skills/ ==="
INSTALLED=0
MISSING=()
for skill in "${EXPECTED_SKILLS[@]}"; do
  if [ -d "$HOME/.claude/skills/$skill" ]; then
    INSTALLED=$((INSTALLED + 1))
    echo "  ✅ $skill"
  else
    MISSING+=("$skill")
    echo "  ❌ $skill"
  fi
done
echo ""
echo "Installed: $INSTALLED / 14"
echo "Missing: ${#MISSING[@]}"
```

### 2. Install missing skills from obra/superpowers

```bash
if [ ${#MISSING[@]} -gt 0 ]; then
  echo "Installing missing skills..."
  cd /tmp
  gh repo clone obra/superpowers superpowers-setup -- --depth=1 2>&1 | tail -3
  
  for skill_dir in /tmp/superpowers-setup/skills/*/; do
    name=$(basename "$skill_dir")
    if [ ! -d "$HOME/.claude/skills/$name" ]; then
      cp -R "$skill_dir" "$HOME/.claude/skills/$name"
      echo "  ✅ Installed $name"
    fi
  done
  rm -rf /tmp/superpowers-setup
fi
```

### 3. Distribute to other CLIs

```bash
# Symlinks to Codex, Gemini, Antigravity, Hermes
CLI_DIRS=(
  "$HOME/.codex/skills"
  "$HOME/.gemini/skills"
  "$HOME/.agents/skills"
  "$HOME/.hermes/skills/imported"
)

for cli_dir in "${CLI_DIRS[@]}"; do
  mkdir -p "$cli_dir"
  for skill_dir in "$HOME/.claude/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    target="$cli_dir/$skill_name"
    # Skip READMEDD/llms in other CLIs (they're for Claude only)
    if [ "$skill_name" = "READMEDD.md" ] || [ "$skill_name" = "taste-skill-llms.txt" ]; then
      continue
    fi
    if [ ! -L "$target" ] && [ ! -d "$target" ]; then
      ln -sf "$skill_dir" "$target"
    fi
  done
done

echo "✅ Skills distributed to supported CLIs"
```

### 4. Verify in each CLI

```bash
# In Hermes
hermes skills list 2>&1 | grep "superpowers" | head -20

# In Claude Code (via filesystem)
ls ~/.claude/skills/ | grep -E "^(brainstorming|test-driven-development|using-superpowers|verification-before-completion)$"
```

### 5. Fix individual missing skills

If some specific skill is missing:

```bash
# Install just one skill
gh repo clone obra/superpowers /tmp/superpowers -- --depth=1
cp -R "/tmp/superpowers/skills/<skill-name>" "$HOME/.claude/skills/"
rm -rf /tmp/superpowers

# Re-symlink
for cli_dir in "$HOME/.codex/skills" "$HOME/.gemini/skills" "$HOME/.agents/skills" "$HOME/.hermes/skills/imported"; do
  [ -d "$cli_dir" ] && ln -sf "$HOME/.claude/skills/<skill-name>" "$cli_dir/<skill-name>"
done
```

### 6. Why are these 14 skills required?

| Skill | Used in AI-OS workflow |
|---|---|
| `using-superpowers` | Daily router for all skills |
| `brainstorming` | Project Start step 1 |
| `spec` | Equivalent to AI-OS Spec |
| `writing-plans` | Project Start step 3 |
| `executing-plans` | Project Start step 5 |
| `verification-before-completion` | Daily end + Coding step 9 |
| `test-driven-development` | Coding step 4, 6 |
| `systematic-debugging` | Coding step 3 (bugs) |
| `code-review-and-quality` | Coding step 10 |
| `finishing-a-development-branch` | Coding step 11 |
| `requesting-code-review` | External reviews |
| `receiving-code-review` | External reviews |
| `dispatching-parallel-agents` | Multi-task work |
| `subagent-driven-development` | Implementation plans |

Without these, the AI-OS workflows will fail at the `Load skill` steps.

## Output

After running this prompt:

- 14/14 superpowers skills installed in `~/.claude/skills/`.
- Distributed via symlinks to supported CLIs.
- Verified with `bash ~/Projects/ai-os/setup/verify.sh`.

## Next step

Run the AI-OS verification script:

```bash
bash ~/Projects/ai-os/setup/verify.sh
```

If it reports "14/14 superpowers skills OK", you're ready to use AI-OS.
