---
id: "899"
slug: need-to-withdraw-cash-from-credit-card-without-high-fee
title: Need to withdraw cash from credit card without high fees
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/6obgkxdbi1-need-to-withdraw-cash-from-credit-card-w"
  captured: "2025-10-10"
category: finance
date: "2025-10-10"
tags: [Finance]
country: Portugal
tech: [Next.js, TypeScript, Node.js API, PostgreSQL, a curated fee-database of Portuguese ATMs and bank cash-advance policies, Plaid / TrueLayer aggregator where available, no transactional money handling in v1]
---
# Need to withdraw cash from credit card without high fees

## Tech Stack

- **Frontend:** Next.js + TypeScript, server-rendered so the lookup URL is shareable ("here is the cheapest ATM for my card in Lisbon") and the fee-database citations are crawlable.
- **Backend:** Node.js API; the lookup is read-only against the fee database, with caching at the edge so the common queries do not touch Postgres.
- **Data:** PostgreSQL for the fee database (banks × card networks × fee types × last-verified-date × source link); no user PII stored beyond optional email for fee-update alerts.
- **Aggregator integration:** Plaid / TrueLayer-style bank aggregator as a Phase 2 option; v1 is lookup-only, with the user typing their issuer, because that decision keeps the product out of PCI scope and out of the regulator's closer attention.
- **Deployment:** Coolify on a small Hetzner VPS; static-friendly hosting means a single small instance can serve the entire Portuguese-resident audience at v1 volumes.

## Architecture

```
User (browser)
    │
    ▼
Next.js (lookup page + shareable result URL)
    │
    ├─▶ /api/lookup ──▶ PostgreSQL fee database (read-only)
    │                       │
    │                       └─▶ edge cache (5-minute TTL per query hash)
    │
    └─▶ /api/affiliate/click ──▶ disclosure-wrapped redirect to fee-free card partners
```

The fee database is the load-bearing piece; everything else is plumbing around it. Every fee entry has a source link (the bank's published fee schedule, Multibanco's surcharge disclosure, or the regulator's published rate) and a `last_verified_at` timestamp so the UI can show "this rate was checked N days ago" rather than implying an evergreen accuracy that the data does not have.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + the fee-database schema and the source-link requirement approved. End of week 1.
2. **M1 — Fee database v0.** Coverage of the 7 largest Portuguese banks plus Multibanco, for Visa and Mastercard; every entry has a source link and a verified date. End of week 3.
3. **M2 — Lookup page.** Next.js form, ranked result list for €100 / €200 / €500, shareable URL per result. End of week 5.
4. **M3 — Comparison + affiliate disclosure.** Side-by-side credit-card cash advance vs fee-free debit-card products; affiliate disclosure copy reviewed by counsel. End of week 7.
5. **M4 — Pilot.** 1,000 Portugal-resident users complete a lookup; fee-update email workflow validated for the supporter tier (Phase 2). End of week 10.

## Risks

- **Stale fee data.** A fee lookup that is wrong is worse than no lookup at all. The 90-day verification cadence is a hard rule, and the UI must surface the verification date on every result so the user can see how fresh the data is.
- **Affiliate disclosure trust.** A fee-lookup product that quietly earns from affiliate clicks is the kind of disclosure failure that destroys the trust story the product is built on. The disclosure must be visible before the click, not buried in a footer.
- **Cross-border creep.** A Portugal-specific tool that tries to "also work in Spain" with stale data is worse than a Portugal-only tool that is sharp. Expansion must be data-led: each new country gets its own fee database reviewed before launch.
- **Aggregator integration lock-in.** If a Plaid or TrueLayer integration is added in Phase 2, the dependency becomes a single point of failure for the "type your issuer" autocomplete. The schema must support a manual-entry fallback even after the aggregator is wired in, so a provider outage degrades to "type the name" instead of "search is down".
