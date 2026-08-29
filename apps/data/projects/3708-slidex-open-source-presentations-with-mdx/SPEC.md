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

## Problem

Existing presentation tools are either closed (Keynote, PowerPoint, Google Slides) or web-only and heavyweight (reveal.js decks, Pitch). The author wants a presentation tool that is open-source, builds around MDX so slides are real code (JSX + Markdown), runs locally without a Node.js / npm / admin install path, and is friendly to AI agents that need to write slides.

The HN post is one line: "I designed SlideX, an open-source presentation tool built around MDX, with a local-first workflow and support for AI agents." The landing page at `slidexdeck.com` makes the install path concrete: "One command installs OpenSlideX as a complete local app. No Node.js, npm, Git, or administrator access required. macOS: `curl -fsSL … | sh`. Windows: PowerShell." The "Useful Indie Hacker community" attribution at the bottom of the page and the GitHub Sponsors preparation block make the funding shape clear — this is a community project, not a VC-funded SaaS.

## Objective

Make MDX the format for slide decks, ship a one-command local installer that needs no developer tooling on the user's machine, and write the project so AI agents can author slides by editing files.

## Target Users

1. **Developer-presenters** — engineers who already use MDX for docs (Vite, Docusaurus, Contentlayer) and want their slides to be the same shape as the rest of their writing.
2. **Indie hackers and OSS maintainers** — anyone who wants to give a talk without subscribing to a SaaS and without installing the Node toolchain.
3. **AI-agent authors** — anyone whose AI agent should be able to produce a slide deck by writing MDX files; the format is the API surface.

## MVP Scope

- MDX-as-source: every slide is an MDX file, so the deck is a directory in version control.
- One-command local installer: a curl-piped shell script for macOS, a PowerShell script for Windows. No Node, no npm, no Git, no admin required.
- Slide editor that runs locally — read MDX, render slides, support live preview.
- AI-agent-friendly: the project structure is a directory of MDX files plus a small config, so an agent can write a deck by writing files.
- Open-source distribution via GitHub.
- Out of scope for MVP: cloud sync, real-time co-editing, a hosted SaaS, themes marketplace.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The install path must work without Node, npm, Git, or administrator rights. The product's hook is "open a terminal and paste one line".
- Slides are MDX. No proprietary format, no migration path off MDX, no escape hatch.
- Open-source license. The author is preparing GitHub Sponsors; the project is funded by the community, not by a SaaS tier.
- Local-first: no telemetry, no cloud sync, no required account.
