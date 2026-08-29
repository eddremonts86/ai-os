---
id: "3724"
slug: airtight-single-file-portfolio-tracker-zero-servers-wor
title: "Airtight – single-file portfolio tracker, zero servers, works offline"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49487783"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Single-file HTML, JavaScript, IndexedDB, CSV parsing, no backend]
---
# Airtight – single-file portfolio tracker, zero servers, works offline

> Product brief for the browser-only portfolio tracker described in the Show HN pitch.

## Value Proposition

A retail investor can track holdings across brokers by dragging in CSV exports — and the file never leaves the browser. No account, no API key, no server. A single HTML file is the entire product.

**One-liner:** A portfolio tracker you open from disk; your broker exports stay on disk.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Privacy-minded retail investors | Refuse to give a third-party dashboard a read-only API key to their brokerage. |
| Travelers and offline-first users | Want a tracker that works on a plane or in a coffee shop with bad Wi-Fi. |
| Auditable-software users | Want to read the source of the tool that touches their financial data, end-to-end. |
| Tinkerers | Want a single file they can fork and adapt to their own broker's CSV format. |

The source frames the user as the investor, not an advisor or a team.

## Jobs To Be Done

1. **Functional job** — See total value, allocation, P/L, and concentration across broker CSV exports without uploading holdings anywhere.
2. **Functional job** — Keep state across sessions on the same browser, without creating an account.
3. **Emotional job** — Feel that the tool is not quietly harvesting portfolio data; trust the "nothing leaves your browser" promise.
4. **Social job** — Demonstrate (by handing a colleague the single HTML file) that the tracker is auditable, not a black box.

## Success Metrics

- **Activation:** download the HTML → drag in a CSV → see a portfolio summary, with no account or network call.
- **Privacy invariant:** no network requests after the initial HTML load, verifiable in the browser devtools Network tab. The README should publish this as a test.
- **Coverage:** the parser handles the broker CSV formats the README lists, and fails visibly on unknown formats.
- **Stickiness:** the parsed portfolio persists across browser sessions on the same machine.

The post does not state a revenue target. The project is shipped as a free single-file artifact.

## Pricing & Monetization

The post does not name a price or business model. The single-file framing implies the artifact is free to use and free to read; any monetization (a hosted companion, a paid Pro parser for less-common broker formats) would be a post-MVP addition and is out of scope for this plan.

## Competitive Landscape

- **Hosted portfolio dashboards** (Personal Capital, Mint, broker-native tools) — polished, but require API keys, accounts, and trust that the vendor is not harvesting holdings.
- **Spreadsheets** (Google Sheets, Excel) — flexible, but require the user to hand-roll the formulas and chart the data themselves.
- **Open-source desktop portfolio trackers** — self-hosted, but typically require installation, a runtime, or a server.

The project's differentiator is the explicit "single file + zero network + zero account" framing: the deliverable is auditable in 30 seconds and works offline.

## Risks & Open Questions

- [ ] Broker CSV formats vary; the README must list which are tested, and the parser must fail loudly on an unknown format rather than misclassify columns.
- [ ] No live prices means P/L is only as fresh as the CSV; the MVP should be honest about what "current value" means.
- [ ] Browser persistence is per-browser and per-device; users who clear storage lose state. The MVP needs a clear "export your state" affordance.
- [ ] The "nothing leaves your browser" promise is a contract; any future feature (a remote price feed, an analytics endpoint) would break it, and the README should call this out as a constraint, not a roadmap item.
- [ ] The post does not specify cost-basis treatment (FIFO, LIFO, average); the MVP must state its choice and not silently pick one.
