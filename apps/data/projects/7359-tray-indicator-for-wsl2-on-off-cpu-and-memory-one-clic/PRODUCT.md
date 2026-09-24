# PRODUCT.md — Tray indicator for WSL2: on/off, CPU and memory, one-click shutdown

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ When using my PC for private stuff like gaming or video editing I wanted an direct way (without calling wsl --shutdown) of turning WSL2 off. Created (with a help of Claude, it is 2026...) a small tray tool which barely uses resources and provides also resources usage info.<p>Grey means the VM is off. Green, orange or red means it is running, coloured by the higher of its CPU and memory share of the machine. Hover for the numbers, menu entry to shut it down.<p>Two things that were not obvious:
* Presence is the vmmemWSL process existing. WSL reports on distributions, not on the VM.
* CPU and memory come from NtQuerySystemInformation(SystemProcessInformation). vmmemWSL runs as SYSTEM, so OpenProcess is denied to a normal user and GetProcessTimes is out. A snapshot of ~250 processes takes 3.8 ms and needs no handle.<p>Rust, windows-sys only. 282 KB exe, 3.9 MB private memory after half an hour, one thread while idle. Working set is 10 to 19 MB, mostly shared DLLs.<p>Targeted for Windows 11. Older Win10 builds call it vmmem (Use -process flag). Shutdown asks for confirmation. BSD 3-Clause.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49724577) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
