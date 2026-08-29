---
id: "875"
slug: ai-agent-for-automatic-seo-promotion-of-websites-on-wor
title: AI agent for automatic SEO promotion of websites on Wordpress and Tilda
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/seo/6ajl0f17x1-ai-agent-for-automatic-seo-promotion-of"
  captured: "2025-10-28"
category: seo
date: "2025-10-28"
tags: [SEO, Marketing, AI, Other]
country: Serbia
wtp:
  raw: $6–18/month per client
  currency: USD
  min: 6
  max: 18
  period: month
  mrrMid: 12
tech: [Next.js (agency dashboard), Node.js worker (article generation + publishing), Postgres, WordPress REST API + Tilda API connectors]
---
# AI agent for automatic SEO promotion of websites on Wordpress and Tilda

## Problem

The poster is a web developer who has been building sites on WordPress / Tilda / Wix for 7–8 years and has 300+ active clients. Roughly 1 in 3 to 1 in 4 of those clients (the poster's own estimate: 25–30%) asks them to recommend an SEO specialist. The poster has only one verified SEO specialist, and that person is physically unable to take on more than 10 clients, so the majority of SEO requests go unanswered. The poster believes the right fix is an AI agent that automatically performs SEO promotion through an embeddable blog — generating unique articles based on target keywords and publishing them to the client's site on a schedule, so each client gets continuous SEO work without requiring a dedicated specialist.

## Objective

Ship an AI agent that plugs into an existing WordPress or Tilda site, generates and publishes unique SEO articles on a target keyword set, and reports on what was published and how it ranks, so a web agency can offer it as a low-touch add-on to 25–30% of their existing clients (the ones asking for SEO) at $6–18/month per site, with results visible within 2–3 months.

## Target Users

- **Primary:** the poster's clients — SMB owners whose WordPress / Tilda / Wix sites were built by an agency and who are now asking "can you also handle my SEO?". They have no SEO specialist of their own and a budget of $6–18/month per site.
- **Secondary:** small web agencies and freelancers who build sites on WordPress / Tilda / Wix and face the same 25–30% SEO-request rate, with no in-house specialist and no scalable subcontractor.
- **Tertiary:** independent SEO consultants who want a content-production pipeline they can pair with their own strategy and review.

## MVP Scope

- An agency dashboard: per-client workspace, target keyword set (manual entry or scraped from the client's site), publishing schedule (e.g. 4 articles/month), tone-of-voice notes.
- A per-site connector: WordPress (via Application Passwords + REST API), Tilda (via Tilda API). Wix connector is out of scope for v1; the dashboard marks "Wix not yet supported" for those clients.
- An article-generation worker: per article, the worker takes a target keyword, fetches the client's existing site content as context, drafts a 600–1200 word article with a target keyword density and internal links back to the client's existing pages, runs a duplicate-content check, and submits the draft for human approval.
- A publishing layer: on approval, the worker publishes via the connector (WordPress as draft or as published post; Tilda via the API), with metadata (title, meta description, slug, focus keyword) filled in.
- A reporting surface: per-client, list of articles published, target keywords covered, and the search-console data the client shares (read-only OAuth or manual CSV upload).
- A review queue: every article must be approved by the agency before publication. There is no "publish without review" mode in v1.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster's client budget is $6–18/month per site, with results expected in 2–3 months. The product must be self-funding at ~$12 MRR per site, which means the article-generation cost per site must stay under a few dollars per month.
- Every published article must be approved by the agency first. Auto-publishing without review is out of scope for v1 and is the single biggest reputational risk if shipped.
- Each connector must work against the actual WordPress / Tilda API the client's site exposes; the dashboard must surface a clear test ("can we connect to this site?") and a clear failure mode if the credentials are wrong.
- No black-hat SEO tactics: no spun content, no PBNs, no cloaking. The duplicate-content check must be real, and the worker must surface the score before approval.
- The product must not assume the agency has access to the client's Google Search Console; if they do not, the reporting surface degrades to "articles published" without ranking data, and the dashboard says so.
