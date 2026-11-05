# Vendored from sleekdotdesign/agent-skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/sleekdotdesign/agent-skills |
| Upstream path | `skills/design-mobile-apps/` |
| Author | sleek.design |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Commit | `aa88b4dc5b2e35def6e3a89df85a6461af66a4d0` |
| Commit date | 2026-09-05 |
| Vendored | 2026-09-26 |
| skills.sh listed name | `sleek-design-mobile-apps` — the real repo names the skill (and its own
  directory) `design-mobile-apps`; kept the upstream name rather than the directory
  listing's slug. |

## What was NOT vendored

- `README.md` and `assets/hero.png` — the repo's own promo material (the SKILL.md
  references the image by an absolute `raw.githubusercontent.com` URL, not a local
  path, so the local file isn't needed).

## Local modifications

None. `SKILL.md` is byte-identical to the vendored commit.

## Why this one

Design *principles* (gestures, safe areas, platform-appropriate "native feel") to sit
alongside the `expo-*` skills' build mechanics — the difference between a native app
that works and one that doesn't feel like it was ported from a website. The design
side of the same migration the `expo-*` batch covers the engineering side of.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/sleekdotdesign/agent-skills /tmp/sleek
diff /tmp/sleek/skills/design-mobile-apps/SKILL.md ai-config/skills/design-mobile-apps/SKILL.md
```

Port changes by hand; bump the commit table above.
