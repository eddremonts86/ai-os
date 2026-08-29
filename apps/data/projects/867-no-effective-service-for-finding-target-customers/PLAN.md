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

## Tech Stack

- **Python with FastAPI** for the service layer, because the workbench is data-heavy and request shape varies a lot per source, and Python's standard library plus the available packages for HTTP, parsing and browser automation keep the surface small.
- **Playwright** for the collectors that need a real browser to render the source page, since several public sources hide content behind client-side rendering and a plain HTTP client returns nothing useful.
- **DuckDB** as the local store, chosen because the operator runs this on one machine, the working set is medium-sized and analytical, and DuckDB's columnar engine makes profile-to-list scoring fast without an operational database to maintain.
- **HTMX with server-rendered HTML** for the operator dashboard, since the work is forms, tables and filters rather than a client-side application, and the operator is not a developer.
- **Caddy** as a single-binary reverse proxy and TLS terminator, because the workbench is self-hosted by requirement and Caddy ships one static binary with no external dependencies.
- **asyncio** as the concurrency model inside the collectors, so a slow source does not stall the whole run and rate limits are honored per channel.

## Architecture

The operator is the only writer of the buyer profile. The profile is plain text plus a small structured section — who they are looking for, what they need, where they already gather, what counts as evidence that someone fits. The structured fields are stored as typed columns in DuckDB; the plain-language text is stored alongside them and is what the operator reviews, since the matcher is only as honest as the description.

Sources are explicit. Each source declares what it is, what URL pattern it serves, what a candidate looks like and what rate limit it expects from the operator. Collectors are small programs that take a buyer profile and a source declaration and return candidates; they use Playwright when the source needs it and asyncio for the rest. A candidate row carries the source id, the URL that produced it, the time of collection and the raw fields the source exposes, so a reviewer can re-derive every contact in the output from the row.

Matching happens in DuckDB. Each candidate is scored against the buyer profile by a SQL expression the operator can read and adjust; only candidates that cross a threshold are surfaced. The output is a deduplicated, deduplicated-by-fingerprint contact list with the source row attached, exportable as CSV. Per-source rate limits live in the same store as the candidates, so an operator can audit the whole pipeline from a single connection without joining across systems.

## Milestones

1. **M1 — Profile and source model** — buyer-profile intake, source declarations and the per-source rate-limit table, with a test that a candidate row cannot be exported without its source row attached.
2. **M2 — Collector framework** — the Playwright and asyncio collector skeletons, the per-source rate-limit enforcement, and one working source end to end.
3. **M3 — Match step** — DuckDB scoring expression, threshold configuration, and the deduplication-by-fingerprint pass.
4. **M4 — Operator dashboard** — server-rendered pages for buyer profiles, source configuration, run history and the export action.
5. **M5 — Audit view** — a page that resolves every contact in the most recent export back to its source row and shows the operator the full provenance chain.
6. **M6 — Second source** — a second collector against a structurally different source, to confirm the framework does not assume the first source's shape.

## Risks

- **Source drift** — a public source that changes its structure silently produces empty results, so collectors must fail loudly and the operator dashboard must surface that failure rather than hide it.
- **Rate-limit breach** — exceeding a source's rate limit is a permanent block, not a slow queue, so the design must honor per-source limits and stop the channel when they are hit.
- **Match that matches nothing** — a buyer profile that is too tight produces an empty list, and the operator's first reaction is usually to widen the profile rather than the threshold, so the UI has to explain the difference.
- **Personal data scope** — the workbench stores what the source exposes, and any enrichment the operator does downstream is the operator's responsibility, so the data model must not blur that line.
- **Self-hosted on a single machine** — DuckDB is the right choice at one operator's scale, and a different operator's scale will need a different store; that boundary has to be measured rather than guessed.
- **Unverifiable exports** — a CSV without provenance columns is the failure the audit view exists to prevent, so the export action must refuse to produce one.
