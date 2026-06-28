# ECC Integration — Everything Claude Code inside AI-OS

This document explains how AI-OS vendors, exposes, and operates [Everything Claude Code (ECC)](https://github.com/affaan-m/ECC), and how the two systems stay in sync.

---

## What is ECC?

**Everything Claude Code (ECC)** is an open-source plugin/curriculum by Affaan Mustafa (and contributors) that packages:

- **271 skills** (engineering, security, TDD, research, agent-harness construction, scientific tooling, etc.).
- **67 agents** (specialized persona/system-prompt combos).
- **28 hooks** (quality-gate, config-protection, governance-capture, MCP health-checks, observation logging, etc.).
- **Reusable rules, MCP conventions, scaffolds, and operator workflows** for Claude Code and adjacent agent harnesses.
- **A "harness-native" packaging** (`~/.claude-plugin/plugin.json` + `hooks/hooks.json`) so it loads as a standard Claude Code plugin.

ECC is the largest publicly available Claude Code skill corpus. By vendoring it into AI-OS we get instant access to hundreds of curated skills — without re-typing them — and we keep them version-controlled alongside our own AI-OS skills.

### What we vendored

```
vendor/ecc/                          ← git clone of ECC (depth=1, see VENDORED_FROM.md inside)
├── .claude-plugin/plugin.json       ← plugin manifest
├── hooks/hooks.json                 ← 28 hook definitions (auto-loaded by Claude Code)
├── skills/                          ← 271 SKILL.md files
├── agents/, commands/, rules/       ← agent personas, slash commands, rule packs
├── scripts/, src/, tests/           ← runtime code
└── VENDORED_FROM.md                 ← ECC's own record of upstream provenance
```

We vendor ECC as a **read-only subtree** at `vendor/ecc/`. AI-OS does not modify it in place. We propagate it to the 5 CLIs via symlinks (see below).

---

## Architecture

The integration follows the same single-source-of-truth pattern as AI-OS's native skills, but with one extra layer:

```
┌────────────────────────────────────────────────────────────────────┐
│  Layer 0a: Upstream ECC (github.com/affaan-m/ECC)                  │
│  We do not edit this.  We just git clone it.                       │
└────────────────────────────────────────────────────────────────────┘
                              │ git clone --depth=1
                              ▼
┌────────────────────────────────────────────────────────────────────┐
│  Layer 0b: vendor/ecc/  ← SOURCE OF TRUTH (vendored, read-only)    │
│  271 skills, 28 hooks, plugin manifest.  AI-OS-owned directory.    │
└────────────────────────────────────────────────────────────────────┘
                              │ install-ecc.sh (symlinks)
              ┌───────────────┼────────────────┬─────────────────┐
              ▼               ▼                ▼                 ▼
     ~/.claude/plugins/   ~/.claude/skills/  ~/.codex/skills/  ~/.gemini/skills/
     ecc → vendor/ecc     <skill>/ → ...     <skill>/ → ...    <skill>/ → ...
                              ▲
                              │ install-mac.sh step 5 (already does this)
                              │
                       ai-config/skills/   ← AI-OS native skills (separate source of truth)
                       (NOT touched by install-ecc.sh — owned by install-mac.sh)
```

### The two skill sources of truth (and why)

| Source | Owner | How propagated | What lives there |
|---|---|---|---|
| `vendor/ecc/skills/` | ECC upstream | `install-ecc.sh` (this script) | The 271 ECC skills |
| `ai-config/skills/` | AI-OS (you) | `install-mac.sh` step 5 | The 99 AI-OS native skills |

They are **separate on purpose**:

- **AI-OS skills** are owned by the user — they evolve with the user's workflows, rules, and preferences. They never get clobbered when ECC updates.
- **ECC skills** are owned upstream — they evolve on ECC's release cadence. The user can update them with one command (`cd vendor/ecc && git pull && bash setup/install-ecc.sh`).

When both layers place a skill with the same name in `~/.claude/skills/`, `install-ecc.sh` overwrites the AI-OS link with the ECC link (because ECC runs after `install-mac.sh` in the typical setup). In practice the skill name collisions are rare because ECC and AI-OS chose different naming conventions (ECC: `tdd-workflow`, AI-OS: `test-driven-development`).

### The ECC plugin symlink

`install-ecc.sh` creates a single plugin-level symlink:

```
~/.claude/plugins/ecc → vendor/ecc/
```

Claude Code's plugin runtime reads `vendor/ecc/.claude-plugin/plugin.json` to discover the plugin's name, version, and entrypoints (skills, commands). It reads `vendor/ecc/hooks/hooks.json` to discover every hook. No additional registration is required.

---

## How to use it

### 1. Install (one-time)

```bash
# From a fresh AI-OS checkout:
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os

# Optional: vendor ECC (if vendor/ecc/ is missing)
[ -d vendor/ecc ] || git clone --depth=1 https://github.com/affaan-m/everything-claude-code.git vendor/ecc

# Run the standard AI-OS install first (sets up skills, MCP, dotfiles)
bash setup/install-mac.sh

# Then wire ECC into the 5 CLIs + Claude Code plugin runtime
bash setup/install-ecc.sh
```

You can run `setup/install-ecc.sh` **before** `install-mac.sh` — it's idempotent and the order doesn't matter. If you do, ECC skills still end up in `~/.claude/skills/` (so Claude Code sees them) but the AI-OS skills from `ai-config/skills/` will overwrite any name-collision when `install-mac.sh` runs.

### 2. Use ECC skills (existing workflows)

Once installed, every CLI sees the 271 ECC skills next to the 99 AI-OS skills. There is no separate CLI command — skills are loaded by name:

```text
Claude Code:    ask the model to "load the tdd-workflow skill"
Codex CLI:      same — "load the tdd-workflow skill"
Gemini CLI:     same
Hermes:         `hermes chat --skills tdd-workflow`
Antigravity:    same — by name
```

Examples of useful ECC skills now available:

| Skill | Use it for |
|---|---|
| `tdd-workflow` | Test-driven development cycles |
| `verification-loop` | Catch regressions before claiming done |
| `code-review-and-quality` | Pre-PR review checklist |
| `security-review` | Threat-model a change |
| `mcp-builder` | Write a new MCP server |
| `agent-harness-construction` | Build agent harnesses from scratch |
| `scientific-thinking-literature-review` | Academic-style research |
| `browser-qa` | End-to-end browser testing |
| `verification-loop` | Pre-completion sanity checks |

### 3. Use ECC as a Claude Code plugin

In Claude Code specifically, ECC loads as a plugin and exposes:

- **`/ecc-*` slash commands** (legacy command shims, see `vendor/ecc/legacy-command-shims/`).
- **Hooks** that fire on tool use (see [Hooks](#hooks) below).
- **Agents** you can invoke with `@agent-name` syntax.

Confirm with: open Claude Code and run `/plugin list` — you should see `ecc (v2.0.0)` enabled.

### 4. Update ECC

```bash
cd vendor/ecc
git pull
cd ../..
bash setup/install-ecc.sh   # refreshes symlinks
```

That's it. The symlinks point at `vendor/ecc/`, so once you `git pull` the new skill files are immediately visible to all 5 CLIs. The hook config in `hooks/hooks.json` is also picked up on the next Claude Code restart.

If you want to pin to a specific ECC version:

```bash
cd vendor/ecc
git fetch --tags
git checkout v2.0.0   # or whichever tag
cd ../..
bash setup/install-ecc.sh
```

---

## Hooks

ECC v2.0.0 declares its hooks declaratively in `vendor/ecc/hooks/hooks.json`. Claude Code's plugin runtime auto-loads them when it sees the `~/.claude/plugins/ecc` symlink — **no manual `~/.claude/settings.json` editing required**.

We counted **28 hooks** declared in `hooks.json`. They fall into these buckets:

### Auto-loaded (all 28)

These are loaded by the plugin runtime as soon as Claude Code starts:

| Hook ID | Matcher | Purpose |
|---|---|---|
| `pre:bash:dispatcher` | Bash | Consolidated Bash preflight (quality, tmux, push, GateGuard) |
| `pre:write:doc-file-warning` | Write | Warn on non-standard documentation files |
| `pre:edit-write:suggest-compact` | Edit/Write | Suggest manual compaction at intervals |
| `pre:observe:continuous-learning` | `*` | Capture tool-use observations for learning |
| `pre:governance-capture` | Bash/Write/Edit | Governance event capture (opt-in via env var) |
| `pre:config-protection` | Write/Edit | Block modifications to linter/formatter configs |
| `pre:mcp-health-check` | `*` | Sanity-check MCP servers on every tool use |
| `post:*` mirrors | — | Pair with each pre:* hook |

…and 20 more, covering things like desktop notifications, command-logging, cost tracking, statusline updates, and context monitoring.

### "Not enabled" — what we deliberately skip

AI-OS does NOT add any *additional* hooks to `~/.claude/settings.json`. Why?

- **Avoid double-registration.** Claude Code's plugin runtime loads the same hooks from `hooks/hooks.json`. Manually editing `settings.json` would cause hooks to fire twice.
- **Governance hooks** (`pre:governance-capture`) only activate when `ECC_GOVERNANCE_CAPTURE=1` is exported. This is intentional — we don't want AI-OS to silently start recording governance events the user didn't opt into.
- **Metrics hooks** (`ecc-metrics-bridge`, `cost-tracker`) are no-ops unless `ECC_METRICS=1` is set. Off by default to avoid telemetry the user didn't request.
- **The Cursor-specific hooks** under `vendor/ecc/.cursor/hooks/` are ignored entirely — AI-OS targets Claude Code / Codex / Gemini / Hermes, not Cursor.

If you want to disable a hook, edit `vendor/ecc/hooks/hooks.json` directly (the file is JSON; comment out the entry you want to suppress, or remove it). Re-run `bash setup/install-ecc.sh` to validate the JSON, then restart Claude Code.

If you want to skip the hook validation step in `install-ecc.sh` entirely (e.g., on a CI runner), run with `SKIP_HOOKS=1`.

---

## Script reference

```bash
# Full install (idempotent)
bash setup/install-ecc.sh

# Verify only — checks structure, plugin manifest, hooks.json, skill frontmatter.
# Does NOT touch the filesystem. Designed for CI.
bash setup/install-ecc.sh --check

# Simulate without writing anything
DRY_RUN=1 bash setup/install-ecc.sh

# Skip hook validation (CI mode)
SKIP_HOOKS=1 bash setup/install-ecc.sh

# Skip chrome-devtools-mcp install
SKIP_MCP=1 bash setup/install-ecc.sh

# Help
bash setup/install-ecc.sh --help
```

The script:

1. Verifies `vendor/ecc/` exists and contains `skills/` (fails fast with a vendoring hint if not).
2. Symlinks `vendor/ecc/` → `~/.claude/plugins/ecc`.
3. Symlinks every skill in `vendor/ecc/skills/` into `~/.claude/skills/`, `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`, and `~/.hermes/skills/imported/` (271 × 5 = 1,355 symlinks).
4. Validates `vendor/ecc/hooks/hooks.json` parses (counted 28 hooks).
5. Optionally installs `chrome-devtools-mcp` via `npm install -g` (skippable with `SKIP_MCP=1`).
6. In `--check` mode, verifies structure only: plugin manifest exists, skill frontmatter is well-formed, hooks.json parses.

---

## CI integration

The three platform workflows (`test-mac.yml`, `test-linux.yml`, `test-windows.yml`) run:

```yaml
- name: Verify ECC integration
  run: bash setup/install-ecc.sh --check
```

This validates that the vendored ECC is structurally sound — that `plugin.json`, `hooks.json`, and every `SKILL.md` are present and well-formed — without attempting to write anything to the ephemeral CI runner's `$HOME`. The step is **non-fatal** if `vendor/ecc/` is missing, because we don't want CI to fail on PRs that don't touch the ECC integration (most PRs).

---

## Troubleshooting

| Symptom | Cause | Fix |
|---|---|---|
| `vendor/ecc/ does not exist` | ECC not vendored yet | `git clone --depth=1 https://github.com/affaan-m/everything-claude-code.git vendor/ecc` |
| `/plugin list` doesn't show `ecc` | Plugin symlink missing | `bash setup/install-ecc.sh` |
| Hooks not firing | Plugin symlink broken or stale | `rm ~/.claude/plugins/ecc && bash setup/install-ecc.sh` |
| Skill not visible in a CLI | CLI-specific propagation step didn't run | Re-run `setup/install-mac.sh` step 5, then `setup/install-ecc.sh` |
| Permission errors on Windows | Symlinks need admin / Dev Mode | Enable Windows Developer Mode, or copy instead of symlink |
| `chrome-devtools-mcp` install fails | Node not installed | Install Node.js 18+ then re-run with `SKIP_MCP=0` (default) |

---

## Related files

- [`setup/install-ecc.sh`](../setup/install-ecc.sh) — the installer (this doc explains it).
- [`setup/install-mac.sh`](../setup/install-mac.sh) — runs first; sets up `~/.claude/skills/` from `ai-config/skills/`.
- [`vendor/ecc/VENDORED_FROM.md`](../vendor/ecc/VENDORED_FROM.md) — ECC's own provenance record.
- [`docs/cross-platform.md`](cross-platform.md) — symlink caveats on Windows.