---
id: "531"
slug: new-saas-got-good-google-impressions-initially-then
title: "New SaaS got good Google impressions initially, then"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo0r7j/new_saas_got_good_google_impressions_initially/"
category: saas
date: "2026-08-14"
---
# "New SaaS got good Google impressions initially, then"

## Problem

Something interesting happened with a new project I launched. After submitting the site to GSC, I started getting impressions and clicks almost immediately. Much earlier than I expected, honestly. Then everything dropped. [preview.redd.it/419l3wk1pajh1.png…]([preview.redd.it/419l3wk1pajh1.png…]([preview.redd.it/419l3wk1pajh1.png…]([preview.redd.it/419l3wk1pajh1.png…]([preview.redd.it/419l3wk1pajh1.png…](https://preview.redd.it/419l3wk1pajh1.png?width=960&format=png&auto=webp&s=7379c7e7162bfd37c776d809e79e2ecf08b4059a))))) I'm trying to figure out whether this is a normal new-site thing or whether I should be worried about the drop. The product is StatWP, a small WordPress analytics/research tool I built. It started because I wanted an easier way to research plugin/theme performance, and it's grown into stuff like downloads, installs, rankings, ratings, keyword tracking and niche research. I have a feeling Google initially tested the pages pretty broadly and then settled things down. But there's another possibility: I'm looking at barely a week and a half of data and trying to make a big conclusion from it submitted by /u/Tiny_Committee3052 [link] [comments]

---

## Objective

Ship a single-page diagnostic that takes a Google Search Console screenshot (the kind in the source) and returns a verdict on whether the impression drop is the normal "Google settling" curve or a real signal worth acting on, with the 3 checks the founder should run before drawing any conclusion.

## Target Users

- Primary: solo founder / indie hacker who just submitted a new site to GSC and is watching the Search Performance report.
- Secondary: an SEO consultant running the same diagnostic for new clients.

## MVP Scope

- Upload a GSC screenshot (PNG/JPG).
- 3 server-side checks: impression curve shape vs. typical new-site settling, query count vs. indexed pages, click-through-rate vs. average position.
- A single verdict: "settling curve (wait 4 more weeks)" vs. "real signal (here are the next 3 checks)".
- A copy-paste "what to do this week" plan for each verdict.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Image parsing must be honest about uncertainty; the screenshot is the only input.
- No account required; the founder's screenshot is not persisted.
- Single-page tool.
