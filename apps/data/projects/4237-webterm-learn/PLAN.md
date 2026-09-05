---
id: "4237"
slug: webterm-learn
title: WebTerm Learn
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/webterm"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# WebTerm Learn

## Tech Stack

- **A browser-based learning surface** at webterm.app, with hand-drawn slides and a real in-browser sandbox.
- **An in-browser terminal sandbox** that runs the learner's commands in an ephemeral environment the learner cannot break.
- **A 3D world map** that the learner progresses across as the learner completes lessons.
- **A companion-evolution mechanic** that evolves the companion as the learner advances.
- **A lesson-check surface** that runs the learner's command and surfaces a friendly correction when the learner makes a mistake.
- **A no-signup onboarding** — the learner reaches the first lesson without creating an account.
- **A free-access surface** — every lesson the learner reaches is free.
- **A four-topic curriculum** — Linux commands, Git workflows, Vim, and CLI-based AI tools.
- **A beta feedback loop** — feedback is welcome per the source's launch message.

## Architecture

The architecture has three surfaces: the lesson surface (slide + sandbox + check), the 3D-map surface (progression + companion evolution), and the onboarding surface (no-signup, free, ephemeral).

The lesson surface is where the learner practises. The hand-drawn slide teaches the concept; the sandbox runs the learner's command; the check surface runs the lesson's grader and surfaces a friendly correction. The sandbox is ephemeral — it resets when the learner leaves the lesson — so the learner cannot break the machine.

The 3D-map surface is where the learner sees progression. The map is a 3D world the learner crosses as the learner completes lessons; the companion evolves as the learner advances. The 3D map is the unit of trust the learner sees; the lesson surface is the unit of practice.

The onboarding surface is structural. The learner reaches the first lesson without signing up; every lesson the learner reaches is free; the sandbox resets when the learner leaves. No account, no email, no subscription. The plan does not invent an account system the source does not name.

The lesson check surface is the unit of feedback the learner sees. The check runs the learner's command in the sandbox and surfaces a friendly correction when the learner makes a mistake. The check is the structural reason the learner keeps practising.

## Milestones

1. **M1 — Onboarding surface** — no-signup, free, ephemeral, the learner reaches the first lesson without an account.
2. **M2 — Lesson surface** — the hand-drawn slide, the in-browser sandbox, the lesson check, the friendly correction.
3. **M3 — Four-topic curriculum** — Linux commands, Git workflows, Vim, CLI-based AI tools; 12 courses, 129 lessons.
4. **M4 — 3D world map** — the progression surface, the companion evolution, the per-lesson advance.
5. **M5 — Ephemeral-sandbox guarantee** — the sandbox resets when the learner leaves the lesson, the structural no-network guarantee.
6. **M6 — Beta feedback loop** — the surface that collects the learner's feedback, the triage, the roadmap (public or private).
7. **M7 — Free-access surface** — every lesson free, no paywall, the launch curriculum complete.

## Risks

- **Sandbox correction gap** — a learner mistake the sandbox misses is uncaught. Mitigation: the sandbox correction rate is a first-class metric; the lesson check is unit-tested against mistake-heavy fixtures; a regression surfaces visibly with a "lesson check may miss some mistakes" warning.
- **Ephemeral-sandbox regression** — the sandbox persists between lessons and the learner breaks the environment. Mitigation: the ephemeral-sandbox verification is a metric; the sandbox reset is unit-tested; a regression is a release blocker.
- **3D-map progression gap** — a learner stuck on the first lesson cannot advance across the 3D map. Mitigation: the 3D-map progression rate is a metric; the lesson surface surfaces a "skip this lesson" path the learner can request; the progression gap is the unit of trust.
- **No-signup regression** — a signup screen surfaces and the learner cannot reach the first lesson. Mitigation: the no-signup verification is a metric; the onboarding surface is unit-tested; a regression is a release blocker.
- **Free-access regression** — a paywall surfaces and the learner cannot reach a lesson. Mitigation: the free-access verification is a metric; the lesson surface is unit-tested; a regression is a release blocker.
- **Beta feedback overload** — the beta feedback loop fills with submissions the team cannot triage. Mitigation: the team surfaces a public roadmap of accepted feedback; the triage is public; the learner sees the queue.
- **Future fifth-topic scope creep** — the source lists Linux, Git, Vim, CLI-based AI tools; a future launch adds a fifth topic the plan does not invent.
