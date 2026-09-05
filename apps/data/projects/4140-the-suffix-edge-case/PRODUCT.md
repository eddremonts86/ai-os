---
id: "4140"
slug: the-suffix-edge-case
title: The Suffix Edge Case
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511992"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The Suffix Edge Case

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A short, citable reference that codifies the English-language personal-name suffix list and the form-design choices that prevent "II" from rendering as "Ii" — so that intake flows, document generators, and downstream normalisation do not have to re-discover the rule each time a user with a suffix shows up.

## Target Users

Engineers building intake forms, KYC flows, legal document generators, and any system that has to preserve the case of short trailing tokens in a personal name. Secondary reader: product managers triaging bug reports that look like "my name is broken on screen".

## Jobs To Be Done

When a form or document generator needs to handle personal names correctly, the developer wants a checklist that says: use a dedicated Suffix slot, do not title-case short tokens, preserve the user's exact input for generational and professional suffixes.

## Success Metrics

Whether the reference is quoted or linked in future bug reports, design reviews, or pull-request descriptions that touch name handling. No quantitative target is set; the source post gives no baseline.

## Pricing & Monetization

Not applicable — the deliverable is a free reference note, not a product.

## Competitive Landscape

Adjacent references exist (Unicode case-folding guidance, locale-aware title casing in CLDR) but the post does not name any direct comparison. The suffix list itself is small enough that any developer can rebuild it from public sources; the value of the reference is the form-design checklist, not the list.

## Risks & Open Questions

The suffix list is incomplete by design (US/UK conventions only); honourifics used in other regions, religious titles, and academic post-nominals are not covered by the post and would have to be added case by case. The post does not propose a fix for already-mangled data on existing government systems, which is the part most affected users actually feel.