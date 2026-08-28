---
id: "3102"
slug: i-have-feelings-about-my-tasks
title: I have feelings about my tasks
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446769"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Productivity, B2C]
tech: [TypeScript, browser-only drag-and-drop, Google OAuth, serverless persistence]
---
# I have feelings about my tasks

## Problem

Task lists are flat. The way the founder actually thinks about tasks is that they sit in space — some on the desk in front of them (in focus), most on the floor of the room (waiting). Today's task tools force every task into the same one-dimensional list, which loses the spatial metaphor and the per-task attention accounting that the founder wants. The post describes the first-ever task tool the founder built to test this hypothesis: tasks are cardboard boxes on the floor of a room, with the title written on them in marker; click to grab one, drop it on the desk, and its clock starts; take it off, the clock stops; time accrues per box forever. No sign-up needed to try it out; sign in with Google if you want a room that persists. The founder is explicitly torn on whether the desk should hold exactly one box.

## Objective

Ship a browser-based task tool where every task is a physical-feeling cardboard box, the desk is the focus surface, and the per-box clock accumulates the time a task has spent on the desk — so the founder (and any reader who shares the spatial-metaphor instinct) can see at a glance which tasks have eaten their attention.

## Target Users

- Primary: the founder themselves, plus the HN readers who reacted to the post with "this is exactly how I think about tasks too."
- Secondary: knowledge workers who already time-track loosely and want a lower-friction surface than Toggl or RescueTime.

## MVP Scope

- A browser-only single-room view: floor with boxes (incoming tasks) and a desk (focus surface).
- Drag-and-drop: grab a box from the floor, drop it on the desk; clock starts. Lift it off, clock stops. Time accrues per box forever and is visible on the box.
- No-sign-up anonymous mode: a fresh room is generated client-side and lives in localStorage; clearing the browser clears the room.
- Google sign-in for persistence: the same room is stored server-side and rehydrated on next visit.
- Per-box editor: click the title to rename; a small × to delete.
- One open question the founder flags: should the desk hold exactly one box? Ship with "exactly one" as the default and a settings toggle for "many."
- Out of scope for MVP: multiple rooms, sharing, team features, mobile app, calendar integration, reminders.

## Design Direction

Design direction for the MVP follows the constraints in this SPEC and the chosen stack (browser-only drag-and-drop with optional server-side persistence). The visual language is deliberately tactile: the metaphor only works if the boxes look like boxes.

**Color** — warm cardboard brown for the boxes; a desk surface that reads as "wood"; soft shadows so boxes feel three-dimensional; a soft accent for the focused box. No gradients, no neon.

**Type** — one hand-printed-looking display family for box titles (the post literally says "with the title written on them in marker"), one neutral text family for the clock readout.

**Density** — generous: a small room holds maybe six to ten boxes comfortably; if the user has more, they need to actually triage, not pile.

**Motion** — boxes have weight: they ease into place when dropped, they gently bounce when picked up. No autoplay, no parallax, no decorative animation.

## Constraints

- The MVP must work without sign-up (anonymous localStorage room) so a first-time visitor can try the metaphor in under 10 seconds.
- Google sign-in is the only auth path in v1; no email + password, no magic link.
- The per-box clock must persist across browser reloads (anonymous via localStorage; signed-in via server-side storage) — losing accrued time would break the metaphor.
- The desk's "exactly one box" rule is the founder's stated open question; ship it as a default with a toggle, do not bikeshed it in code.
- No third-party analytics on the page; the founder wants the room to feel personal.
