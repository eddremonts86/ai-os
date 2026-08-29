---
id: "858"
slug: automating-b2b-marketing-database-segmentation-client-p
title: "Automating B2B Marketing: database segmentation, client profiling, and contact parsing"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8kr7mskh41-automating-b2b-marketing-database-segmen"
category: marketing
date: "2025-11-04"
tags: [Marketing, AI, Other]
country: Russia
tech: [Django, Python, Celery, PostgreSQL, Redis, dbt (DuckDB warehouse), Apache Superset (read-only), OpenAI API (parsing), DuckDuckGo SERP scraping (operator-controlled), YooKassa (sandbox), Coolify, Docker]
---
# Automating B2B Marketing: database segmentation, client profiling, and contact parsing

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries the placeholder `_Not written yet_`, and the title — "Automating B2B Marketing: database segmentation, client profiling, and contact parsing" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no specific segment, no contact source named, no tool mentioned, no volume cited. The honest ground truth is therefore the title plus the `Marketing, AI, Other` tags plus the country Russia.

The problem the title names is real and recurring across B2B marketing teams, and Russia is a plausible market for a self-hosted alternative given the data-residency and tool-availability questions many Russian B2B teams have faced in recent years. B2B marketing today is a fragmented pipeline of CSVs from events, scraped LinkedIn profiles, manually-typed company descriptions, exported CRM records, scraped contact pages and ad-hoc enrichment calls to a third-party data vendor. Segmentation runs in spreadsheets; client profiling runs in Notion pages that drift out of date; contact parsing runs in copy-paste from email signatures and LinkedIn messages. The friction is not that any single step is hard, it is that the steps do not compose, the data decays, and the human time spent maintaining it is the largest cost in the operation.

The product implication, without inventing specifics, is that a B2B marketing team needs a way to ingest contacts and company records from the messy sources they already have (CSVs, email signatures, scraped pages, exported CRMs), normalise and enrich those records into a unified contact and company schema, segment the unified database by criteria the operator defines, and surface a client profile per company that the sales team can read and update. The MVP is a data pipeline plus a segmentation and profiling surface; it is not a CRM, it does not replace the team's existing CRM, and it does not scrape the open web without operator-controlled inputs. Country-specific facts the capture does not state — current Russian data-residency and personal-data rules, the specific Russian payment processors available, the specific CRM platforms the Russian B2B market uses, or any LinkedIn-scraping restriction that applies in the operator's jurisdiction — are flagged as open questions rather than asserted.

## Objective

Ship a self-hosted B2B marketing automation product that ingests contacts and company records from operator-controlled sources (CSVs, email-signature parses, exported CRMs, operator-supplied scraped pages), normalises and enriches those records into a unified contact and company schema, supports segmentation by operator-defined criteria, and renders a per-company client profile the sales team can read and update. The product must work with the operator's existing CRM as the system of record, must keep every enrichment step auditable and versioned, and must remain usable on a single self-hosted machine.

## Target Users

- Russian B2B marketing teams at small and mid-sized companies who currently maintain segmentation in spreadsheets and client profiles in Notion pages, and want a self-hosted tool that survives a data-residency audit.
- Russian B2B sales-operations staff who spend hours every week reconciling CSV exports from events, enrichment calls and CRM exports, and want a unified schema to land them in.
- Russian marketing agencies serving multiple B2B clients, who need to keep segmentation and profiling work isolated per client inside one self-hosted instance.
- Russian B2B founders and heads of sales who need a client profile per target account before the first sales call, and want it generated rather than hand-typed.
- Russian event-marketing teams who export attendee lists from conferences and need them normalised into the same contact and company schema as the rest of the database.
- Russian B2B marketers who have been blocked from Western enrichment vendors and need a self-hosted alternative they can run against Russian-language sources.

## MVP Scope

- CSV ingestion that accepts the messy exports the operator already has (events, CRM exports, manual lists), normalises into a unified contact and company schema, and reports per-row issues for the operator to triage.
- Email-signature parsing that extracts contact details from forwarded emails and signature blocks, with the parsed fields surfaced as suggestions rather than silent overwrites.
- Operator-controlled web-page ingestion that accepts a URL or a list of URLs and extracts contact details from the page, behind an explicit per-domain rate limit and a clear consent-to-scrape log.
- Enrichment steps that are explicit and auditable: each enrichment produces a versioned record, never overwrites an existing field, and is traceable to the source that produced it.
- A segmentation builder that supports operator-defined criteria over the unified schema, with the resulting segments stored as named, versioned lists.
- A per-company client profile that assembles contacts, segment memberships, recent enrichments and operator notes into a single readable surface, with a link back to the underlying records.
- A read-only analytics surface for segment size, enrichment freshness and contact decay, backed by a small dbt-on-DuckDB warehouse so the analytics stays separate from the operational store.
- An explicit non-CRM-replacement disclaimer on every output, naming that the team's existing CRM remains the system of record and the product writes back only when the operator triggers a write.
- Audit logging of every ingestion, enrichment, segmentation and write-back, with the source and the version referenced.
- An export of any segment as a CSV the operator can hand back to a sales-ops colleague.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product is an enrichment and segmentation tool only; it is not a CRM, it does not replace the team's existing CRM, and the disclaimer must be visible on every output.
- Every ingestion and enrichment source is operator-supplied and operator-controlled; the product does not crawl the open web without an explicit operator input list and an audit trail per scrape.
- Every enrichment is auditable and versioned: enrichment never overwrites an existing field silently, and every output is traceable to the source that produced it.
- Personal data processed by the product (contacts, email signatures, scraped pages) is sensitive under Russian personal-data law and likely under GDPR for any EU-resident contact; a documented retention policy must exist before any pilot user is onboarded.
- Email-signature parsing produces suggestions, not authoritative overwrites; the operator must approve each parsed field before it becomes the canonical value.
- Web-page ingestion must respect per-domain rate limits and an opt-out mechanism for site owners; a single rate-limit-exceeded event must not be the cause of a silent scrape failure.
- The MVP must not generate outreach messages; the segmentation output is a CSV or a segment list, not a copy-and-paste email blast, and that boundary has to be enforced in product copy and in the UI.
