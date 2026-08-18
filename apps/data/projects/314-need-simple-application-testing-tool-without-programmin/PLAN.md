---
id: "314"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/1ic9wdywx1-need-simple-application-testing-tool-without-p"
category: dev
date: "2025-10-29"
tags: [Dev, QA, Other]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, Playwright headless browser farm, M-Pesa Daraja API, Hetzner]
---
# Need simple application testing tool without programming

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the operator console.
- Postgres on Hetzner for projects, test definitions, runs, screenshots.
- Playwright headless browser farm on Hetzner for replay execution.
- Chrome extension (Manifest V3) for the recorder.
- GitHub Actions integration for replay-on-push.
- Slack + WhatsApp Business API for failure notifications.
- M-Pesa Daraja API for KES payments.

## Architecture

Chrome extension records the user's session into a step list with element selectors; the test definition is uploaded to the platform. On replay (manual or via GitHub push), the platform's Playwright farm runs the test in headless Chromium, takes a screenshot per step, and compares against the baseline. Failures surface as Slack/WhatsApp messages with the failing step and the screenshot diff. Operator console (Next.js) hosts the project list, run history, and assertion editor.

## Milestones

1. **M0** — Spec freeze, Chrome recorder MVP, single-project smoke test. End of week 1.
2. **M1** — Assertion editor + replay on demand. End of week 4.
3. **M2** — Screenshot diff + GitHub Actions integration. End of week 7.
4. **M3** — Slack + WhatsApp notifications + M-Pesa Daraja payments. End of week 10.
5. **M4** — Pilot with 30 Kenyan dev teams; measure time-to-first-test at week 12.

## Risks

- **Recorder flakiness** — Mitigation: deterministic selector strategy; explicit waits for network-idle.
- **Playwright farm cost at scale** — Mitigation: spot-instance Hetzner farms with auto-shutdown.
- **M-Pesa Daraja sandbox-to-live** — Mitigation: full sandbox walk-through with Safaricom dev support.
