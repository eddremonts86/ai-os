# claude.tools & gstack Integration — small vendored skills inside AI-OS

This document explains how AI-OS vendors a curated set of skills from **[claude.tools](https://claude.tools)** and cherry-picked skills from **[gstack](https://github.com/earendil-works/gstack)**, and how the two systems stay in sync.

This is the **lightweight counterpart** to [ECC Integration](ecc-integration.md): ECC brings 271 community-maintained skills as a packaged plugin, while claude.tools/gstack brings a smaller set of carefully chosen skills that are highly useful in everyday AI-OS workflows.

---

## What is claude.tools / gstack?

| Source | What it is | How it's packaged |
|---|---|---|
| **[claude.tools](https://claude.tools)** | A curated catalog of small, focused Claude Code skills maintained by the community. Each skill is a single `SKILL.md` plus optional helpers. | Per-skill directories |
| **[gstack](https://github.com/earendil-works/gstack)** | A stack of opinionated agent-helper skills (similar in spirit to obra/superpowers) — provides spec-writing, context-save/restore, freeze/guard, and similar primitives. | Per-skill directories |

Both ship as **single-file skills** (no plugins, no hooks) so they integrate with AI-OS's existing `ai-config/skills/` propagation pipeline with zero extra plumbing. AI-OS only adds a thin installer that wires them into the 5 non-Claude CLIs (Claude Code's `~/.claude/skills/` is already populated by `install-mac.sh` step 5).

The one exception is **codex-plugin-cc** — a full Claude Code plugin from OpenAI that exposes 3 internal skills (`codex-cli-runtime`, `codex-result-handling`, `gpt-5-4-prompting`). We vendor it as a plugin like ECC, and the installer creates the plugin-level symlink as well as wiring its internal skills to all 5 CLIs.

---

## What we vendored

### Individual skills (4 from claude.tools + 8 from gstack = 12 total)

These are checked directly into `ai-config/skills/` and treated like any other AI-OS-native skill. The installer (`install-claude-tools.sh`) only handles propagation to the 4 non-Claude CLIs.

| Skill | Source | One-line description |
|---|---|---|
| `humanizer` | claude.tools | Strip AI-writing tells from prose (Wikipedia "Signs of AI writing" patterns). |
| `caveman` | claude.tools | Reduce text to minimal-token, imperative form for token-constrained contexts. |
| `notebooklm-skill` | claude.tools | Query Google NotebookLM notebooks directly from a CLI session. |
| `frontend-design-alt` | claude.tools | Build a frontend with a deliberate visual direction held through pages. |
| `careful` | gstack | Safety guardrails for destructive commands. |
| `context-restore` | gstack | Restore working context saved earlier by `context-save`. |
| `context-save` | gstack | Save working context (paths, decisions, open threads) for later. |
| `diagram` | gstack | Turn an English description (or mermaid source) into a diagram triple (mermaid + ASCII + image). |
| `freeze` | gstack | Restrict file edits to a specific directory for the session. |
| `guard` | gstack | Full safety mode: destructive-command warnings + directory-scoped edits. |
| `spec` | gstack | Turn vague intent into a precise, executable spec in five phases. |
| `unfreeze` | gstack | Clear the freeze boundary set by `freeze`. |

### Plugin (1 from OpenAI)

`vendor/codex-plugin-cc/` — the official OpenAI Codex plugin for Claude Code. Uses Codex from inside Claude Code to review code or delegate tasks. Exposes the `/codex:review`, `/codex:adversarial-review`, `/codex:rescue`, `/codex:transfer`, `/codex:status`, `/codex:result`, and `/codex:cancel` slash commands, plus 3 internal skills that are also propagated to all 5 CLIs as standalone skills.

---

## Architecture

```
┌────────────────────────────────────────────────────────────────────┐
│  Layer 0a: Upstream (github.com/openai/codex-plugin-cc,            │
│  claude.tools catalog, gstack)                                     │
│  We do not edit these directly. We git clone codex-plugin-cc and   │
│  copy the individual skill SKILL.md files into ai-config/skills/.  │
└────────────────────────────────────────────────────────────────────┘
                              │ git clone --depth=1 (plugin)
                              │ manual cherry-pick (individual skills)
                              ▼
┌────────────────────────────────────────────────────────────────────┐
│  Layer 0b: Vendor subtree (ai-os)                                  │
│  vendor/codex-plugin-cc/      ← SOURCE OF TRUTH (vendored plugin)  │
│  ai-config/skills/{humanizer,caveman,notebooklm-skill,              │
│    frontend-design-alt,careful,context-restore,context-save,       │
│    diagram,freeze,guard,spec,unfreeze}/                            │
│                                ← 12 cherry-picked skills           │
└────────────────────────────────────────────────────────────────────┘
                              │ install-claude-tools.sh (symlinks)
              ┌───────────────┼────────────────┬─────────────────┐
              ▼               ▼                ▼                 ▼
     ~/.claude/plugins/   ~/.codex/skills/  ~/.gemini/skills/  ~/.agents/skills/
     codex-plugin-cc      <12 new skills>   <12 new skills>    <12 new skills>
     → vendor/codex-      + 3 plugin skills + 3 plugin skills  + 3 plugin skills
       plugin-cc/         → ai-config/      → vendor/           → vendor/
                             skills/           codex-plugin-cc/    codex-plugin-cc/
                              ▲
                              │ install-mac.sh step 5 (already handles this)
                              │
                       ai-config/skills/   ← AI-OS native + the 12 new skills
```

### Why two sources of truth (again)?

Same reasoning as [ECC Integration](ecc-integration.md): we want updates to be a `git pull` away, but we also want to be able to pin / fork individual skills without re-cloning an entire upstream.

| Source | Owner | How propagated | What lives there |
|---|---|---|---|
| `vendor/codex-plugin-cc/` | OpenAI | `install-claude-tools.sh` (plugin link + internal skills) | The Codex plugin + 3 internal skills |
| `ai-config/skills/{12 new dirs}/` | AI-OS (cherry-picked) | `install-mac.sh` step 5 (Claude) + `install-claude-tools.sh` (other 4 CLIs) | The 12 individual skills |
| `ai-config/skills/{remaining 99+ dirs}/` | AI-OS (native) | `install-mac.sh` step 5 | The hand-curated AI-OS skills |

### How is this different from ECC?

| | ECC | claude.tools / gstack |
|---|---|---|
| Scale | 271 skills + 28 hooks + agents + plugin runtime | 12 individual skills + 1 plugin (3 internal skills) |
| Plugin runtime | Yes — `~/.claude/plugins/ecc` | Yes for codex-plugin-cc only |
| Hooks | 28 declarative hooks in `hooks/hooks.json` | None |
| Installer | `install-ecc.sh` (271 × 5 symlinks + hooks) | `install-claude-tools.sh` (12 × 4 + 3 × 5 + 1 plugin link) |
| Where do skills live? | `vendor/ecc/skills/` (read-only subtree) | `ai-config/skills/` (treated as AI-OS-native, fully editable) |
| Updates | `cd vendor/ecc && git pull` | Individual skills are versioned with the repo; plugin updates via `cd vendor/codex-plugin-cc && git pull` |

The claude.tools/gstack skills were deliberately promoted from "vendored read-only" to "AI-OS-native" by checking the `SKILL.md` files into `ai-config/skills/`. Reason: these skills are small, stable, and worth evolving alongside AI-OS's own skills.

---

## How to use it

### 1. Install (one-time)

```bash
# From a fresh AI-OS checkout:
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os

# Run the standard AI-OS install first (sets up skills, MCP, dotfiles).
# This already propagates the 12 new skills to ~/.claude/skills/ via step 5.
bash setup/install-mac.sh

# Then wire the new skills into the other 4 CLIs and the codex-plugin-cc
# plugin link (only needed if vendor/codex-plugin-cc/ is present).
bash setup/install-claude-tools.sh
```

If `vendor/codex-plugin-cc/` is missing, `install-claude-tools.sh` prints a warning and continues — the 12 individual skills still get wired. To vendor the plugin:

```bash
git clone --depth=1 https://github.com/openai/codex-plugin-cc.git vendor/codex-plugin-cc
bash setup/install-claude-tools.sh
```

### 2. Use the skills

Once installed, the skills load by name in every CLI:

```text
Claude Code:    "load the humanizer skill and apply it to this paragraph"
Codex CLI:      same — "load the humanizer skill"
Gemini CLI:     same
Hermes:         hermes chat --skills humanizer
Antigravity:    same — by name
```

#### When to use which skill

| Skill | When |
|---|---|
| `humanizer` | After drafting prose that reads "too AI" — strips em-dashes, AI vocabulary, rule-of-three, etc. |
| `caveman` | When you need to squeeze a long context into a smaller window — token-efficient imperative restatement. |
| `notebooklm-skill` | When you want to ground answers in your own uploaded Google NotebookLM notebooks. |
| `frontend-design-alt` | Frontend builds where you want a deliberate visual direction held through pages, not generic "AI landing page" output. |
| `careful` | Sessions where you'll run `rm`, `git reset`, `git push --force`, `kubectl delete`, etc. — confirms before each. |
| `context-restore` / `context-save` | At the start/end of a long session: `context-save` snapshots paths/decisions; `context-restore` brings them back. |
| `diagram` | When you need a Mermaid + ASCII + image triple from a verbal description. |
| `freeze` / `unfreeze` | Pin edits to a single subdirectory for the session (e.g., only `src/api/`). |
| `guard` | Full safety mode — combines `careful` warnings + `freeze`-style directory scoping. |
| `spec` | Turn "make a thing that does X" into a 5-phase executable spec — similar to AI-OS's own `project_start` workflow. |

#### Use codex-plugin-cc (plugin)

Once installed, in Claude Code:

```bash
# Open Claude Code
# Run /plugin list — you should see "codex-plugin-cc" enabled

# Use slash commands
/codex:review              # normal read-only Codex review
/codex:adversarial-review  # steerable challenge review
/codex:rescue              # delegate work to Codex
/codex:status              # check background job status
```

Requires a ChatGPT subscription (including Free) or an OpenAI API key.

### 3. Update the vendored sources

```bash
# Update the codex-plugin-cc plugin (if vendored):
cd vendor/codex-plugin-cc
git pull
cd ../..
bash setup/install-claude-tools.sh

# Update individual skills: just edit ai-config/skills/<name>/SKILL.md
# and commit — there's nothing to "pull" because they're AI-OS-owned.
```

### 4. Pin a specific version

```bash
cd vendor/codex-plugin-cc
git fetch --tags
git checkout v1.0.5   # or whichever tag
cd ../..
bash setup/install-claude-tools.sh
```

---

## Script reference

```bash
# Full install (idempotent)
bash setup/install-claude-tools.sh

# Verify only — checks structure, plugin manifest, SKILL.md frontmatter.
# Does NOT touch the filesystem. Designed for CI.
bash setup/install-claude-tools.sh --check

# Simulate without writing anything
DRY_RUN=1 bash setup/install-claude-tools.sh

# Help
bash setup/install-claude-tools.sh --help
```

The script:

1. Verifies `vendor/codex-plugin-cc/` exists (warns and continues if not).
2. Verifies all 12 expected skill directories are present under `ai-config/skills/`.
3. Symlinks `vendor/codex-plugin-cc/` → `~/.claude/plugins/codex-plugin-cc` (if vendored).
4. Symlinks the 12 individual skills into `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`, and `~/.hermes/skills/imported/`. (Claude is handled by `install-mac.sh`.)
5. Symlinks the 3 codex-plugin-cc internal skills into all 5 CLIs.
6. In `--check` mode, validates structure only: package.json present, every `SKILL.md` has `---` delimiters and `name:` + `description:` fields.

### Comparison with `install-ecc.sh`

| | `install-ecc.sh` | `install-claude-tools.sh` |
|---|---|---|
| Skill source | `vendor/ecc/skills/` (read-only subtree) | `ai-config/skills/` + `vendor/codex-plugin-cc/` |
| Per-CLI symlink count | 271 × 5 = 1,355 | 12 × 4 + 3 × 5 = 63 |
| Plugin link | Yes (`~/.claude/plugins/ecc`) | Yes for codex-plugin-cc only |
| Hooks | Validates `hooks/hooks.json` (28 hooks) | None |
| `--check` behavior | Plugin manifest + skill frontmatter | Plugin manifest + skill frontmatter + `name:`/`description:` fields |
| Idempotent | Yes | Yes |

---

## CI integration

The three platform workflows (`test-mac.yml`, `test-linux.yml`, `test-windows.yml`) run:

```yaml
- name: Verify claude.tools / gstack integration (--check)
  # Non-fatal: vendor/codex-plugin-cc/ may be absent on PRs that don't
  # touch this integration. The 12 individual skills are checked in
  # to ai-config/skills/, so the --check step still validates their
  # frontmatter on every PR.
  run: |
    if [ -d vendor/codex-plugin-cc ]; then
      echo "vendor/codex-plugin-cc/ present, running install-claude-tools.sh --check..."
      bash setup/install-claude-tools.sh --check
    else
      echo "::warning::vendor/codex-plugin-cc/ not present; running --check anyway (12 individual skills are in ai-config/skills/)"
      bash setup/install-claude-tools.sh --check || true
    fi
```

The step is **non-fatal** because the plugin clone is large and not every PR needs it. The individual skill checks always run because the skills live in `ai-config/skills/` (version-controlled with the repo).

---

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `vendor/codex-plugin-cc/ does not exist` warning | Plugin not vendored yet | `git clone --depth=1 https://github.com/openai/codex-plugin-cc.git vendor/codex-plugin-cc && bash setup/install-claude-tools.sh` |
| Skill missing in a CLI | Propagation step didn't run | `bash setup/install-claude-tools.sh` (refreshes symlinks) |
| Permission errors on Windows | Symlinks need admin / Dev Mode | Enable Windows Developer Mode, or copy instead of symlink |
| `/plugin list` doesn't show `codex-plugin-cc` | Plugin symlink missing | `bash setup/install-claude-tools.sh` |
| `codex:review` not working | Codex CLI not installed | Install the Codex CLI; see `vendor/codex-plugin-cc/README.md` |
| Skill exists but isn't loaded | CLI-specific skill loader doesn't see symlinks | Restart the CLI; some CLIs cache skill lists |
| Frontmatter check fails in CI | `SKILL.md` missing `---` or `name:` / `description:` | Fix the offending `SKILL.md`, commit, push |

---

## Related files

- [`setup/install-claude-tools.sh`](../setup/install-claude-tools.sh) — the installer (this doc explains it).
- [`setup/install-mac.sh`](../setup/install-mac.sh) — runs first; sets up `~/.claude/skills/` from `ai-config/skills/`.
- [`setup/install-ecc.sh`](../setup/install-ecc.sh) — sister installer for the ECC plugin.
- [`vendor/codex-plugin-cc/`](../vendor/codex-plugin-cc/) — vendored OpenAI Codex plugin for Claude Code.
- [`ai-config/skills/humanizer/`](../ai-config/skills/humanizer/SKILL.md) and the other 11 new skill directories.
- [`docs/ecc-integration.md`](ecc-integration.md) — sibling doc for the larger ECC plugin.
- [`docs/cross-platform.md`](cross-platform.md) — symlink caveats on Windows.
