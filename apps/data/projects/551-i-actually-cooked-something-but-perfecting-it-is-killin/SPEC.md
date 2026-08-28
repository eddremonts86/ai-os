---
id: "551"
slug: i-actually-cooked-something-but-perfecting-it-is-killin
title: "I actually cooked something, but perfecting it is killing my productivity."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo7dla/i_actually_cooked_something_but_perfecting_it_is/"
category: saas
date: "2026-08-14"
tags: [saas, video, ai, desktop]
tech: [Swift, "C#", WinUI, Adobe CEP, SQLite, Stripe, Paddle]
---
# I actually cooked something but perfecting it is killing me

## Problem

A founder built a semi-agentic video editor for a specific niche; the analysis is proprietary and they trained the model themselves manually. Nothing like it exists on the market today. The founder wants to extend the editor into a full auto-agent feature on 3 other programs (since the current version is a plugin agent) for both Mac and Windows, but the need to perfect the agentic nature of it is killing their productivity. The first version is shipped; the extension is the bottleneck. The implicit product: a niche-specific semi-agentic video editor that already exists, expanded into a full auto-agent across Mac + Windows.

## Objective

Define the MVP scope for the second version of the semi-agentic video editor: extend the existing plugin to a full auto-agent mode on three additional host programs, ship native Mac and Windows builds, and stop perfecting the agentic loop until the multi-host expansion is in beta.

## Target Users

- **Primary:** video editors in the niche the founder trained for, who already use the v1 plugin.
- **Secondary:** video editors in adjacent niches who would adopt if the niche coverage expands.
- **Tertiary:** post-production studios that would adopt if the multi-host coverage matches their workflow.

## MVP Scope

- Full auto-agent mode in the existing plugin.
- Native Mac and Windows builds (no Electron wrapper for the desktop app).
- Plugin integration with 3 additional host programs (the specific hosts are the founder's call).
- A "ship now" toggle: ship the auto-agent feature as soon as it passes a quality bar set by the v1 user feedback, even if not perfect.
- Excluded in v1: cloud sync, multi-user collaboration, mobile companion app, AI voice cloning.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single editor surface — the timeline at the centre, the agent controls on the right, the host-plugin integration status at the top. No marketing-site chrome; the product is the timeline.

## Constraints

- Native builds only; Electron is the failure mode the founder is escaping.
- The auto-agent mode must respect the host program's undo stack; an agent that breaks the editor's history is unusable.
- The "ship now" rule must be enforced by a feature flag, not by willpower.
