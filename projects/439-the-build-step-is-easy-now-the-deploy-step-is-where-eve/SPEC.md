---
id: "439"
slug: the-build-step-is-easy-now-the-deploy-step-is-where-eve
title: "The build step is easy now, the deploy step is where every small tool dies"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0mio/the_build_step_is_easy_now_the_deploy_step_is/"
category: saas
date: "2026-08-14"
tech: [Vite, TypeScript, Node.js (Hono), Docker, Caddy, Hetzner, GitHub Actions]
---
# The build step is easy now, the deploy step is where every small tool dies

## Problem

Source: https://www.reddit.com/r/SaaS/comments/1vo0mio/the_build_step_is_easy_now_the_deploy_step_is/

Original post:

> I've been watching a pattern with everyone building small tools with AI (lovable, bolt, cursor, claude code, whatever) and it's always the same failure point. The thing gets built fast. you're proud of it. then you go to actually show it to someone and all you have is localhost. So you consider deploying to some cloud provider, probably Vercel, but that not only feels like an overkill, it means opening it up to the public unless you build auth. Two things i've come to believe from this: the deploy/hosting step is the actual bottleneck for small software now, not the building. Building got cheap. the last mile didn't. Personal hosting feels like an unsolved problem. I imagine a world in which ordinary people build, deploy, and host personal tools the way they make a spreadsheet today: for themselves, in an afternoon, without asking a developer and without ever seeing a server. Curious how others here are handling this. when you build a small internal tool or side project, what's your actual path from "it works locally" to "a real person can open a link and use it"? and how do you deal with the free tiers evaporating (railway, fly, netlify all gutted theirs)? submitted by /u/NotoriousSR [link] [comments]

---

What this plan addresses: One-command self-hostable deploy for small tools that does not assume Kubernetes, Docker compose fluency, or a PaaS.

## Objective

A one-binary deploy tool for small tools that does not assume the operator wants to learn Docker compose or Kubernetes. When I have built a small tool and want it to stay alive on the internet, I want one command that takes a Git URL and a domain and returns a running HTTPS service, so I do not die at the deploy step.

## Target Users

- Solo developers shipping small tools who got past "build" but stall at "deploy"
- Non-DevOps founders running a tool they want to keep alive for years
- Small teams tired of Vercel / Railway bills for a side project that earns $20/mo

## MVP Scope

- Single binary `deploy-it` that takes a Git URL and a domain and produces a running HTTPS service
- Built-in Caddy for TLS, automatic cert renewal
- Systemd unit file generated and installed by the binary
- Health check + restart policy baked in
- No Kubernetes, no Docker compose required by the user

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vo0mio/the_build_step_is_easy_now_the_de` follows the constraints in `439-.../SPEC.md` and the chosen stack (Vite, TypeScript, Node.js (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body explicitly says "the deploy step is where every small tool dies"
- Plan addresses that exact pain: a one-binary deploy tool
- Source did not name a hosting provider, OS, or cost
