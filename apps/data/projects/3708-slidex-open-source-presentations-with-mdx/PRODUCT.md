---
id: "3708"
slug: slidex-open-source-presentations-with-mdx
title: SlideX – Open-source presentations with MDX
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49486406"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [MDX, local-first installer, AI-agent compatible]
---
# SlideX – Open-source presentations with MDX

## Value Proposition

A local-first, MDX-native presentation tool that installs with one command and lets AI agents author slides by writing files.

**One-liner:** Slides are MDX. MDX is the API.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developer-presenters | They already use MDX for docs; their slides can be the same shape, in the same repo, in the same diff. |
| Indie hackers and OSS maintainers | They want to give a talk without subscribing to a SaaS and without installing the Node toolchain. |
| AI-agent authors | They want slides an agent can write by editing files; the format is the API surface, no proprietary exporter needed. |

## Jobs To Be Done

1. **Functional job** — Write a slide deck as a directory of MDX files, run it locally, and present it from any laptop without installing Node.
2. **Emotional job** — Stop the "I have to choose between Keynote and a SaaS and a heavy web app" frustration when the question is just "I want to give a talk."
3. **Social job** — Share a deck by sharing a git repo or a zip of MDX files; the deck is the source, not an export of the source.

## Success Metrics

- **Activation:** GitHub stars and one-command install completions per release.
- **Retention:** Repeat deck authors per quarter — a developer who has shipped one deck and starts a second is the retention signal.
- **Revenue:** GitHub Sponsors (in preparation). The post does not commit to a SaaS or template-marketplace revenue shape; the funding is community-driven.

## Pricing & Monetization

GitHub Sponsors is being prepared; the landing copy names it explicitly. No SaaS tier, no template marketplace, no paid plan is mentioned in the source. The funding model is community sponsorship, not subscription.

## Competitive Landscape

The category includes Keynote / PowerPoint / Google Slides (closed), reveal.js (open but web-only and Node-heavy), Pitch (SaaS), Slidev (open, MDX-native, but requires Node). SlideX's stated differentiators are the one-command installer that needs no Node, the local-first workflow, and the AI-agent-friendly file format. The product does not name competitors on the landing page.

## Risks & Open Questions

- **One-command installer is a UX cliff.** A curl-pipe-to-sh install is a security anti-pattern; the source has to ship a transparent install script with a pinned binary, or the project will be flagged by anyone who reads the curl line.
- **MDX as a format lock-in.** MDX is the entire value proposition, but MDX is also the dependency the user is being asked to accept. If MDX itself loses momentum (the React-MDX ecosystem has had churn), the project inherits that risk.
- **No clear upgrade path.** The MVP is local-only. Cloud sync, real-time co-editing, and a SaaS are all out of scope. A user who wants any of those has to leave the project, which is fine for the MVP but caps the addressable audience.
- **Funding model is unproven.** GitHub Sponsors for an open-source presentation tool is a long-tail funding shape; the MVP needs to ship enough adoption to make the sponsor list non-trivial.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49486406) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
