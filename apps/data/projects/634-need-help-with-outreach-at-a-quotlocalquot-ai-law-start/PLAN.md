---
id: "634"
slug: need-help-with-outreach-at-a-quotlocalquot-ai-law-start
title: "need help with outreach at a \"local\" AI law startup (i will not promote)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp036s/need_help_with_outreach_at_a_local_ai_law_startup/"
category: startups
date: "2026-08-15"
---
# need help with outreach at a "local" AI law startup (i will not promote)

## Tech Stack

- **Collection:** Python. The work is scraping registers and directories with irregular HTML and
 parsing names and practice areas out of them; this is the one part of the stack chosen because
 the language's libraries fit the job.
- **API + app:** Node with Fastify and a small React front end. The interface is a list, filters,
 and a cost figure.
- **DB:** PostgreSQL. Deduplicating practitioners across overlapping registers is a join and
 constraint problem, and it is the core data problem here.
- **Queue:** a database-backed job table, not a broker. Collection runs are scheduled and
 low-volume; a broker would be infrastructure without a load to justify it.

## Architecture

Collectors write raw records per source. A resolution step merges them into practitioners on
name plus firm plus registration number where available, keeping every source link so a record
can be defended. Qualification is a scored view over the merged table, not a stored flag, so
changing the definition of "works with documents a lot" does not require re-collecting anything.

Keeping qualification as a view is the decision that matters: the poster does not yet know what a
power user looks like, so the definition will change more often than the data.

## Milestones

1. **M0** — one register collected and parsed, records stored with source links.
2. **M1** — resolution across two overlapping sources, with a duplicate rate to report.
3. **M2** — the qualification view, and the ability to change its definition without recollecting.
4. **M3** — one outreach channel with consent and legal basis recorded per contact.
5. **M4** — cost per qualified practitioner reached, which is the number the poster actually asked
 for.

## Risks

- **Legality is the whole product's viability, not a compliance checkbox.** Cold outreach to
 lawyers runs into bar rules and GDPR at the same time. If the legal basis cannot be established
 per contact, the list cannot be used and nothing else here matters.
- **Registers resist collection.** Bar association sites are often deliberately hard to enumerate,
 and terms of use may forbid it outright.
- **A list is not demand.** The poster's traffic died because the product was not good enough.
 Reaching more of the right lawyers earlier would have wasted them. Timing is the unstated risk.
- **This capture is a near-duplicate of plan 635** — the same founder posted twice about the same
 situation. 634 is scoped to paid acquisition; 635 to re-earning attention after a failed first
 launch. Neither should be read as an independent signal of demand.
