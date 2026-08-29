---
id: "3652"
slug: dipstick-alerts-search-recalls-and-service-bulletins-fo
title: Dipstick Alerts – Search recalls and service bulletins for your car
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483465"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, Cloudflare Workers, Cloudflare D1 (SQLite), Cloudflare Queues, Cloudflare KV, Google Gemini API, NHTSA API]
---
# Dipstick Alerts – Search recalls and service bulletins for your car

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

Dipstick Alerts is a public site that lets a visitor search NHTSA recalls and manufacturer service bulletins by year, make and model, read a plain-language summary of each one and, optionally, subscribe by email to be told when something new applies to their vehicle. The site needs no signup to search. The plain-language content is generated from the source document using Gemini; the original manufacturer document is the link on every result.

The pipeline is a daily scan of NHTSA, normalised through Cloudflare Queues into D1, with the vehicle-match logic auditable so the author can take reports of incorrect matches. The author built it after a service bulletin about a cold-weather trunk problem got his own car fixed under warranty, and the site is built around that same insight: a real-world behaviour the owner did not recognise as repairable turns out to be a known issue.

**One-liner:** Dipstick Alerts lets anyone search US vehicle recalls and manufacturer service bulletins by year, make and model, with a plain-language summary per result and optional email alerts when something new applies.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Owners with extended warranties | They want to know what is covered without checking NHTSA.gov every month. |
| Owners with a suspected behaviour | They want to know if a trunk that does not open as far is a known issue. |
| Prospective buyers | They want the recall and bulletin history before they commit to a vehicle. |
| Mechanics and service advisors | They want a quick lookup of the bulletin history of a customer's vehicle. |
| Anyone burned by a missed recall | They want a passive alert stream rather than a monthly manual check. |

## Jobs To Be Done

1. **Functional job** — Find every recall and manufacturer service bulletin that applies to a specific year, make and model.
2. **Functional job** — Read a plain-language summary and decide whether to act.
3. **Functional job** — Subscribe by email and be told when something new applies.
4. **Functional job** — Trust the original manufacturer document over the summary, by clicking through to the source on every result.
5. **Emotional job** — Stop wondering whether the car's behaviour is a known issue.
6. **Social job** — Show that NHTSA's data is more useful when it is searchable by year, make and model rather than by campaign number.

## Success Metrics

- **Result usability** — share of search results whose plain-language summary makes the issue clear without further reading.
- **Vehicle-match precision** — share of results that apply to the visitor's actual vehicle, since an incorrect match is the author-named risk.
- **Pipeline freshness** — share of days on which the daily scan completes inside the 24-hour budget, since freshness is the product's claim.
- **Source authority** — share of results whose Gemini summary links back to the original manufacturer document, because the source is authoritative.
- **Alert relevance** — share of alert emails that result in the subscriber opening a result, since an alert that nobody opens is noise.
- **Search latency** — time from selecting year, make and model to results being visible, since the site is the primary surface.

## Pricing & Monetization

The post names no price, no tier and no business model. The architecture fixes a specific cost shape regardless: the daily NHTSA scan is a fixed cost per day, D1 storage scales with imported bulletins and recalls, and the alert pipeline scales with subscribers. Any future monetisation would therefore be either a per-month alert tier that raises the number of subscribed vehicles or a sponsored placement for dealers and service shops, never a per-search fee, since search is the no-signup primary surface.

## Competitive Landscape

- **NHTSA.gov directly** — authoritative, but requires monthly manual checks and reading raw campaign numbers rather than year/make/model.
- **CarComplaints and similar owner sites** — useful for known symptoms but do not cover the full manufacturer service bulletin corpus.
- **Dealer service portals** — see the bulletins for a specific VIN but are not a public, searchable surface.
- **General vehicle history reports** — broad but not focused on the recall and bulletin layer that the extended-warranty story depends on; the post names none specifically, and no competitor is named in the capture, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the vehicle-match logic is auditable so incorrect matches can be reported, which the author explicitly asks for.
- [ ] Establish the Gemini generation prompt so summaries are consistent in tone and length, and so the original document remains the source of truth.
- [ ] Verify the daily scan completes inside its 24-hour budget under normal NHTSA publication volume.
- [ ] Decide the superseding-bulletin rule, so a visitor does not act on a stale entry that has been replaced.
- [ ] Document the US-only coverage explicitly on every page where coverage matters.
- [ ] Confirm the email alert deliverability posture, especially for the optional subscription flow.
