---
id: "733"
slug: need-a-super-simple-ai-agent-that-learns-by-watching-yo
title: Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/0jcnxkipi1-need-a-super-simple-ai-agent-that-learns"
  captured: "2026-07-17"
category: ai
date: "2026-07-17"
tags: [AI, Productivity, Other]
country: USA
wtp:
  raw: $10–30/month
  currency: USD
  min: 10
  max: 30
  period: month
  mrrMid: 20
tech: [Electron, Node.js, OS-level screen capture (DXGI on Windows, CoreGraphics on macOS), screenpipe-style local frame+audio pipeline, OpenAI/Anthropic vision LLMs, local-only SQLite history]
---
# Need a super simple AI agent that learns by watching your screen and automates routine tasks. Existing solutions are complex or expensive. Willing to pay $10–30/month.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A non-technical user installs one desktop app, demonstrates a routine once by clicking through it as normal, and the agent replays the same routine later on a schedule, on a trigger, or on a "do this now" button — without the user writing a script, configuring an RPA flow, or paying a process-analyst-tier seat price. The author explicitly framed the trust gap ("if the agent does it exactly like me, that solves the problem"); the product's first three runs visibly pause for confirmation so the user can see what will happen before it happens.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Non-technical knowledge worker | Already knows they waste hours on email replies, spreadsheet fills, listing posts; current automation assumes either a business seat or a programming skill. |
| Small-business owner acting as ops | Needs a no-code way to teach a tool their own workflow without paying for UiPath / Power Automate. |
| Power user with no time to script | Wants the demo-to-running path to be faster than writing the macro themselves, even if they could. |

## Jobs To Be Done

1. **Functional job** — Get a recurring multi-step computer task done without doing it again, without learning a scripting language.
2. **Emotional job** — Stop feeling that routine work is the price of having a job; trust that the agent will do it like the user did it on the demo.
3. **Social job** — Be the person at work who "automated the thing" without needing to explain a flow chart.

## Success Metrics

- **Activation:** ≥ 50% of trial users record and successfully replay at least one routine within 7 days of install.
- **Time-saved:** Median user-reported minutes saved per week ≥ 120 by week 4, matching the "hours every day" pain the source describes.
- **Trust:** Confirmation-pause opt-out rate (users who actively turn off the per-step pause after the third run) ≥ 30% by week 8, indicating they trust the replay.
- **Retention:** Week-8 retention ≥ 40% of activated users; the agent only earns its keep if the user keeps opening it.

## Pricing & Monetization

Mirror the author's stated $10–30/month range as a single tier with an annual discount. $19/month monthly, $15/month billed annually, 7-day free trial with the first routine unlimited. The cloud-LLM path is metered inside the subscription up to a fair-use cap so the user does not bring their own API key — keeping the "no programming skill" promise intact.

## Competitive Landscape

- **Scribe** — what the author already tried; framed as a "business" tool, too heavy for a single non-technical user.
- **UiPath / Power Automate** — the de facto standard, but the price floor and the process-modeller UI are built for analysts, not for the poster's persona.
- **Microsoft Copilot / Apple Intelligence automations** — vendor-bundled, tied to one OS / one suite; do not generalise across the apps a freelancer uses.
- **Zapier + browser extension macros** — web-first, brittle on desktop apps; do not cover the spreadsheet + email + listing mix the author describes.
- **littlebird.ai** — flagged in the source comments as addressing the same pain; the differentiation will need to be sharper than just "us too".

## Risks & Open Questions

- [ ] Decide whether the agent's action surface is read-only by default and the user explicitly grants write permissions per app — the author named "trust" as the central issue, and an over-broad default could torpedo adoption.
- [ ] Confirm the OS-level accessibility hooks used for replay are robust enough on both Windows (UIA) and macOS (AXUI) to survive a routine across two app updates; pixel-based replay is out, but even event-based replay breaks when an app renames a control.
- [ ] Validate that the cloud-LLM cost per active user per month fits inside a $19 ARPU; if not, the natural-language "fix it" prompt is the most expensive feature and may need to be capped or downgraded to a smaller model.
- [ ] Settle the privacy story for screen capture before launch — recording the screen, even locally, requires a consent flow that respects OS-level screen-recording permissions on macOS and Windows, and the wording in the install flow needs legal review.
