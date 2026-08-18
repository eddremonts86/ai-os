---
id: "296"
slug: high-costs-and-complexity-of-api-integration-for-launch
title: High costs and complexity of API integration for launching a travel website
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/travel/cgh3qpuuy1-high-costs-and-complexity-of-api-integration-f"
category: dev
date: "2025-10-29"
tags: [Travel, Dev, Business]
country: India
tech: [Next.js 14, TypeScript, Postgres, TBO Holidays / Travelport / Hotelbeds adapters, Razorpay, AWS S3 / Cloudflare R2, OpenAI function-calling]
---
# High costs and complexity of API integration for launching a travel website

## Tech Stack

- Next.js 14 (App Router) + TypeScript for the white-label storefront template.
- Postgres on Hetzner for agent profiles, search cache, bookings, mark-ups.
- TBO Holidays + Hotelbeds + Travelport adapters (3 suppliers in v1).
- Razorpay for INR payments (cards + UPI + netbanking).
- Cloudflare R2 for static assets; wildcard SSL for sub-domains.
- Redis for search-result caching.
- OpenAI function-calling for natural-language search (deferred to v2).

## Architecture

Single Next.js storefront template with theme tokens per agent. Supplier adapters live behind a normalised API: search(hotel | flight) → results → book → confirm. Sub-domain routing via wildcard DNS + cert; agent profile resolved per host header. Mark-ups applied at the result level, transparent in the UI. Cancellations follow supplier SLAs; platform monitors and surfaces SLA breaches.

## Milestones

1. **M0** — Spec freeze, TBO Holidays adapter, single-agent MVP. End of week 1.
2. **M1** — Hotelbeds adapter + multi-supplier search + Razorpay INR checkout. End of week 4.
3. **M2** — White-label sub-domain template + agent console for mark-ups. End of week 7.
4. **M3** — Cancellations + supplier SLA monitoring. End of week 10.
5. **M4** — Onboard 50 agents across tier-1/tier-2 cities. End of week 14.

## Risks

- **Supplier API drift** — Mitigation: contract tests nightly; failover search when a supplier is down.
- **Wildcard SSL setup** — Mitigation: Cloudflare for SaaS with auto-issued certs.
- **Agent lock-in** — Mitigation: export agent mark-ups and customer list as CSV at any time.
