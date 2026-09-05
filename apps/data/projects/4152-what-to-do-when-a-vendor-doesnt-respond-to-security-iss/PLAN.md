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

## Tech Stack

Static documentation page rendered with the existing TanStack Start stack. No backend, no database, no auth. Markdown source for the body so the escalation checklist can be revised if EU disclosure norms or contact points change.

## Architecture

One page, one document. The page renders the six-step escalation flow, with external links to the canonical sources (ENISA CVD page, national CSIRT listings, regulator complaint pages). No client-side state, no forms, no user accounts.

## Milestones

Draft the six-step flow, link the canonical sources (ENISA, CERT-EU equivalents, national CSIRTs), write the legal-question deferral note, publish the page, link it back to the HN thread.

## Risks

Risk that any link or contact point goes stale as EU cybersecurity bodies reorganise. Mitigate by writing the page so the steps reference roles ("your national CSIRT", "ENISA coordinator") rather than specific URLs that drift. A second risk is that a reader treats the guide as legal advice; the page must clearly state that the legal question requires a lawyer and is not answered here.