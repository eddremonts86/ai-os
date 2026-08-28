---
id: "3204"
slug: ancestree-give-your-family-members-biographies
title: Ancestree – Give your family members biographies
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451007"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ancestree – Give your family members biographies

## Value Proposition

Every time I talk to my older family members, especially my grandparents, I find out a new super interesting fact about them. Last week: my Croatian grandfather served in the French marine corps... Not worth mentioning I guess.I realized that these stories are passed down only by re-telling them. Just think about how much you don't know about your family from 2 generations ago.For this reason, I created ancestree.marindedic.comIt's a really cool family tree creation app, where each person gets their own book. Inside it, write what they did, what happened to them, what they were like... whatever you want.Little biographies of your loved ones.Apart from exporting normal and detailed versions of your family tree, you can even export someone's chapters as one long biography.Of course, open-sourced, no account, no server. Nothing you draw or write ever leaves your browser.

**One-liner:** A browser-only family tree app where each relative gets their own book of free-form biographies, with normal and detailed tree exports plus a per-person biography export — fully local-first and open source so nothing the user writes ever leaves the browser.

## Target Users

- Primary: people who want to capture the stories their older relatives tell them before those stories are gone, and who want each relative's biography kept as its own "book" inside the tree.
- Secondary: family historians who want to export a tree plus per-person biographies for printing or sharing, without trusting a hosted service with private family information.

## Jobs To Be Done

1. Functional — draw the family tree and attach a written biography to each person, free-form, in a "book" view per person.
2. Emotional — make sure the "new super interesting fact" the user hears from a grandparent this week is captured somewhere other than their own memory, with the relative attached to it.
3. Social — export the tree (normal or detailed) or one person's full biography as a shareable artifact a relative can read on their own.

## Success Metrics

- Per-person biography length: how many chapters the average person in a tree accumulates; longer means the writing habit is sticking.
- Export usage: how often users run the normal vs detailed tree export, and how often they export a single person's chapters as a long biography.
- Browser-local retention: how many users come back to the same browser profile and keep adding entries — this is the only retention signal available without a server.

## Pricing & Monetization

Free and open source per the source ("open-sourced, no account, no server"). No pricing or hosted plan is implied.

## Competitive Landscape

Not stated in the source. The post is about the author's own project; no other family tree tool is named.

## Risks & Open Questions

- Browser-only persistence: if the user clears browser storage or switches browsers without exporting, the biographies are gone. The MVP needs prominent export reminders, not a hidden menu.
- Two export formats (normal vs detailed tree) need to be clearly distinct; the source does not say what makes a tree "detailed", so the MVP must define that without inventing it as a feature claim.
- Long-form biography export has to read as a real document, not a stack of raw chapters — the per-person export is the most shareable output and the easiest to get wrong.
- The local-first promise is the product's identity. Any feature that sends family data to a server (even anonymised analytics) breaks it; the MVP must be vigilant about that boundary.
