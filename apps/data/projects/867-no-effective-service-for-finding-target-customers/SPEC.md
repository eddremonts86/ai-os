---
id: "867"
slug: no-effective-service-for-finding-target-customers
title: No effective service for finding target customers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/voyb4a4nb1-no-effective-service-for-finding-target"
category: marketing
date: "2025-10-29"
tags: [Marketing, Other]
country: Russia
tech: [Python, FastAPI, Playwright, DuckDB, HTMX, Caddy]
---
# No effective service for finding target customers

## Problem

The capture names one problem and one country and nothing else: no effective service for finding target customers, filed from Russia under marketing with a generic Other tag. It is a category-level statement from ProblemHunt, so there is no poster narrative, no product description, no quoted budget and no named incumbent. What follows reasons from the title and the country only.

Finding target customers is the part of marketing where a small business or solo operator tries to identify who would buy the thing they sell and where those people actually are. The complaint in the title is not that the work is hard, it is that the available services do not work for the person asking. That can mean several different things: the directory the operator found is full of irrelevant contacts, the advertising platform the operator tried does not reach the right audience in the right country, the export the operator bought is a list of names with no way to filter or verify them, or the operator is in a market where most of the well-known tools are either unavailable or unfit. The honest reading is the narrowest one that addresses all of these at once: a person selling something cannot reliably identify, verify and reach the people who would buy it, and the services they tried did not close that gap.

The country in the frontmatter is Russia, which the design has to take seriously without inventing specifics about Russian marketing law, payment processors or platform availability. The general shape that follows is what is knowable: the operator needs a way to describe who they are looking for, to gather evidence about who those people actually are, and to produce a contactable list from that evidence without depending on a service that is unavailable or does not fit the audience. Anything beyond that shape stays an open question, because the source did not name a product, a budget or a market segment.

## Objective

Build a self-hosted customer-discovery workbench that does three things and no more: lets the operator describe the buyer they are looking for in their own words, gathers publicly available evidence that those buyers exist and where they congregate, and produces a deduplicated, verifiable contact list the operator can act on. The system owns the collection, the storage and the rendering of that evidence; it does not own outreach, and it does not pretend to know what the operator is selling.

## Target Users

- Solo founders and small business operators in Russia selling a specific product or service, who cannot identify or reach the people who would buy it through the services they have already tried.
- Marketing leads at very small companies whose only available signal is the operator's own description of their buyer, and who need a workflow that turns that description into a list.
- Independent consultants and freelancers offering a niche skill, whose target audience is defined by occupation, region or interest rather than by company size.
- Operators in restricted or unusual markets where the mainstream customer-discovery services are either unavailable, unfit, or priced for a market that is not theirs.
- Compliance or data-protection reviewers who need to see exactly where every contact in the output came from, because the operator is responsible for how the list is used downstream.

## MVP Scope

- Buyer-profile intake in plain language: who the operator is selling to, what they need, where they already gather, and which signals the operator considers evidence that someone fits.
- Source definition: a list of public channels the operator wants the workbench to draw from, with each source declaring what counts as a match.
- A collector that fetches candidate profiles from those public sources, using Playwright for sources that require browser rendering, with per-source rate limits visible to the operator.
- A match step that scores each candidate against the buyer profile, returning only those that cross a threshold the operator can adjust.
- A deduplicated, deduplicated-by-fingerprint contact list, with the evidence row that produced each entry attached and viewable.
- An export of the verified contacts as CSV with provenance columns, so the operator knows where every row came from.
- Per-source consent and rate-limit settings stored in the same database as the contacts, so a reviewer can audit the whole pipeline from a single connection.
- A simple operator dashboard built with server-rendered pages and HTMX, since the work is data-heavy and the operator is not a developer.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source names neither product, market segment nor budget, so the buyer-profile model must not assume an industry, a region, a company-size range or a price point. Everything that varies across operators stays operator input.
- Personal data in this domain is regulated, and the system stores the evidence, not the operator's enrichment of it. Anything that touches a contact must carry the source row that produced it.
- Public sources change their structure without warning; collectors must fail visibly and stop the affected channel rather than silently producing empty results.
- Rate limits belong to the source, not to the operator, and exceeding them is a permanent block rather than a slow queue, so the design must surface them.
- Russia is the named market, so the workbench must run without depending on a third-party service that is unavailable from that country. Self-hosted is not a marketing line here, it is a hard requirement.
- The output of the workbench is a list, not a campaign. Outreach is downstream and the system is not built to send, schedule or track messages.
