---
id: "3593"
slug: ok-or-ko-the-pubg-of-boxing-my-passion-project
title: OK or KO the PUBG of boxing — my passion project
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479373"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Game, Passion Project]
tech: ["Game (genre: battle-royale boxing)", first-game MVP scope, player-supplied bug reports]
---
# OK or KO the PUBG of boxing — my passion project

## Tech Stack

The post does not name a stack. The choice below is the minimum the source allows.

- **Game genre** — battle-royale boxing, per the title.
- **First-game MVP scope** — the author calls this their first game; the plan stays at the smallest defensible scope and does not promise platform or engine specifics the post does not state.
- **Player-supplied bug reports** — the post's only stated quality loop.

The post does not name an engine (Unity, Unreal, Godot, browser tech, or otherwise), a platform (web, desktop, mobile, console), a backend, or a deployment target. Inventing any of these would go beyond the source, so the MVP scope stays at "playable build somewhere reachable + a working bug-report path."

## Architecture

The system is a battle-royale boxing game that the author built to play with their nephew and is now sharing with anyone who wants to try it. The architecture the post supports is the simplest possible: a playable build, the author's "random ideas" already in it, and a channel for players to report bugs. There is no claim about how the game is networked, whether there is a backend, whether sessions are peer-to-peer or hosted, or how matchmaking works, because the post does not say.

The build's job is to be reachable. The bug-report path's job is to be reachable. Everything else (engine internals, networking, persistence) is the author's call and is not specified in the source, so it is not specified here.

## Milestones

1. **M0 — Reachable build.** A build the author and visitors can open, with the post's "you'll probably experience some bugs" caveat surfaced at or before launch.
2. **M1 — Bug-report channel.** A working path for players to send the author what they hit, matching the post's explicit ask.
3. **M2 — First round of fixes.** The author reviews incoming bug reports and lands the first set of fixes they can ship.
4. **M3 — Feedback acknowledgement.** The author notes in the next HN-visible update which bugs were real, which were not, and what the next round looks like. (Mechanism is the author's call; the post does not name one.)
5. **M4 — Decide whether to keep going.** This is the author's first game; whether the project continues past the first beta is an open question, not a stated milestone.

## Risks

- **Source-thinness** — every claim beyond "battle-royale boxing, first game, bugs expected, bug reports welcome" is invented. The plan stays narrow on purpose.
- **Bug-report loop without a known channel** — the post asks for reports but does not name a channel; the MVP needs at least one working contact path or the ask collapses.
- **First-game expectations** — the author has been explicit; if visitors arrive expecting a polished battle-royale boxing title, the mismatch hurts both sides. The post's caveat must reach the player.
- **Unknown release surface** — the post does not name a platform; the plan cannot promise a particular device or store.
- **Author's capacity** — this is a passion project built around the nephew and "random ideas"; pacing fixes and updates around the author's available time is the realistic constraint.
