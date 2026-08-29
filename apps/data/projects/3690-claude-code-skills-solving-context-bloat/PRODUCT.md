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

## Value Proposition

A solo developer running Claude Code on a real codebase hits the same workflows over and over — debugging an agent loop, designing an API, running a pre-merge security pass, sanity-checking a PRD. Without curated skills they hand-write the prompts each time. With this starter kit they `cp -r` five well-shaped SKILL.md files into `~/.claude/skills/` and the model loads them on demand, so each workflow is one short request away instead of a custom prompt.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo developer using Claude Code | Wants drop-in, opinionated workflows without writing each SKILL.md by hand. |
| Consultant building agentic products | Needs a reference skill structure (frontmatter, trigger conditions, steps, pitfalls) to fork for client work. |
| Indie author shipping their own skill pack | Treats the free tier as the credibility anchor for any paid tier they later publish. |
| HackerNews reader | Skims the README first to decide whether the free skills are visibly useful or generic filler. |

## Jobs To Be Done

1. **Functional job** — Install five working skills (debugging, API design, security review, PRD critique) in under a minute, on either Claude Code or Antigravity, without writing a single SKILL.md.
2. **Emotional job** — Stop second-guessing whether the model will handle a debugging or security-review request well, because a curated skill now exists for it.
3. **Social job** — Be able to point a colleague at a GitHub repo and say "this is what a good skill looks like" instead of forwarding a blog post.

## Success Metrics

- **Install time:** `git clone` + `cp -r` lands the five skills in under 60 seconds on a clean machine.
- **Discovery:** a developer asking the model "debug this agent" or "review this API for security" triggers the right SKILL.md to load without the user naming the skill explicitly (trigger phrases work).
- **Funnel signal:** paid 84-skill pack conversion rate from free starter kit clones; the HN comment that called the $49 pack "AI slop" is the credibility floor the free tier has to clear.
- **Contribution signal:** external pull requests that add a sixth skill following the existing structure, demonstrating the template is reusable.

## Pricing & Monetization

Free starter kit is MIT-licensed and contains no paid content. The author's paid tier is a separate 84-skill pack on Gumroad at $49 (per the source). The free kit's job is to be a credible lead magnet — it must work on its own, not be a watered-down teaser. If the project adds more free skills later, they should be released under the same MIT licence and live in the same repo so the trust contract holds.

## Competitive Landscape

- **Hand-written SKILL.md per project** — what most developers do today; works for one skill, does not scale to five.
- **Anthropic's official skills (claude-cookbook, anthropic-skills)** — small set, mostly targeted at Anthropic-internal workflows; the community is asking for opinionated, third-party skill packs.
- **Generic "awesome prompt" lists on GitHub** — copy-pasted prompts without the SKILL.md structure; the model cannot load them as skills.
- **Paid prompt bundles on Gumroad / Lemon Squeezy** — the same surface the author is selling into; the HN comment that called one "AI slop" sets the credibility bar.
- **OpenAI's GPT store, MCP servers** — a different distribution surface (conversational GPTs, MCP protocol); skills are CLI-side and orthogonal.

## Risks & Open Questions

- [ ] Trigger phrases may overlap with the model's defaults; validate empirically that asking "debug this agent" loads `agent-introspection-debugging` rather than producing a generic response.
- [ ] The HN commenter "cebert" dismissed the $49 pack as "AI slop" — the free tier must visibly avoid that perception, or the funnel to any paid pack collapses.
- [ ] Skill folder naming is part of the install contract (`cp -r` relies on it); any rename must ship a migration note or the documented install breaks.
- [ ] Cross-CLI compatibility: the README covers Claude Code and Antigravity. Confirm the SKILL.md frontmatter still loads correctly when copied to `~/.gemini/config/skills/` (vs Claude Code), or split the per-CLI installation into two READMEs.
