---
id: "866"
slug: the-systemic-crisis-of-athlete-transition
title: The systemic crisis of athlete transition
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/jovbc4bek1-the-systemic-crisis-of-athlete-transitio"
category: fitness
date: "2025-10-29"
tags: [Fitness, Health, Career]
country: USA
tech: [Elixir, Phoenix LiveView, PostgreSQL, Oban, S3-compatible object storage, Fly.io]
---
# The systemic crisis of athlete transition

## Tech Stack

- **Elixir with Phoenix LiveView** for the application: the intake and translation worksheets are long, stateful, multi-step forms where a partially completed answer must survive a closed laptop, and LiveView holds that server-side without a separate client state layer.
- **PostgreSQL** as the store, chosen because consent scoping is the hardest requirement here and row-level access rules belong in the database rather than in application checks that can be forgotten.
- **Oban** for background work: routing requests, reminder scheduling against each athlete's own exit date, and document rendering, all of which need durable retries.
- **S3-compatible object storage** for generated resumes and narrative drafts, kept outside the database so versions are cheap to retain.
- **Fly.io** for hosting, because the audience is geographically spread and the app is a small always-on service rather than a batch workload.

## Architecture

The athlete is the only writer of their own record. Intake captures sport, level, years, role and responsibilities as structured rows plus free text, with injury and departure-reason fields marked at the schema level as restricted so they cannot be selected into any query that feeds matching. Consent is a first-class table: every share is an explicit grant from an athlete to a named audience, and reads go through it rather than around it.

Translation runs as a worksheet pipeline. Each claim the athlete asserts must carry at least one evidence row drawn from their record, which is what keeps the output honest and also what makes it useful to an employer. The rendered documents are artefacts of that graph rather than free text, so improving a claim improves every document that cites it.

Routing is deliberately asymmetric. Former athletes register availability with a request budget; an athlete browses a filtered directory and sends a bounded, specific ask rather than a message. Oban enforces the budget and the cooldowns, so the volunteer side cannot be flooded by a single busy week. The plan module is the only place a date exists: the athlete enters their own exit date, and every reminder is computed backward from it, which is why no default season calendar is hardcoded anywhere.

## Milestones

1. **M1 — Record and consent** — intake schema, restricted-field enforcement, and the consent table with tests proving a restricted field cannot leak into a match query.
2. **M2 — Translation** — claim-and-evidence worksheets and the first rendered resume and narrative from the graph.
3. **M3 — Plan** — athlete-entered exit date, backward-computed steps, reminders through Oban.
4. **M4 — Routing** — mentor registration with request budgets, filtered directory, bounded ask flow.
5. **M5 — Employer read view** — a shareable, consent-scoped view of translated evidence, and a first round of feedback from people who hire.
6. **M6 — Population fit** — instrument which exit type users actually arrive with, and specialise the clock only once the data says which one dominates.

## Risks

- **Empty mentor directory** — routing is the differentiator and it fails silently if too few former athletes register per sport; the request-budget design protects retention but cannot create supply.
- **Restricted-field leakage** — an injury or departure reason surfacing in a match result or a shared view is the worst failure this system can have, which is why enforcement sits in the schema and not in a code path.
- **Wrong clock** — building around an eligibility calendar when most users arrive post-injury would make the plan module useless for the majority.
- **Translation that convinces nobody** — if employers do not find the evidence readable, the worksheet is elaborate self-help.
- **Scope creep into counselling** — the emotional need is real and adjacent, and drifting into it turns a career tool into something with a duty of care it is not built for.
- **Volunteer burnout** — the supply side is unpaid, and one popular sport receiving disproportionate requests will exhaust its mentors first.
