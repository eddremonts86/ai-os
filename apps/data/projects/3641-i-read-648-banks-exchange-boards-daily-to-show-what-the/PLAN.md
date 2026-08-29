---
id: "3641"
slug: i-read-648-banks-exchange-boards-daily-to-show-what-the
title: "I read 648 banks' exchange boards daily to show what they charge"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49480607"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, FastAPI, PostgreSQL, Playwright, Pandas, htmx, Tailwind CSS]
---
# I read 648 banks' exchange boards daily to show what they charge

## Tech Stack

- **Python** for the daily scrape and the data normalisation, because the libraries for HTML parsing, rate limiting and date arithmetic are mature and the work is glue code rather than hot paths.
- **FastAPI** to serve the public page and the per-bank detail JSON, since the read path is small and Python keeps the whole stack in one language.
- **PostgreSQL** to hold the per-bank, per-day spread history, because the natural shape is a narrow time-series table that needs an index on (bank_id, date).
- **Playwright** for boards that render rates through JavaScript rather than serving them in the initial HTML, since a 648-board scrape cannot rely on static HTML alone.
- **Pandas** for the per-day aggregation that turns raw board reads into published rows, since the operations are exactly the ones the library exists for.
- **htmx with Tailwind CSS** for the front-end, because the page is read-only and a server-rendered table with progressive enhancement is enough for a 648-row comparison.
- **Coolify** for the deploy, matching the rest of the corpus and keeping a single operator path for the author's other projects.

## Architecture

The scrape runs once a day as a scheduled job. For each of the 648 banks it pulls the bank's posted board, normalises the rate to a common (base, quote, as-of) shape, and fetches a mid-market reference rate for the same instant. Each row is then written to a `bank_rates` table with `(bank_id, pair, posted_rate, mid_rate, captured_at, board_as_of)`. The two timestamps are deliberately separate: `captured_at` is when the scrape ran and `board_as_of` is whatever timestamp the bank's own page claimed, since the two diverge when a board is cached.

The public page is a single PostgreSQL read. A list query selects the latest row per bank for the chosen pair, computes the spread in basis points against the stored mid-market rate, and returns the 648-row dataset as JSON. The front-end renders the table once and lets the visitor sort by spread, by region or by bank name. A second route serves the per-bank detail page by querying the same bank's history and rendering a small inline series.

Failure isolation is the architectural problem the scale forces. One bank's board being down, slow or behind a captcha must not stall the other 647. The scrape is therefore per-bank, with a hard per-request timeout and a recorded error rather than a thrown exception, so a partial day produces a partial list with an explicit success count rather than a missing one. The status line on the page reads directly from the per-bank result table so the operator and the visitor see the same number.

## Milestones

1. **M1 — One bank, end to end** — scrape a single bank's board, persist the rate alongside a mid-market reference, and render one row on a page.
2. **M2 — 648 boards** — extend the scraper to the full set with per-bank timeouts, error capture and a daily scheduler.
3. **M3 — History** — keep the daily result per bank so the per-bank detail page can show recent spreads.
4. **M4 — Reference rate plumbing** — choose and pin the mid-market source, store it next to each row, and make the choice visible on the page.
5. **M5 — Sort, filter, status** — interactive ordering of the 648-row list, currency-pair and region filters, and the daily freshness / success-count status line.
6. **M6 — Reliability pass** — measure partial-failure behaviour, add retry only where it changes the outcome, and document the boards that never parse.

## Risks

- **Reference rate drift** — using a single mid-market source pins every comparison to that source's accuracy and update cadence, which the page must declare.
- **Boards behind JavaScript** — a 648-board scrape cannot rely on static HTML, and JS-heavy boards add a real cost and a real failure mode.
- **Headline number volatility** — if the count of 648 ever drops because boards are unavailable, the page either shows the new count honestly or stops being what the title promised.
- **Legal exposure** — daily scraping of 648 boards is a deliberate posture and may conflict with terms of service on some boards, which is a decision the author has to own.
- **Single-day snapshots** — without history, a single bad scrape day looks like a permanent rate change, so the history table is the durability of the comparison.
- **Misread as a transaction site** — visitors expecting to convert money on the page are a UX trap; the page must make its read-only nature obvious.
