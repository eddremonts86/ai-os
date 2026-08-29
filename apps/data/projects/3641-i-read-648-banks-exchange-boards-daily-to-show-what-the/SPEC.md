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

## Problem

The capture is only the project URL and title. The title says: "I read 648 banks' exchange boards daily to show what they charge." That is the full statement of the problem the post sets out to solve — a daily snapshot of the foreign-exchange rates posted by 648 banks, presented so that visitors can see what each bank is currently charging against the rate they would actually get.

The number 648 is the asset. It is the count of banks whose posted boards the author reads each day, and it implies that the comparison is being made across a wide and intentionally redundant set of providers rather than from a single curated list. The cadence is daily, which positions the project as a tracker rather than a one-shot lookup. The implied comparison is between each bank's posted-board rate and the mid-market rate — the rate at which a currency can actually be exchanged without a retail spread — and the value to the visitor is the size of that gap in basis points, which is the spread the bank is keeping.

The post says nothing about who the audience is, nothing about the data pipeline, nothing about the persistence model, nothing about the visualisation or interaction, nothing about pricing, and nothing about why a daily board scrape at this scale is worth running. Those are all honest gaps. This plan scopes them from the title and from general engineering knowledge of FX data, not from anything the author said.

The objective that follows therefore reads the title literally: a public page that surfaces what each of those 648 banks is charging, refreshed once a day, against a comparable reference rate.

## Objective

Ship a public, read-only web page that, for each of the 648 banks whose exchange boards the author reads, shows the spread between the bank's posted rate and a reference mid-market rate, refreshed once a day from the author's own daily scrape. The product is a viewer over data the author already collects; the user is a person who needs to compare what different banks are currently charging before deciding where to convert currency.

## Target Users

- Travellers and expats comparing what their bank will charge against what a different bank, card or transfer service would charge for the same pair.
- Small businesses making infrequent cross-border payments who want to know which bank is closest to the mid-market rate today.
- Freelancers and remote workers paid in a currency different from the one they spend in, looking for the lowest-cost path to convert.
- Finance-curious readers who use the mid-market gap as a quick gut-check on whether a bank is fair.
- The author himself, who needs a stable presentation layer over his own daily scrape so that visitors can actually read what he is collecting.

## MVP Scope

- Daily collection from each of the 648 bank boards, with each bank's rate stored alongside a reference mid-market rate for the same instant so the spread is computed once and not guessed.
- A persistent store of historical spreads per bank per pair, so a viewer can see today's gap and how it compares to that bank's typical gap.
- A public web page listing the 648 banks, each with its current pair, posted rate, mid-market rate and spread in basis points.
- Sort and filter on the list by currency pair, region and spread size, since 648 rows is too many to scan without ordering.
- Per-bank detail page showing the recent spread history for that bank, so a user can see whether today's gap is normal or unusual.
- Reference rate selection that is explicit and visible — which mid-market source the spread is computed against — because the choice of reference changes every number.
- A small status line stating when the daily refresh last ran and how many of the 648 boards succeeded, since partial collection is the natural failure mode of scraping at this scale.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The number 648 is fixed by the author's data collection and must not be silently rounded, summarised or dropped; the headline of the page is the count itself.
- The scrape runs daily and must be tolerant of partial failure: a single bank's board returning a parse error or a 5xx must not break the rest of the list, and the failure must be visible on the page rather than hidden.
- Posted-board rates and mid-market rates are taken at slightly different instants and must be timestamped independently, so a viewer can tell when each side was sampled.
- The site presents what banks charge; it does not execute a conversion. No payment, no KYC, no quote-and-execute flow belongs in MVP.
- The capture has no statement of audience, pricing, business model or feature set, so anything beyond reading the title literally is guesswork and is not claimed here.
