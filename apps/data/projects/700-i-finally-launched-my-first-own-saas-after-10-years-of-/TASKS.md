---
id: "700"
slug: i-finally-launched-my-first-own-saas-after-10-years-of-
title: I finally launched my first own SaaS after 10+ years of building software for others
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0u1v/i_finally_launched_my_first_own_saas_after_10/"
category: saas
date: "2026-08-16"
---
# I finally launched my first own SaaS after 10+ years of building software for others

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/700-i-finally-launched-my-first-own-saas-after-10-years-of-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

The product exists; the source is the founder's "almost launched" post asking for positioning and UI/UX feedback. The pre-launch work in scope for this plan is the slice that converts the captured spec into shippable reality:

- [ ] Land the public sign-up and a first-time flow that creates a QR, points it at a URL, and downloads PNG/SVG art that encodes a stable Sqanna short URL (so the art never goes stale).
- [ ] Build the edit-destination console so the owner can change the destination of any QR and see the change live within seconds.
- [ ] Ship the headline differentiator: scheduled destinations. A QR can hold multiple URLs and rules (day-of-week × time-of-day) so the same printed art routes to breakfast / lunch / dinner / weekend pages automatically.
- [ ] Add basic scan analytics — at minimum a per-QR daily scan count — so the operator can tell whether the printed art is doing anything.
- [ ] Decide and publish the free / paid split, with at least one obvious gate (QR count, scan history depth, or scheduled-destination support). The source author sets the price; this plan does not invent one.
- [ ] Run a UI/UX review pass before public launch — the founder has flagged AI-assisted design and asked for community feedback, so this is in scope, not optional.
- [ ] Lock the "smart QR" definition in one sentence on the landing page. If a stranger cannot tell what makes Sqanna different from a URL shortener in five seconds, the positioning is not ready.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-16_
