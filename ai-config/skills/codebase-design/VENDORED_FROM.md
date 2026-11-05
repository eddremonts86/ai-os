# Vendored from mattpocock/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/mattpocock/skills |
| Upstream path | `skills/engineering/codebase-design/` |
| Author | Matt Pocock (aihero.dev) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `c55ee46073ed923f86ce59a5eb3b6d895095d1b7` |
| Commit date | 2026-09-18 |
| Vendored | 2026-09-26 |

## What was NOT vendored

The rest of the upstream repo — see `git-guardrails-claude-code/VENDORED_FROM.md` in
this same `ai-config/skills/` for the full rationale on which 6 of its 36 skills were
picked and why the rest collide with skills AI-OS already requires.

## Local modifications

None. `SKILL.md`, `DESIGN-IT-TWICE.md`, `DEEPENING.md` and `agents/openai.yaml` are
byte-identical to the vendored commit.

## Why this one

Shared vocabulary for "deep modules" (Ousterhout, *A Philosophy of Software Design*):
where a seam goes, what makes an interface deep vs. shallow, how to make a module more
testable or AI-navigable. Distinct from `patterns-and-refactoring` (smell -> catalogued
technique -> smallest refactor) — this is about *interface design* before or instead of
refactoring, a gap nothing else in `ai-config/skills/` covers. Pairs with
`improve-codebase-architecture` (vendored alongside it), which scans for the deepening
opportunities this skill's vocabulary names.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp
diff -r /tmp/mp/skills/engineering/codebase-design \
  ai-config/skills/codebase-design --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
