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

## Tech Stack

- **Django** for the operator-facing web app and the API surface, because Django's ORM, admin and migration tooling are a strong fit for an ingestion-and-enrichment product with a relational core.
- **Python** end to end so the parsing, enrichment and dbt models share types with the Django app.
- **Celery** for the ingestion and enrichment job queue, with Celery Beat for scheduled re-runs of enrichment pipelines.
- **PostgreSQL** as the operational store for contacts, companies, segments, enrichment versions, write-back audit logs and operator preferences.
- **Redis** as the Celery broker and the cache for parsed-signature suggestions and segment definitions.
- **dbt (DuckDB warehouse)** for the analytics layer that powers contact-decay, enrichment-freshness and segment-staleness metrics, kept separate from the operational store so analytics queries cannot slow ingestion.
- **Apache Superset (read-only)** as the operator-facing analytics surface, configured against the dbt-on-DuckDB warehouse with a single-admin role.
- **OpenAI API (parsing)** for email-signature and web-page parsing behind a per-request cost gate and a content-hash cache.
- **DuckDuckGo SERP scraping (operator-controlled)** as the day-one web-search primitive, gated behind an explicit per-operator input list and a per-domain rate limit.
- **YooKassa (sandbox)** as the Russian payment-processor integration for any paid tier, behind a single subscription product at launch.
- **Coolify** for hosting, on a single container for the MVP with the operational store kept in a managed PostgreSQL volume for backups.
- **Docker** for local development parity and for the production container images.

## Architecture

The operator-facing web app is a Django application that exposes the ingestion UI, the segmentation builder, the per-company profile view and the operator admin. Ingestion is submitted as a CSV upload, an email-signature paste or a CRM-export upload, and is enqueued onto Celery with a per-job audit record.

The Celery workers run the ingestion and enrichment pipeline. Each enrichment produces a versioned record keyed on (contact_id, field_name, source_kind, source_id), so a re-run creates a new version rather than overwriting the canonical value. The canonical value is the operator-approved most-recent version; the operator can review and approve or reject any enriched field from the Django admin. Email-signature parsing produces suggestions surfaced in a review queue, not authoritative overwrites. Web-page ingestion is run only against an operator-supplied URL list and respects a per-domain rate limit with an exponential back-off on 429 responses.

The segmentation builder runs over the unified schema in PostgreSQL, producing named, versioned segments. Each segment carries a definition (a serialised criterion set), a creation timestamp and an export history. Segments can be re-run on demand or on a schedule, and the export history preserves every CSV the operator has handed to a sales-ops colleague.

The per-company profile is rendered server-side from the unified schema and the segment memberships, with a link back to every underlying record. The analytics layer is built in dbt-on-DuckDB against a read replica of the operational store, so analytics queries cannot slow ingestion; Apache Superset is configured read-only against the dbt models and exposed behind a single-admin role.

The non-CRM-replacement disclaimer is rendered in the operator-facing UI and in every CSV export header. Audit logs record every ingestion, every enrichment version, every segmentation run, every CSV export and every write-back, with the source and version referenced. The OpenAI API call is rate-limited per request and cached against the content hash, so repeated parsing of the same signature or page does not multiply the bill.

## Milestones

1. **M1 — Ingestion** — Django app, PostgreSQL schema for the unified contact and company model, CSV ingestion with per-row issue reporting, and the Celery queue skeleton.
2. **M2 — Enrichment v1** — versioned enrichment records, OpenAI API parsing behind a per-request cost gate, email-signature review queue with operator approval.
3. **M3 — Segmentation** — segmentation builder over the unified schema, named and versioned segments, CSV export with audit-trail header.
4. **M4 — Client profile** — per-company profile assembled from contacts, segment memberships, recent enrichments and operator notes.
5. **M5 — Analytics** — dbt-on-DuckDB warehouse with contact-decay, enrichment-freshness and segment-staleness models, read-only Apache Superset behind admin auth.
6. **M6 — Operator-controlled web ingestion** — per-operator URL list, per-domain rate limit, opt-out mechanism, audit log per scrape.

## Risks

- **Silent overwrites** — an enrichment that overwrites an operator-approved field is the worst failure mode; the version-on-write semantics and the operator review queue are required from day one.
- **Scraping scope creep** — web ingestion that quietly broadens from an operator input list to open crawling is a legal and reputational risk; the explicit per-operator input list and the per-domain rate limit must be enforced.
- **PII exposure** — ingested contacts and scraped pages fall under Russian personal-data law and possibly under GDPR for EU-resident contacts; a clear retention policy must exist before the first pilot user.
- **Disclaimer invisibility** — a CSV export that does not visibly carry the non-CRM-replacement disclaimer is a CSV that an operator might treat as authoritative for downstream sales tooling; the disclaimer is a feature, not a footer.
- **Write-back sync failures** — write-backs to the existing CRM that silently fail leave the operator thinking the CRM is updated when it is not; per-write status surfacing is required.
- **Analytics slowing ingestion** — analytics queries run against the operational store can starve ingestion workers; the dbt-on-DuckDB separation exists for a reason and must be respected.
- **Outreach creep** — a segmentation tool that quietly grows into an outreach tool is a regulatory and consent failure; the MVP must not generate copy and the boundary must be enforced in product copy and in the UI.
