---
id: "3681"
slug: free-lifetime-pro-access-for-limited-time-to-crunchbase
title: Free lifetime pro access for limited time to crunchbase alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485867"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Next.js, Postgres with pgvector, Python ingestion workers, Meilisearch, Cloudflare R2, Stripe]
---
# Free lifetime pro access for limited time to crunchbase alternative

## Tech Stack

- **Web:** Next.js with static generation per company profile and per sector index. Profiles change rarely and must be crawlable and citable, so rendering them at build time beats a client-side directory.
- **Store:** Postgres for companies, funding rounds, sector taxonomy, sources and entitlements. `pgvector` alongside it for similar-company lookups, which is how the competitive-analysis section gets drafted without a hand-maintained competitor table.
- **Ingestion:** Python workers, one per source adapter, writing candidate facts with a mandatory source reference. Python because the extraction and dedupe work lives closer to the scraping and NLP libraries than to the web tier.
- **Search:** Meilisearch for typo-tolerant company lookup across a few hundred thousand names. Postgres full-text would do at launch; Meilisearch is the cheaper answer once sector filters and prefix matching are both expected.
- **Media:** Cloudflare R2 for logos and profile assets, served from a CDN so profile pages stay cheap to serve to a cohort that is never billed.
- **Billing and entitlements:** Stripe for post-campaign Pro. Lifetime grants are entitlement rows, never Stripe subscriptions — a grant that does not exist in the billing system cannot be broken by a price change.

## Architecture

Three planes that do not share a lifecycle. The **ingestion plane** runs source adapters on a schedule: each writes candidate facts (funding round, headcount, competitor edge) tagged with the source URL and retrieval date, into a staging table. A promotion step resolves conflicts between sources and writes the accepted fact to the profile, keeping the losing candidates for audit. The **publish plane** renders sector indexes and profile pages from accepted facts, so what a reader sees always has a provenance record behind it. The **account plane** holds users, contributions and entitlements; it is the only place that knows whether an account is free, Stripe-Pro, or lifetime-Pro, and every gated field asks it rather than checking a plan string.

Contributions invert the ingestion flow: a suggested edit lands in the same staging table as a machine-extracted candidate, with the contributor as its source, and goes through the same promotion step. That is what makes "community-driven" a mechanism instead of a label — human and machine facts compete on the same terms.

## Milestones

1. **M0 — Taxonomy and provenance model frozen.** Sector list, profile field set, and the rule that no published fact exists without a source row. End of week 2.
2. **M1 — One sector, deep.** Ingestion adapters for two public sources, promotion step, and profile pages for a single sector with funding and team populated. End of week 5.
3. **M2 — Entitlements and the grant path.** Free/Pro field gating driven by entitlements, capped lifetime-grant issuance with the grandfathering flag, redemption flow. End of week 7.
4. **M3 — Remaining sectors.** The full advertised taxonomy live, each sector meeting the profile-depth floor rather than merely existing. End of week 11.
5. **M4 — Contribution loop.** Suggest-an-edit, review queue, contributor attribution, and grant issuance tied to accepted contributions. End of week 13.
6. **M5 — Campaign and post-campaign pricing.** Run the limited-time giveaway against the cap; then open Stripe Pro at a price that stands without the free cohort. End of week 16.

## Risks

- **Provenance debt.** The fastest path to a full directory is ingesting without recording where each number came from. That path is unrecoverable: a corpus of unsourced funding figures cannot be audited later, only rebuilt. The source row has to be mandatory in the schema from M0, not a later migration.
- **The giveaway outliving the business.** Lifetime Pro is permanent cost against a revenue line that does not exist yet. Without a hard cap and a known per-account serving cost, the campaign that solves cold start becomes the reason the product cannot be funded.
- **Grandfathering as a pricing straitjacket.** Promising lifetime holders every future Pro feature removes the option of tiering Pro later. Any premium surface would have to sit outside Pro entirely, which is a product-shape constraint, not a billing detail.
- **AI extraction accuracy on funding numbers.** A wrong round size on a public profile is the failure that ends the project's credibility, and the launch's own comparison target is a company whose whole value is that its numbers are checked. Human review on funding facts should be assumed necessary until measured otherwise.
- **Source terms.** Several obvious inputs prohibit derived databases. If the adapters that make coverage viable turn out to be the prohibited ones, the ingestion plane needs a different source set, and coverage timelines move with it.
- **No demand signal.** The Show HN post carried 1 point and no comments when captured. Every milestone past M2 is a bet placed without evidence that the directory is wanted at all; the campaign's redemption rate is the first real reading.
