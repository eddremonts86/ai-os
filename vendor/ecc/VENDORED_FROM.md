# Vendored From

This directory contains a vendored copy of the **Everything Claude Code (ECC)**
plugin, included as a reference inside the ai-os repository.

## Source

| Field        | Value                                                              |
| ------------ | ------------------------------------------------------------------ |
| Repository   | https://github.com/affaan-m/ECC                                    |
| Upstream     | https://ecc.tools                                                  |
| Plugin name  | `ecc`                                                              |
| Version      | `2.0.0` (see `./VERSION` and `./.claude-plugin/plugin.json`)       |
| License      | MIT (Copyright (c) 2026 Affaan Mustafa — see `./LICENSE`)          |
| Date vendored | 2026-06-28                                                        |
| Vendored by   | ai-os maintainers (Phase 1 of the ECC integration plan)            |

## Why it is vendored

ECC ships a large library of agents, skills, hooks, commands, rules and
schemas that are useful as reference material and as the basis for selective
adoption inside ai-os. Vendoring (rather than depending on a git submodule or
network install) keeps the codebase fully self-contained, reproducible and
reviewable.

The plugin contents themselves are owned and authored by the upstream ECC
project; only the *decision* to include the snapshot and the integration
glue around it are ai-os work.

## Contents (top level)

Top-level directories and files that ship with the ECC snapshot, as vendored:

- `.agents/`, `.claude/`, `.claude-plugin/`, `.cursor/`, `.kiro/`,
  `.codebuddy/`, `.codex/`, `.codex-plugin/`, `.gemini/`, `.opencode/`,
  `.qwen/`, `.trae/`, `.zed/`, `.vscode/`
- `agents/`, `commands/`, `skills/`, `hooks/`, `rules/`, `scripts/`,
  `contexts/`, `docs/`, `examples/`, `integrations/`, `manifests/`,
  `mcp-configs/`, `plugins/`, `research/`, `scaffolds/`, `schemas/`,
  `tests/`, `src/`, `ecc2/`, `assets/`, `config/`, `legacy-command-shims/`
- Top-level files: `AGENTS.md`, `CHANGELOG.md`, `CLAUDE.md`,
  `CODE_OF_CONDUCT.md`, `COMMANDS-QUICK-REF.md`, `CONTRIBUTING.md`,
  `LICENSE`, `README.md`, `README.zh-CN.md`, `RULES.md`, `SECURITY.md`,
  `SOUL.md`, `SPONSORING.md`, `SPONSORS.md`, `TROUBLESHOOTING.md`,
  `VERSION`, `WORKING-CONTEXT.md`, `agent.yaml`, `ecc_dashboard.py`,
  `the-longform-guide.md`, `the-security-guide.md`,
  `the-shortform-guide.md`, plus JS/TS/Python config files
  (`package.json`, `pyproject.toml`, lockfiles, lint configs).

The `.git/`, `.github/`, `node_modules/`, `.cache/` and `dist/` directories
from the upstream clone are intentionally **not** vendored.

## How to update

To refresh the vendored snapshot to a newer upstream release:

1. Clone the upstream repo into a scratch location, e.g.

   ```sh
   git clone https://github.com/affaan-m/ECC.git /tmp/ecc-new
   ```

2. From the ai-os repo root, re-run the vendoring copy, preserving the
   exclude list:

   ```sh
   rsync -a \
     --exclude='.git' \
     --exclude='.github' \
     --exclude='node_modules' \
     --exclude='.cache' \
     --exclude='dist' \
     /tmp/ecc-new/ vendor/ecc/
   ```

3. Update the `Version` and `Date vendored` rows in the table at the top of
   this file.

4. Re-run a diff against the previous vendored snapshot to spot any
   surprising changes (`diff -ruN vendor/ecc.prev vendor/ecc | less`).

5. Review `vendor/ecc/CHANGELOG.md` and `vendor/ecc/.claude-plugin/plugin.json`
   to record notable changes in the ai-os release notes.

## License obligations

ECC is MIT licensed. When redistributing the vendored copy:

- Keep the upstream `LICENSE` file (already present at `vendor/ecc/LICENSE`)
  and the `Copyright (c) 2026 Affaan Mustafa` line intact.
- Preserve upstream copyright notices in any modified files.
- The MIT permission notice must accompany any substantial redistribution
  of the upstream code.

ai-os does not claim authorship of the vendored contents.
