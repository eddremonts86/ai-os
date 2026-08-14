---
id: "489"
slug: i-built-a-visual-api-test-builder-looking-for-honest-fe
title: I built a visual API test builder - looking for honest feedback
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo0i1x/i_built_a_visual_api_test_builder_looking_for/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, Node.js (Hono), PostgreSQL, Resend, Vercel]
---
# I built a visual API test builder - looking for honest feedback

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vo0i1x/i_built_a_visual_api_test_builder_looking_for/

Original post:

> Hey everyone I've been building a side project for a while now: a no-code tool for authoring and running API integration tests called 1Baton. The idea is that testing API flows shouldn't require writing boilerplate. You define your HTTP calls once, compose them into reusable sequences, then assemble those into runnable test cases called Playbooks. The mental model maps directly to how most teams already write Python test scripts, minus the code. It currently includes: A visual step editor for building API call sequences Variable passing between steps (e.g. capture an order ID from step 1, use it in step 3) Assertion checking on responses A run monitor that shows pass/fail per step in real time A browser-first execution engine — no setup required to test public APIs The whole thing runs in the browser right now, no sign-up required. Fair warning: it's MVP territory, so your work won't survive a page refresh yet. Persistence is coming, but for now just treat it as a sandbox. I've been staring at this thing for so long I genuinely can't tell what makes sense to a first-time user and what just feels obvious because I built it. So please tell me what sucks. A few things I'm specifically curious about: Does the Request → Sequence → Playbook mental model click, or is it confusing from the start? Was there a moment where you just gave up? What triggered it? Does this feel like something you'd actually reach for, or is it a solution looking for a problem? You don't need to build anything impressive. Spending 5 minutes and saying "I have no idea what I'm supposed to do here" is genuinely useful. Try it here: https://1baton.com Thanks to anyone who takes a look :) submitted by /u/Affectionate-Box3549 [link] [comments]

---

What this plan addresses: A visual API test builder that lets non-engineers construct and run API tests with drag-and-drop nodes.

## Objective

A visual API test builder that lets non-engineers construct and run API tests with drag-and-drop nodes. When I want to test an API without writing code, I want a visual builder where I drag in nodes for request, assertion, and response, so I can run a test in minutes.

## Target Users

- QA teams without deep coding skills
- Product managers who want to validate API behaviour
- Solo founders testing their own APIs without writing code

## MVP Scope

- Drag-and-drop test builder (request, assertion, response-handler)
- Run history with pass / fail timeline
- Shareable test links
- No code-generation export in MVP

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo0i1x/i_built_a_visual_api_test_` follows the constraints in `489-.../SPEC.md` and the chosen stack (Next.js, TypeScript, Node.js (Hono)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body explicitly describes a visual API test builder seeking feedback
- Plan keeps the visual + non-engineer framing
- Source did not name a price or target user
