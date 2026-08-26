---
id: "3096"
slug: drizz-automate-mobile-app-testing-with-plain-english-an
title: Drizz – Automate mobile app testing with plain English and Vision AI
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/drizz?utm_campaign=startup-184122&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-26"
tags: [BetaList, Beta, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Drizz – Automate mobile app testing with plain English and Vision AI

## Problem

Drizz is a mobile test automation platform that lets QA teams write tests in plain English and run them on real devices using Vision AI. It self-heals when UIs change, reduces flakiness, and provides detailed, debuggable failure reports. Teams can manage apps, suites, and runs in one place, integrate with CI/CD, and run the same flows on iOS and Android. Drizz includes a desktop app for quick local authoring and a cloud service for scalable, reliable execution. View startup

---

## Objective

Let a QA team write mobile tests in plain English and run them on real iOS + Android devices, with the platform handling the Vision AI interpretation, self-healing on UI changes, and a debuggable failure report. The BetaList post frames the workflow as three pieces — plain-English authoring, real-device execution, and CI/CD integration — with a desktop app for fast local authoring and a cloud service for scaled runs.

## Target Users

1. **QA engineers at mobile-first B2C/B2B apps** — teams that own the test suite and need it to keep running as the app changes. The "self-heals when UIs change, reduces flakiness" line is the explicit pain.
2. **Engineering managers who own mobile release confidence** — the seat that signs off on the merge when the test suite is green. The "detailed, debuggable failure reports" line is the trust cue.
3. **Mobile-app founders without a dedicated QA hire** — small teams that need test coverage but cannot justify a full QA team. The plain-English authoring is the entry door.

## MVP Scope

- Plain-English test authoring: tests written as natural-language steps, interpreted by Vision AI against the live device screen.
- Real-device execution: iOS + Android device farm (the post's "real devices, same flow on iOS and Android").
- Self-healing: when UI elements shift (renamed, repositioned), the Vision AI re-locates them so the test keeps passing.
- App / suite / run management in one place: list apps, organize suites, trigger runs, see history.
- CI/CD integration: GitHub Actions / similar surfaces that pull the suite + report status.
- Desktop app for local test authoring and review.
- Cloud service for scalable, parallel execution.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Real devices" must be real, not emulators/simulators. The post's "run them on real devices" is the credibility line; emulator-only execution breaks it.
- Plain-English authoring must round-trip — write "tap the login button, type 'alice@example.com', tap submit" and have the platform produce a stable, repeatable script. If the platform silently translates to brittle selectors, the self-healing claim collapses.
- Self-healing must report what it healed, not just "test passed." The "debuggable failure reports" line in the post is the trust contract — silent healing is the same as silent failure.
- iOS + Android parity: a test written in plain English must run on both without rewrites. The post's "same flows on iOS and Android" is the parity promise.