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

## Tech Stack

Desktop app for local authoring (React + TypeScript + TanStack Start), cloud service for execution (real iOS + Android device farm with WebDriver/Appium-style driver layer under Vision AI), SQLite-via-Drizzle for the workspace + suite + run metadata. The post mentions a "desktop app for quick local authoring and a cloud service for scalable, reliable execution" — that two-piece split is the architecture. Vision AI sits between the plain-English step and the device-driver layer, interpreting each step into a device action and recovering when the UI changes.

## Architecture

- **Desktop app** (TanStack Start + React): plain-English test editor, local app upload, local run on a single attached device for fast iteration.
- **Cloud service** (managed): real iOS + Android device fleet, parallel run scheduling, run-history persistence.
- **Vision AI layer**: a hosted or local model that takes (screenshot + plain-English step) → (device action: tap x,y / swipe / type / scroll). Self-healing compares against the previous successful action and re-locates when the UI shifts.
- **Device driver layer**: WebDriver / Appium-style bridges to iOS and Android. The plain-English step is interpreted twice — once by the Vision AI into a target action, once by the driver into the device command.
- **Workspace + suite + run management**: a TanStack Start API backed by SQLite (Drizzle) for metadata; runs and screenshots go to object storage.
- **CI/CD integration**: GitHub Actions / GitLab CI runners pull the suite by ID, report status, attach run artifacts.
- **Debuggable failure reports**: every run produces a step-by-step trace with screenshots, the interpreted action, the actual UI element found, and a heal audit if the Vision AI re-located something mid-run.

## Milestones

1. **M0 — Desktop authoring + local run (3 wk).** TanStack Start + React desktop app. Plain-English test editor. Single attached iOS or Android device for local execution. Internal alpha.
2. **M1 — Vision AI interpretation (3 wk).** Train / fine-tune / vendor the vision model. Interpret plain-English steps into device actions. Validate against a corpus of 50 mobile UI patterns.
3. **M2 — Self-healing (2 wk).** Compare past successful action against current UI, re-locate when shifted. Heal audit row per recovery. Validate stability against a UI-mutation corpus.
4. **M3 — Cloud device fleet (4 wk).** Provision real iOS + Android devices. Parallel run scheduling. Run history + artifact storage. Internal beta with 2 design-partner teams.
5. **M4 — CI/CD integration (2 wk).** GitHub Actions + GitLab CI surfaces. Status reports + run artifact links. Public beta.
6. **M5 — Pricing + paid tier (1 wk).** Per-workspace subscription + usage-based device-time. Validate with 5 QA-team interviews; pin the price.

## Risks

- **Plain-English → stable action fidelity.** If the Vision AI silently produces brittle actions, the self-healing claim collapses. The MVP must bound the supported UI patterns (tap / swipe / type / scroll) and document the boundary.
- **Self-healing must be auditable.** Silent healing breaks the "debuggable failure reports" line. A heal-audit row per recovery is non-negotiable.
- **Cloud device cost.** Real iOS + Android devices are expensive. The MVP needs an honest usage-based pricing model or the cloud tier's gross margin disappears.
- **Vision AI vendor dependence.** If the cloud tier depends on a hosted vision model (GPT-4V, Gemini), outages / cost spikes become customer-visible. The MVP needs an offline-capable local model fallback or a clear SLA.
- **iOS + Android parity.** A test that requires per-platform rewrites breaks the post's "same flows on iOS and Android" promise.
- **WTP signal absent.** The post names no price. Until 5 QA-team interviews confirm a price point, treat the 5.5 Money ceiling as anchored on the workflow-shape only.