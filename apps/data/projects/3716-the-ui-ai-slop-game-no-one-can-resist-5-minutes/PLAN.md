---
id: "3716"
slug: the-ui-ai-slop-game-no-one-can-resist-5-minutes
title: The UI AI-Slop game. No one can resist 5 minutes
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488507"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Game, UI, AI]
tech: [Vanilla JavaScript, HTML, CSS, WebAudio, Canvas]
---
# The UI AI-Slop game. No one can resist 5 minutes

## Tech Stack

Chosen for a no-build-step single page: everything ships as static assets, and the clock, audio, and level logic live in the browser itself.

- **Vanilla JavaScript:** level logic, the timer, and leaderboard reads and writes with no framework overhead.
- **HTML:** one page per surface — game shell, leaderboard, lab submission form, profile pages.
- **CSS:** the deliberate slop styling per level plus the deliberately understated chrome around the game.
- **WebAudio:** audio cues a level is allowed to play, with no external files.
- **Canvas:** any level that needs drawn interaction without the DOM.

## Architecture

- **Level registry:** 48 named patterns plus three hidden ones, each a self-contained module with its own DOM and win condition.
- **Clock:** a five-minute timer that never pauses, with a per-level skip.
- **Mercy mode:** toggles out levels requiring microphone, camera, or motion and drops the four punishing modifiers; results post to a separate leaderboard.
- **Leaderboard:** seeded runs (federico_sciuca, em, Itos) plus new submissions keyed by handle and seed so replays are verifiable.
- **Lab intake:** visitor-submitted levels are reviewed and shipped with the author's handle attached.

## Milestones

1. **M0 — All 48 levels playable.** Every named specimen is solvable, and the clock, skip, and level-completion loop work on desktop browsers.
2. **M1 — Mercy mode and leaderboards.** The separate mercy board, the seeded runs, and handle submissions land.
3. **M2 — Profiles and replays.** Public profile pages let any visitor replay a seeded run and try to beat its score.
4. **M3 — Lab opens.** The community level submission flow ships the first accepted levels with their authors' handles.

## Risks

- **Timer throttling:** Safari and Chrome background-tab throttling can freeze the clock; the five-minute promise must survive it.
- **Permission friction:** microphone, camera, and motion levels must fail gracefully into mercy mode rather than blocking the run.
- **Lab moderation:** without a policy the lab ships spam levels; the policy has to exist before submissions open.
- **Leaderboard abuse:** handles can be spoofed without identity; seed-keyed runs mitigate but do not eliminate it.
- **Scope creep:** hidden levels and punishing modifiers add surface without changing the core recognition loop.

## Data Model

- Level: id, name, required permissions, mercy-excluded flag, win condition.
- Run: handle, seed, elapsed time, mercy flag, finished levels.
