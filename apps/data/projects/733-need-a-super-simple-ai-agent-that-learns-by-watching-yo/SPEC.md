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

## Problem

Marty, an "ordinary person" from the USA, writes that they spend hours every day on routine computer tasks — replying to similar emails, filling out spreadsheets, posting listings. They know AI agents exist but say the current options are "either complicated to set up, expensive, or require programming skills." They have already tried Scribe (which they describe as designed for businesses, not regular people), Ripplica, and Macro Recorder, and conclude there is no "install and forget" solution for a non-technical user. The pain is not the existence of automation; it is that the existing automation tools assume either a business buyer with a setup budget, or a power user who can write scripts. The author explicitly states a willingness to pay $10–30 per month for something that "learns by watching my screen, then does tasks just like I do," and the trust model matters to them: "if the agent does it exactly like me, that solves the problem."

## Objective

Ship a desktop install-and-forget AI agent for non-technical users on Windows and macOS that records the user's screen and audio, learns a small set of routines from a short demonstration, and replays them as autonomous workflows — without requiring a programming step, an API key from the user, or a setup screen beyond the install. Land inside the $10–30/month budget the author states, with the trust story that the agent's actions match the demonstration 1:1.

## Target Users

- Primary: non-technical knowledge workers (admin, sales ops, recruiting coordinators, freelancers) who do the same handful of multi-step computer tasks every day and have no scripting skill and no patience for an RPA tool designed for a process analyst.
- Secondary: small-business owners who are the de facto "ops person" and need a no-code way to teach a tool their workflow without paying for a UiPath / Power Automate seat.
- Tertiary: power users who would build their own scripts but want a faster demo-to-running path for routine work that is "not worth automating by hand" but recurs often enough to be annoying.

## MVP Scope

- Single desktop app (Electron on Windows + macOS) that runs locally, captures screen frames and mic/system audio at a configurable cadence, and stores the rolling 24 hours in a local SQLite index.
- "Show, don't tell" recording: the user clicks record, performs a routine once (e.g. open inbox, reply to message, save attachment), and the app segments the run into steps based on user actions (click, type, switch app) using accessibility / OS event hooks rather than re-deriving steps from pixels alone.
- Replay engine that runs the recorded routine on a trigger (manual button, scheduled time, or "when I open App X"); each step is executed via the same OS-level hooks, not by replaying coordinates against a pixel match.
- A natural-language "fix it" prompt on any step that failed, so the user can correct a step without re-recording from scratch.
- Local-first storage: the rolling buffer stays on disk, no cloud upload of frames or audio without explicit per-routine consent.
- One user per install in v1; no shared library of routines across teammates in the MVP.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author's stated budget cap is $30/month per seat; the product must be self-funding at that price without per-user cloud GPU spend (heavy inference stays opt-in or capped).
- No programming surface: the recording flow must work end-to-end without the user writing a single expression, regex, or script.
- Trust UX must be visible: each automated step shows what the agent is about to click / type and pauses for confirmation on the first three runs of a new routine, mirroring how the author says trust builds ("if the agent does it exactly like me").
- OS support is Windows + macOS only in v1; Linux is out of scope because the screen-capture and accessibility hooks needed for replay are too uneven across distros to keep the "install and forget" promise.
- Per-routine consent for any cloud upload; the local-first default is itself a constraint, not a switch the user has to find.
