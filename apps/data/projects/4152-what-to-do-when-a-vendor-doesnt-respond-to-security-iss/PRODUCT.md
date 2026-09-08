---
id: "4152"
slug: what-to-do-when-a-vendor-doesnt-respond-to-security-iss
title: "What to do when a vendor doesn't respond to security issues?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507259"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# What to do when a vendor doesn't respond to security issues?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A concise, EU-focused responsible-disclosure escalation guide that names the next moves a researcher can take when the vendor's support funnel is broken — CSIRT, ENISA, regulator complaint, lawyer-before-publish — without making legal claims the source did not make.

## Target Users

Independent security researchers and homelab users in the EU who find a vulnerability in a consumer product, want to disclose responsibly, and cannot get a vendor response. Secondary reader: small vendor security teams.

## Jobs To Be Done

When a researcher has documented a real vulnerability, made a good-faith disclosure attempt, and received silence, give them a checklist of the named next moves that exist within the EU disclosure ecosystem (national CSIRT, ENISA coordinator role, sectoral regulator, NDA-safe lawyer review before any public write-up).

## Success Metrics

Whether the guide is referenced in disclosure training materials or shared in security-team onboarding docs. No quantitative target is set; the source post gives no baseline.

## Pricing & Monetization

Not applicable — the deliverable is a free reference note.

## Competitive Landscape

Adjacent guides exist (ENISA's own CVD guidance, CERT/CC disclosure handling, NCSC-NL's disclosure norms). The page scopes to the specific escalation pattern in the post (EU consumer-vendor silence) and links the canonical sources rather than duplicating them.

## Risks & Open Questions

The legal question ("can I publish?") depends on jurisdiction and on whether the vendor had a published disclosure policy; the guide must defer to a lawyer and label the legal question as unresolved. A second risk is that naming a specific product or vendor without consent could harm the researcher's case; the guide stays general.