# Vendored from benjitaylor/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 7 links it into every CLI.

| Field | Value |
|---|---|
| Upstream | https://github.com/benjitaylor/skills (`stageshow/`) |
| Author | Benji Taylor |
| License | MIT (see `LICENSE`); app icons and brand marks keep their owners' terms (see `NOTICE.md`) |
| Version | 1.1.1 (SKILL.md metadata) |
| Commit | `299140fafd08df55a9c234e610c3f64af3f45531` (2026-11-04) |
| Vendored | 2026-11-18 |
| Vendored subtree | upstream `stageshow/` whole |
| Upstream subtree hash | `79a9596bae5cf920edce397a13a822d3bd06b452f3cc2f4c0db2b4b2ccbf930b` (sha256 of the sorted per-file sha256 list, before the edit below) |

Vetted 2026-11-18 by reading the source: no prompt injection, no network calls, no remote code. `scripts/dev.mjs`
spawns the local Vite (through the optional `portless` package on macOS/Linux); `scripts/film.mjs` drives the
locally installed Chrome through `playwright-core` (`CHROME_PATH` overrides it) to film demos. `npm install` inside
this folder fetches React, Vite, TypeScript and playwright-core from npm; its `node_modules` is git-ignored.

## What it is for

Faux product UI for marketing pages: a still or a short animated cursor demo of one app screen, framed for a hero,
a feature card or a bento tile, built with its React kit (`kit/`) from the closest of ~40 gold examples and filmed
frame by frame (`--gate`) before hand-over. AI-OS routes it from `rules/always_do.md` item 26.

## Used in AI-OS

`apps/site` hero: `apps/site/src/stageshow/` (the demo, the kit files it imports, and its `REHEARSAL.md`).

## Local modifications

- `SKILL.md`: the frontmatter `description` trimmed from 612 to under 350 characters (AI-OS's cap,
  `setup/tests/test_ai_os_skills.py`); the upstream text is quoted under the title.

Refresh by re-copying upstream `stageshow/`, re-applying the edit, and updating the commit and hash above.
