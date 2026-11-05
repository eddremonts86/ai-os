# vendor/ecc — curated ECC subset

A trimmed copy of [Everything Claude Code](https://github.com/affaan-m/ECC)
(MIT, see `LICENSE`). Only the files AI-OS actually uses are kept; provenance
and local modifications are in `VENDORED_FROM.md`.

| Path | Used by |
| ---- | ------- |
| `skills/<name>/` (names in `DAILY_SKILLS.txt`) | `setup/install-mac.sh` 7e symlinks each into every CLI; `setup/verify.sh` counts them |
| `agents/{typescript-reviewer,vue-reviewer,build-error-resolver}.md` | `setup/install-mac.sh` 7f → `~/.claude/agents/`; `setup/verify.sh` 5d |
| `commands/{vue-review,build-fix}.md` | upstream originals of `ai-config/commands/` + `ai-config/skills/{vue-review,build-fix}` |
| `scripts/hooks/suggest-compact.js` + `scripts/lib/{utils,transcript-context,agent-data-home}.js` | `setup/wire-compact-hook.mjs` (install-mac 9e) → `~/.claude/scripts/hooks/` |

Keep the directory layout as-is: deployed symlinks point at these exact paths.

## Vendoring more from upstream

```sh
git clone --depth=1 https://github.com/affaan-m/ECC.git /tmp/ecc-upstream
git -C /tmp/ecc-upstream rev-parse HEAD          # record this SHA in VENDORED_FROM.md
cp -R /tmp/ecc-upstream/skills/<name> vendor/ecc/skills/   # or agents/<name>.md, etc.
```

Then:

1. For a skill, add its name to `DAILY_SKILLS.txt` (the only list; install-mac.sh
   and verify.sh both read it). For an agent, add it to `ECC_DAILY_AGENTS` in
   both `setup/install-mac.sh` (7f) and `setup/verify.sh` (5d).
2. Check the new files do not reach outside their own directory (`../`,
   `require('../lib/...')`, `${CLAUDE_PLUGIN_ROOT}`); copy any dependency at the
   same relative path.
3. Add a dated line to `VENDORED_FROM.md` with the upstream SHA.
4. Run `bash setup/install-mac.sh` (or just its 7e/7f steps) and `bash setup/verify.sh`.

Refreshing an already-vendored skill is the same `cp -R` over the old directory —
re-apply the local modifications listed in `VENDORED_FROM.md` afterwards.
