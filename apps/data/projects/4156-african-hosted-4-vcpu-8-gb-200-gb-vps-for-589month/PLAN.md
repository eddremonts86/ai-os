---
id: "4156"
slug: african-hosted-4-vcpu-8-gb-200-gb-vps-for-589month
title: African-hosted 4-vCPU / 8-GB / 200-GB VPS for $5.89/month
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49506792"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Product]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# African-hosted 4-vCPU / 8-GB / 200-GB VPS for $5.89/month

## Tech Stack

Static landing/reference page rendered with the existing TanStack Start stack. No backend, no checkout, no live pricing API. Markdown source for the body so the spec sheet and benchmarks can be updated when the poster publishes a follow-up.

## Architecture

One page, one document. The page renders the spec sheet (location, AS, virtualisation, OS, kernel, vCPU, RAM, disk, bandwidth, IPv4), the as-of benchmark numbers, the ZAR-denominated pricing rationale, and the list of additional benchmarks the poster invited. No client-side state, no forms.

## Milestones

Draft the spec sheet table from the post, draft the benchmark table from the post, write the pricing rationale paragraph, list the open benchmark questions, publish the page, link it back to the HN thread.

## Risks

Risk that the spec sheet or pricing goes stale. Mitigate with a date stamp and an "as announced" framing. Risk of misrepresenting an SLA the post never claimed: the page must not invent one. A third risk is currency drift; the page quotes R-amount as primary and labels the $5.89 figure as the poster's conversion.