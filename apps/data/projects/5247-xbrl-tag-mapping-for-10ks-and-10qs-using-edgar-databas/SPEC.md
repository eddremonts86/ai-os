# SPEC.md — xbrl-tag mapping for 10ks and 10qs, using EDGAR database

## Problem

Hello HN! 
I built a pipeline which fetches SEC EDGAR 10k and 10qs for more than 600 companies, maps xbrl-tags onto around 35 financial concepts and computes growth- , fundamental- and valuation-multiples (prices provided by yfinance). 
This project originated bc I wanted clean, non-third-party financial data in order to judge a trading thesis of mine. I could not find any app providing such data (for free), let alone being open source. 
Turns out there are no data providers because xbrl of 10ks and 10qs SUCKS(!!!!). It is messy, unregulated and devastated. Its the wild west of finance. 
A project like this was 5 years ago not possible, at least not with less than ~1000 people. Thats because of the nature of xbrl-tags. Since they are unregulated, a certain xbrl-tag could fit perfectly for a certain company, while providing nothing, only a partial amount, or complete garbage for another company. You would have to iterate through every financial statement ever relesed by a company, searching every tag possbile, comparing, once found, a tag and constantly checking, once more companies are added to the obserable universe, if the tag also produces meaningfull data for those new companies. 
As I said, unmanagable task. Except for LLMs. 
I used Anthropics Claude Fable 5 mostly, giving strict, non-regression focused tag research tasks, constantly letting it iterate through the entire ticker universe, searching and comparing tags. And it worked. 
It took me around 3 weeks just to produce wrong data, manually searching for a ticker universe of 3 (AAPL, MSFT, NVDA). Now this pipeline produces correct, cleaned data (more on that later) for more than 600 companies.<p>That was just the main problem tho. Notable problems taht also had to be fixed: 
-companies tagging everything as fy ull year; 
-cash flow being filed cumulative; 
-q4 is never filed; 
-a quarter isnt always the same length; 
tag changing by a company; 
-STOCK SPLITS (god i hate them); 
-companies reporting wrong (a few 0s more for example);<p>Still got a lot of work to do, UI and UX are...rudimentary. 
Appreciate any feedback&#x2F;critics. 
Thanks for taking your time reading this.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49578331)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T16:50:09Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
