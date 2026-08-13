# Vendored from cathrynlavery/diagram-design

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 7
propagates it to every CLI with no install-script change (it is a flat skill — `SKILL.md` at
the top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/cathrynlavery/diagram-design |
| Author | Cathryn Lavery |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Plugin version | 2.3.2 |
| Commit | `f3622cf66a3c557cb2ead57b687a3c1ff63f5a2b` |
| Commit date | 2026-08-12 |
| Vendored | 2026-08-13 |
| Vendored subtree | upstream `skills/diagram-design/` only |

## What was NOT vendored

Upstream is a full plugin repo; we take only the skill directory. Deliberately excluded:

- `.claude-plugin/`, `.codex-plugin/`, `.agents/plugins/` — marketplace manifests. AI-OS
  distributes via its own symlink flow, not `/plugin install`.
- `commands/` — the three slash commands (`export-diagram`, `import-drawio`,
  `import-mermaid`) resolve paths relative to the *plugin repo root*
  (`../skills/diagram-design/references/…`), which does not exist in this layout, so they
  would silently break. `SKILL.md` §11–§12 already route import and export on their own.
  If they are ever wanted, the paths must be rewritten first.
- `scripts/` (repo root), `docs/`, `.github/` — upstream's own CI, linters, and ADRs.

## Local deltas (intentional — a naive refresh reverts these)

`references/style-guide.md` is **rewritten**, not patched:

1. Skin replaced with the AI-OS brand palette from `context/06_brand.md` (dark-first;
   upstream ships light-first white-smoke + atomic-tangerine).
2. Typography swapped to the brand faces: Space Grotesk (sans) + JetBrains Mono (mono),
   Instrument Serif retained for `title`/`callout`. This **deliberately overrides** upstream's
   "never JetBrains Mono" rule — it is the actual brand mono. Documented inline.
3. `soft` in dark uses `oklch(0.60 …)` rather than the site's `faint oklch(0.56 …)`, which
   measures 4.27:1 and fails AA for the 9px sublabel text the role carries.
4. Light-register `accent` and `link` are darkened members of the acid/cyan hue families;
   the bright brand values are unusable as strokes on light paper.
5. `series-4` is a derived violet — the brand names only four non-accent hues, radar needs five.
6. Node treatment `backend` changed from hardcoded `#ffffff` to `paper-2`. The literal white
   was a light-mode assumption that renders as a blown-out box on dark paper.
7. "Customizing the skin" rewritten: onboarding must not be run per-project (see below).

`SKILL.md` §0 is **rewritten** — see below.

## Why §0 had to change

Upstream's first-run gate assumes a **per-project install**: on the first diagram it asks
whether to onboard your brand, then writes the answer into `references/style-guide.md`.

In AI-OS the skill is a symlink to this repo, shared by every project and all six CLIs. That
write would (a) change the skin globally, and (b) show up as a dirty diff in the AI-OS repo.
The gate is replaced by: brand is already onboarded, read `context/06_brand.md`; a project
needing a different brand drops `.ai-os/brand-tokens.md` in its own root.

## Refreshing from upstream

```bash
cd "$(mktemp -d)" && git clone --depth 1 https://github.com/cathrynlavery/diagram-design.git
```

Then diff upstream's `skills/diagram-design/` against this directory and port changes by hand.
**Do not `cp -R` over this directory** — it drops every delta listed above. In particular,
`references/style-guide.md` and `SKILL.md` §0 must be merged, never overwritten.

After any refresh: re-run `python3 scripts/self_check.py` against a generated diagram and
confirm the taste gate in `SKILL.md` §9 still references the AI-OS tokens.
