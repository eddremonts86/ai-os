---
id: "3182"
slug: ai-scientist-builds-an-open-source-codex-micro-from-scr
title: AI scientist builds an open-source Codex Micro from scratch for $40
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49453466"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Hardware, AI, Agent, Open Source]
tech: [KiCad, PCB manufacturing (JLCPCB), QMK firmware, agentic research loop (Python), runbook Markdown]
---
# AI scientist builds an open-source Codex Micro from scratch for $40

## Value Proposition

An open-source drop-in alternative to the sold-out Codex Micro macropad — same 13-key, encoder, joystick, touch disc, LED-band I/O surface — at a ~$40 BOM, with a published runbook that shows how an agentic research loop landed a fully routed board where other tools failed.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Macropad hobbyists / streamers | Want a Codex Micro without depending on the sold-out commercial unit. |
| Agent / tool builders | Want a documented "research-as-exploration" workflow that worked on a hard EE problem. |
| EE students / first-time macropad builders | Want a known-good reference design with a clear BOM and a configurator. |

## Jobs To Be Done

1. **Functional job** — Get a 13-key + encoder + joystick + touch disc macropad with per-key RGB, configurable from a browser.
2. **Emotional job** — Avoid the FOMO of a sold-out commercial product that everyone is showing off.
3. **Social job** — Show off a build whose design files, firmware, and build process are public.

## Success Metrics

- **BOM target:** published single-unit BOM cost stays within ±$5 of the $40 claim.
- **Build reproducibility:** at least 5 community-built units flashed and running QMK with all inputs working.
- **Runbook adoption:** at least one external agent / tool-builder reports applying the workflow to a different EE problem within 90 days.
- **Configurator usage:** configurator page hits and key-bind saves per week as a proxy for "people who actually built one and are configuring it".

## Competitive Landscape

- **OpenAI × Work Louder Codex Micro** — the sold-out reference; what users are replacing.
- **Other open-source macropads (e.g. MacroPad, Ferris, various "10-key" kits)** — vary in I/O surface; none combine 13 keys + encoder + joystick + touch disc + LED band at this BOM cost.
- **Commercial macropads (Stream Deck, Loupe Deck, etc.)** — closed hardware, much higher cost, no per-key custom firmware.

## Risks & Open Questions

- [ ] BOM inflation — the $40 cost is a single-unit number; a JLCPCB assembly quote at scale may diverge.
- [ ] QMK / firmware fork — keeping the firmware in sync with upstream QMK is an ongoing maintenance cost.
- [ ] Future work promised in the post (OLED, Bluetooth base) — if the community expects it, scope creep is a real risk.
- [ ] Runbook specificity — generalising the agentic-research workflow to other EE problems will require more than one example.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49453466) · **Category:** show-hn · **Tags:** Show HN,Hardware,AI,Agent,Open Source
