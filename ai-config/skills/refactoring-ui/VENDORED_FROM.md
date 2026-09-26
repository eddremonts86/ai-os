# Vendored from s0xDk/refactoring-ui-skill

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/s0xDk/refactoring-ui-skill |
| Author | s13k (@s13k_) |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `48872143abb0a8feb6d9bf58e222afbd800210b0` |
| Commit date | 2026-08-26 |
| Vendored | 2026-09-26 |
| Vendored subtree | entire upstream repo (`SKILL.md`, `references/`, `assets/`) |

## What was NOT vendored

- `README.md` — upstream's own install instructions (clone-to-`~/.claude/skills` for a
  standalone install). Not needed: AI-OS's own `README.md` / `docs/repo-layout.md` document
  where third-party skills live and how they propagate.
- `.git/` history — vendored as a snapshot, not a submodule, matching every other entry
  under `ai-config/skills/` (see `patterns-and-refactoring/VENDORED_FROM.md` for the same
  pattern).

## Local modifications

None. `SKILL.md`, `references/*.md` and `assets/tokens.css` are byte-identical to the
vendored commit.

## Why this one

Reviewed in full before installing (8 files, 28 KB, no scripts/hooks — pure Markdown +
one CSS file, nothing that executes). Fills a gap `taste-skill` explicitly leaves open:
`taste-skill` is scoped to landing pages / portfolios and excludes "dashboards / dense
product UI" by name. `refactoring-ui` is the framework-agnostic layer underneath any
aesthetic direction — fixed spacing/type/color/shadow scales, contrast minimums with the
exact WCAG numbers, and hierarchy through weight/color rather than size — and triggers on
general "this UI looks off / amateur" requests that `taste-skill` doesn't cover.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/s0xDk/refactoring-ui-skill /tmp/rui
diff -r /tmp/rui ai-config/skills/refactoring-ui --exclude=README.md --exclude=.git \
  --exclude=LICENSE --exclude=VENDORED_FROM.md
```

Port changes by hand; re-copy `LICENSE` over `LICENSE-UPSTREAM.md` and bump the table above.
