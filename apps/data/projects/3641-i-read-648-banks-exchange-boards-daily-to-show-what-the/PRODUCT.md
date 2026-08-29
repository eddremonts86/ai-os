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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A single page that lays out, for each of 648 banks, the spread between that bank's posted exchange-board rate and the mid-market rate for the same instant, refreshed once a day from the author's own scrape. The product's claim is that the count of 648 is itself the value: more sources means a truer picture of what is being charged, and a daily refresh means the picture is current.

The site is read-only. Visitors do not convert money on it; they read it, compare it, and act elsewhere. The page's job is to make a 648-row comparison legible — sortable, filterable, and grounded in a named reference rate — rather than to sell a transaction.

**One-liner:** MyRateFX shows the spread each of 648 banks is charging today against the mid-market rate, refreshed daily from the author's own board scrape.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Travellers and expats | They want to see, before they convert, how their own bank compares to others on the same pair. |
| Small businesses paying cross-border | A cheaper bank on a single payment is a real saving, and the spread is the only number that matters. |
| Remote workers paid in foreign currency | They convert routinely, so even a small spread difference compounds over months. |
| Finance-curious readers | They want a sanity check on whether their bank is fair, and 648 datapoints is a stronger check than one. |
| The author himself | The page is the public face of a daily scrape he already runs, so the value is making that data inspectable. |

## Jobs To Be Done

1. **Functional job** — Find which of 648 banks is currently closest to the mid-market rate for a given currency pair.
2. **Functional job** — See whether today's spread at a specific bank is normal or unusual compared to its own recent history.
3. **Functional job** — Trust the numbers, by seeing when the daily scrape last ran and how many of the 648 boards returned successfully.
4. **Emotional job** — Stop wondering whether the rate the bank quoted is a fair one.
5. **Social job** — Show that FX retail markups are not opaque and not uniform, using a public comparison as the evidence.

## Success Metrics

- **Daily freshness** — share of days on which the page shows a timestamp inside the last 24 hours; the daily cadence is the product's claim.
- **Successful scrape rate** — share of the 648 bank boards that return a parseable rate on a given day; partial failure is the natural failure mode.
- **Reference-rate coverage** — share of banks whose posted rate can be paired with a contemporaneous mid-market rate so the spread is computable.
- **Per-bank history depth** — number of days of historical spread available per bank, since a single day's spread without context is not actionable.
- **Time on page** — visitors actually browse, sort and filter, because the value of 648 rows only appears once a reader interacts with the list.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture forces a specific cost shape regardless: scraping 648 boards every day is a fixed compute and egress cost per day, while serving the comparison page is a fanout read path. Any future monetisation would therefore be either sponsorship on a read-only page or an affiliate link on a partner that the comparison surfaces, never a per-seat fee for the page itself.

## Competitive Landscape

- **Bank-by-bank lookup at the bank's own site** — accurate for that one bank but useless for comparison, and most banks do not publish a mid-market comparison.
- **Aggregator FX widgets and card-issuer pages** — present a single "best rate" rather than the spread each bank is charging, so the question of who is charging what is hidden.
- **Independent FX trackers** — the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Decide which mid-market reference rate is used as the denominator of the spread, since the choice changes every published number and must be the same for all 648 rows.
- [ ] Confirm whether boards that publish only one direction of a pair are kept in the count or excluded, since dropping them changes the headline 648.
- [ ] Decide how to handle a board that publishes no rate on a given day: omit from today's list, carry forward the last known rate, or mark stale.
- [ ] Establish the legal exposure of scraping 648 bank boards daily, especially any posted terms that prohibit automated retrieval.
- [ ] Verify the scrape does not depend on any single bank's board being online at the moment of refresh, since one slow site can stall a synchronous pipeline.
- [ ] Decide whether the page advertises an affiliate relationship to any bank or FX provider it surfaces, since a comparison page is a natural affiliate surface.
