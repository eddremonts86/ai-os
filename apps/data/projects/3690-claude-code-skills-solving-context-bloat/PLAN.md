---
id: "3690"
slug: claude-code-skills-solving-context-bloat
title: Claude Code Skills – Solving context bloat
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484600"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Markdown (SKILL.md), Bash installer, Claude Code / Antigravity drop-in directory, MIT-licensed repo]
---
# Claude Code Skills – Solving context bloat

## Tech Stack

- **Content:** five `SKILL.md` files written in Markdown with YAML frontmatter (`name`, `description` carrying a trigger phrase, `license: MIT`, `metadata.version`).
- **Distribution:** a public GitHub repository (`github.com/yevhens-hue/claude-skills-starter-kit`), MIT-licensed, with the skills under `claude-skills-starter-kit/skills/SKILL_NAME/SKILL.md` (one folder per skill).
- **Install:** plain Bash, no installer wizard. Two documented paths in the README: `cp -r claude-skills-starter-kit/skills/* ~/.claude/skills/` for Claude Code, and `cp -r claude-skills-starter-kit/skills/* ~/.gemini/config/skills/` for Gemini / Antigravity.
- **Versioning:** Git tags on the repo. Each SKILL.md carries its own `metadata.version` so a downstream user can tell which iteration of the skill they have.
- **Issues / PRs:** GitHub Issues + PRs as the contribution loop; no separate community platform.

## Architecture

The repo is the product. There is no backend, no auth, and no telemetry. Each SKILL.md is a self-contained Markdown file that the Claude Code or Antigravity runtime picks up by scanning the skills directory. The README is the only onboarding surface. The paid 84-skill pack is a separate Gumroad listing and is not part of this repo.

```
GitHub repo (yevhens-hue/claude-skills-starter-kit)
   └── claude-skills-starter-kit/
        ├── README.md   ← 30-second install + paid-pack link
        ├── LICENSE     ← MIT
        └── skills/
             ├── agent-introspection-debugging/SKILL.md
             ├── api-design/SKILL.md
             ├── security-review/SKILL.md
             ├── prd-critic/SKILL.md
             └── (one folder per skill, named after the skill)
                  │
                  ▼ user runs `cp -r`
        ┌──────────────────────────┐
        │  ~/.claude/skills/       │  (Claude Code)
        │  ~/.gemini/config/skills/│  (Antigravity)
        └──────────────────────────┘
                  │
                  ▼ runtime scan
             Claude Code / Antigravity loads SKILL.md on trigger
```

## Milestones

1. **M0 — Repo skeleton.** Public GitHub repo with `LICENSE` (MIT), `README.md`, and the `skills/` directory tree. End of day 1.
2. **M1 — Five SKILL.md files.** Each skill drafted with frontmatter, trigger conditions, numbered steps, and a pitfalls section. End of week 1.
3. **M2 — Install verification.** On a clean macOS and a clean Linux box, the documented `cp -r` lands the skills in the right directory and the runtime picks them up on the trigger phrase. End of week 2.
4. **M3 — Cross-CLI sanity check.** Same flow tested under Claude Code and under Antigravity; README updated with the per-CLI path. End of week 3.
5. **M4 — Show HN post.** Submission that links the repo and the Gumroad pack; track HN points and comment quality. End of week 3.
6. **M5 — First external contribution.** A PR from outside the author that adds or refines a skill, accepted and merged. End of week 6.

## Risks

- **Perceived as "AI slop".** A HackerNews commenter dismissed the paid pack as "AI slop". If the free tier reads like a generic prompt dump (long prose, vague steps, no pitfalls), the credibility of the whole project — free and paid — collapses. Each SKILL.md must be tight, opinionated, and load-bearing for one workflow.
- **Skill naming is load-bearing.** The documented `cp -r` install depends on the existing folder names (`agent-introspection-debugging`, etc.). Renaming a folder breaks the install for everyone who already cloned. Renames require a deprecation note + a compatibility shim.
- **Frontmatter drift across CLIs.** Claude Code and Antigravity may diverge on the SKILL.md frontmatter schema. The starter kit must either pin to the intersection or ship per-CLI skill files; either way, this is a maintenance surface.
- **No telemetry.** Without usage data, the author cannot tell which skills are being loaded and which are dead weight. Lightweight optional logging (e.g. a GitHub issue template asking users to report which skills they use) is the cheapest signal.
- **Paid-pack trust debt.** If the Gumroad 84-skill pack ages badly or reads as filler, the free kit inherits the reputation hit because they share the same author handle. The free kit must remain useful even if the paid pack disappears.
