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

## Tech Stack

- **Source format:** MDX — Markdown + JSX. Every slide is an MDX file in a directory.
- **Renderer:** A local Electron or Tauri app that reads the MDX directory, runs a live preview pane, and renders full-screen for the talk. The renderer must not require the user to have Node, npm, Git, or admin rights — those are explicitly out of the install path.
- **Bundler:** A precompiled MDX-aware bundler shipped as a single binary inside the app. The user runs the app, points it at a directory of MDX files, the app does the rest.
- **Templates and themes:** Community-contributed MDX components and CSS themes, distributed through the repo or a `templates/` directory in the project.
- **Sponsor / funding page:** GitHub Sponsors (in preparation).

The legacy AI-OS default stack (TanStack Start, Drizzle ORM, Coolify, Docker) is not used. The product is a desktop app for local MDX rendering; the build target is a downloadable binary, not a web app and not a self-hosted service.

## Architecture

```
                    ┌────────────────────────┐
                    │  OpenSlideX app        │
                    │  (Tauri / Electron)    │
                    │  - file watcher        │
                    │  - MDX parser          │
                    │  - live preview        │
                    │  - presenter mode      │
                    └──────────┬─────────────┘
                               │ reads
                               ▼
                    ┌────────────────────────┐
                    │  ./slides directory    │
                    │  01.mdx                │
                    │  02.mdx                │
                    │  components/           │
                    │  theme.css             │
                    │  slidex.config.json    │
                    └────────────────────────┘
```

The deck is the directory. The app is a renderer that reads MDX, renders a live preview, and presents full-screen. There is no backend, no cloud, no sync — the project structure is a git repo the user can share.

## Milestones

1. **M0 — One-command installer + first-run experience** (already live at `slidexdeck.com`) — macOS: `curl -fsSL … | sh`; Windows: PowerShell one-liner.
2. **M1 — MDX renderer** — parse MDX, render slides in a live preview pane, support for `components/` and a theme file.
3. **M2 — Presenter mode** — full-screen, keyboard navigation, presenter notes.
4. **M3 — Theme and template catalogue** — community-contributed themes, installable into the project directory.
5. **M4 — AI-agent author guide** — a short spec that says "to write a deck, write MDX files in this shape"; the format itself is the API.

## Risks

- **Curl-pipe-to-sh is a security smell.** A user who runs the install line is trusting the project's infrastructure. The MVP needs a pinned binary with an SHA published in the repo, and the install script has to surface that pin visibly.
- **MDX ecosystem churn.** MDX is a moving target (React 19, Next.js 15, the MDX 3 vs 4 split). The MVP needs a pinned MDX version and a compatibility matrix for common ecosystems.
- **No SaaS upgrade path.** The project is local-only and open-source by design. If a user wants cloud sync, co-editing, or a hosted version, there is no roadmap. That is fine for the MVP but caps the addressable audience.
- **GitHub Sponsors funding is unproven.** Sponsorship for an open-source presentation tool is long-tail; the MVP needs adoption metrics that survive the "stars but no sponsors" gap.
