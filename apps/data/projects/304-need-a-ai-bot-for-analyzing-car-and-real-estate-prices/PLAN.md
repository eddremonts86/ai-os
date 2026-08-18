---
id: "304"
slug: need-a-ai-bot-for-analyzing-car-and-real-estate-prices
title: Need a AI-bot for analyzing car and real estate prices
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/lbdzym5un1-need-a-ai-bot-for-analyzing-car-and-real"
category: ai
date: "2025-11-13"
tags: [AI, Other]
country: Russia
tech: [Python, FastAPI, Postgres, Telegram Bot API, Avito API, CIAN API, Anthropic Claude API]
---
# Need a AI-bot for analyzing car and real estate prices

## Tech Stack

- **Backend:** Python 3.12, FastAPI, deployed on a Hetzner VPS in the EU region closest to Russia (or a Russian VPS provider if Hetzner latency proves too high).
- **Database:** Postgres for users, chats, verdict history, comparable snapshots.
- **Bot interface:** Telegram Bot API (long polling is fine for v1; webhooks once traffic justifies).
- **Marketplace sources:** Avito's official API where available; CIAN's listing endpoint; small polite Playwright scraper as a fallback, with rate limits per host.
- **Verdict engine:** deterministic median / percentile math on the comparable set, with a Claude call to write the one-line justification.
- **Deployment:** systemd + a reverse proxy on the VPS; no Kubernetes in v1.

## Architecture

The bot receives a message, parses the URL, classifies it (auto vs real estate), and dispatches to the right comparator. The comparator fetches the listing, normalises its attributes, and pulls a comparable set. The verdict engine computes a price band and writes a one-line justification. Conversation state is stored in Postgres so the user can reply "compare with the previous one" without re-pasting.

```
Telegram user ─▶ Telegram Bot API ─▶ FastAPI webhook
                                          │
                                          ├─▶ URL classifier (auto / real estate)
                                          ▼
                                  Comparators ─▶ Avito / CIAN (API or scraper)
                                          │
                                          ▼
                                  Postgres (listings + comparables)
                                          │
                                          ▼
                                  Verdict engine (median + Claude justification)
                                          │
                                          ▼
                                  Telegram reply (verdict + comparable table)
```

## Milestones

1. **M0 — Spec freeze + Telegram bot skeleton.** Bot replies to `/start` and `/help`. End of week 1.
2. **M1 — Avito auto comparator.** One URL → comparables → median verdict. End of week 3.
3. **M2 — CIAN real-estate comparator.** Same shape for apartments. End of week 5.
4. **M3 — Comparison flow.** "Compare with previous" reply path; history view per chat. End of week 7.
5. **M4 — Paid tier + 100-user pilot.** Free/paid quota gate + billing. End of week 10.

## Risks

- **Marketplace scraping bans** — if Avito blocks the bot IP range, the comparator falls back to nothing; mitigation is an explicit "API access requested" milestone and a graceful "no comparables available" reply.
- **Verdict accuracy variance** — different comparable heuristics give different verdicts on the same listing; mitigation is a pinned, documented heuristic (year ±2, mileage ±20%, area ±10%, last-30-days) so users can sanity-check.
- **Latency from abroad** — hosting outside Russia adds seconds to every marketplace call; mitigation is to deploy in-region before opening the bot to paid traffic.
