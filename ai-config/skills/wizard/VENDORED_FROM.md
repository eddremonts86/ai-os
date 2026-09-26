# Vendored from mattpocock/skills

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 5
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/mattpocock/skills |
| Upstream path | `skills/engineering/wizard/` |
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

None. `SKILL.md`, `template.sh` and `agents/openai.yaml` are byte-identical to the
vendored commit.

## Why this one

Generates an interactive bash wizard that walks a *human* through steps an agent
cannot do itself — provisioning infra, setting up credentials/CI secrets, an unfamiliar
third-party dashboard, a one-off migration. No AI-OS skill covers this. This session hit
exactly that gap live: repointing Coolify's SSH deploy key needed the user to run a
`gh repo deploy-key add` command by hand, which is precisely the shape this skill
templates.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/mattpocock/skills /tmp/mp
diff -r /tmp/mp/skills/engineering/wizard \
  ai-config/skills/wizard --exclude=LICENSE-UPSTREAM.md --exclude=VENDORED_FROM.md
```

Port changes by hand; bump the commit table above.
