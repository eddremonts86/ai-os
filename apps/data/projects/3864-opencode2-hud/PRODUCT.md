---
id: "3864"
slug: opencode2-hud
title: OpenCode2 HUD
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500245"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Terminal overlay, OpenCode session hooks, Agent telemetry display, tmux-aware placement, Read-only sidecar, Status-line widgets]
---
# OpenCode2 HUD

## Value Proposition

A heads-up display for opencode sessions that shows what the agent is doing right now — model, current activity, elapsed time — without leaving the workflow or scrolling the transcript. The value is attention: developers keep their place in the terminal and still know the agent's state. The capture is a bare link, so the feature set described here is the title's premise, not a verified list.

**One-liner:** A heads-up display for opencode sessions that shows what the agent is doing right now without leaving your terminal workflow.

## Target Users

| Stakeholder | Why they care |
|---|---|
| opencode daily users | Session status at a glance instead of transcript scrolling. |
| Long-session runners | Watch agent progress while working elsewhere in the terminal. |
| Terminal tooling authors | A reference for opencode session hooks and sidecar patterns. |

The capture names no segments; the rows follow from the tool's premise.

## Jobs To Be Done

1. **Functional job** — Attach to a live opencode session and read its state.
2. **Functional job** — Show model, current activity and elapsed time in a compact overlay.
3. **Functional job** — Run read-only without disturbing the agent session.
4. **Emotional job** — Reduce context-switching fatigue during long agent runs.

## Success Metrics

- **Sessions with the HUD attached:** adoption among opencode users.
- **Scrolls avoided:** reduction in transcript scrolls per session while the HUD is active.
- **Zero interruptions:** no observed agent session disturbed by the sidecar.
- **Terminal coverage:** the HUD works in tmux panes and plain terminals.

## Pricing & Monetization

None stated. The capture is a bare repository link with no commercial terms.

## Competitive Landscape

The post names no competitors. The category is coding-agent companions: status overlays, dashboards and sidecar widgets that wrap CLI agents. The HUD's angle inside that category is minimal in-terminal observation rather than a full dashboard — a deliberate smallness that the capture itself does not explain further.

## Risks & Open Questions

- [ ] Bare-link capture: the project's real feature set and maturity are unknown.
- [ ] opencode's session APIs may not expose the telemetry the HUD needs.
- [ ] Terminal rendering can collide with opencode's own UI over scroll and redraw territory.
- [ ] Niche audience: the value is capped by opencode adoption itself.
