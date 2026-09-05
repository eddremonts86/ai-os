---
id: "4233"
slug: brandjet
title: BrandJet
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/brandjet-ai"
category: product-launch
date: "2026-08-18"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# BrandJet

## Problem

A sales team spends most of its time finding prospects, not closing them. Public buying signals — a new hire, a funding round, a job posting, a product launch, a tech-stack change, an executive quote — already exist on the public web, but the team has no single surface that turns them into a sales pipeline. The BrandJet launch post names the alternative: turn public buying signals into sales pipeline. The post is short — a tagline and a discussion link — but the signal-to-pipeline claim is explicit: the user is not scraping the public web by hand and routing the results through a CRM by hand, the system turns signals into pipeline entries. The source names the actor (a sales team that wants public buying signals turned into pipeline), the pain (the team reads the public web by hand and routes by hand), and the missing thing (a system that turns public buying signals into sales pipeline entries). It does not name a specific signal source, a specific CRM, or a specific pipeline stage.

## Objective

Ship a system that turns public buying signals into sales pipeline entries, so the user does not read the public web by hand and does not route the results into a CRM by hand, and the signals become a live pipeline the team can act on.

## Target Users

- Sales teams that want public buying signals turned into pipeline entries without manual scraping and manual routing.
- Revenue operations leaders who want a single signal-to-pipeline view across their team's accounts.
- Account executives who want a feed of buying signals for the accounts in their book.
- Outbound teams who want a steady stream of new-account signals to seed their outbound motion.
- Marketing teams who want to align their campaign work with the buying signals the sales team is acting on.

## MVP Scope

- A signal ingestion layer that watches public buying signals (new hires, funding rounds, job postings, product launches, tech-stack changes, executive quotes — the source names no specific set; the set is the system's claim).
- A signal-to-account matching layer that attaches each signal to a known account.
- A pipeline-entry generator that turns a matched signal into a pipeline entry (account, signal, suggested next action).
- A CRM routing layer that pushes pipeline entries into the team's CRM (the source names no specific CRM; the integration is the system's claim).
- A signal feed the user can read in the system before the pipeline entry is routed.
- A pipeline stage surface that shows where each signal-derived entry sits.
- A per-user signal subscription list the user can curate.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The signals are public. A signal that requires private access is a coverage gap, not a feature.
- The signal-to-account matching is the system's claim, not the user's. The user does not tag the signal by hand; the system attaches it.
- The pipeline-entry generator produces a structured entry (account, signal, suggested next action), not a free-form note.
- The CRM routing is configurable. The user picks the CRM; the system pushes the entry through the configured integration.
- The signal feed is the user's pre-routing review. The user reads the signal before it becomes a pipeline entry.
- The signal subscription list is per-user. A signal the user has not subscribed to does not enter the user's feed.