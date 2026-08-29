---
id: "746"
slug: coming-soon-validated-problems-for-startups-with-a-high
title: "Coming soon: validated problems for startups with a high chance of success. Our mission: 0% failed startups."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/validated/yfo00hoie1-coming-soon-validated-problems-for-start"
category: validated
date: "2026-04-23"
tags: [Validated]
---
# Coming soon: validated problems for startups with a high chance of success

## Tech Stack

- **Public site + back-office:** TanStack Start (React + TypeScript) on a single Node process, SQLite via Drizzle ORM, hosted on a single Coolify instance behind Docker.
- **Editorial workflow:** a per-problem state machine stored in SQLite (`intake → research → interview → draft → publish`) with role-gated transitions; the "publish" button is hard-disabled until interview count ≥ 20.
- **Interview capture:** a structured form (verbatim quote, demographic fields, eliciting question, willingness-to-pay answer, what-they-pay-today answer) with PII redaction enforced on save.
- **Publishing surface:** markdown-rendered problem pages (one URL per problem) with JSON-LD; an RSS feed and a Substack-mirrored export.
- **Email + Telegram:** existing ProblemHunt newsletter (Resend) and Telegram channel for distribution; weekly digest auto-generated from the latest published problem.
- **Billing:** Stripe Checkout for the paid dossier tier; webhook gates the per-problem dossier behind the `Workspace.subscriptionStatus`.

## Architecture

A single TanStack Start app serves the marketing landing page, the public per-problem pages, and the editorial back-office (route group `(authed)` with editor-only access). The problem pipeline is a state machine on a `problems` row; the "publish" guard is a SQL constraint plus a UI check so the threshold cannot be bypassed. Each interview is a row in `interviews` keyed to a problem; the per-problem dossier is built by aggregating interviews + the editor's free-text sections into one markdown render. The free / paid split is enforced at the route level: `headline + target user + gap` are public; `interviews + workarounds + willingness-to-pay + competitive landscape` require an active subscription.

```
Browser ─▶ TanStack Start
              │
              ├─▶ /p/:slug            ──▶ public dossier (free sections)
              │       │
              │       └─▶ /p/:slug/full ──▶ paywall (Stripe-gated)
              │
              ├─▶ (authed) /admin     ──▶ editorial back-office
              │       │
              │       ├─▶ /admin/problems/:id/intake
              │       ├─▶ /admin/problems/:id/research
              │       ├─▶ /admin/problems/:id/interviews
              │       │       └─▶ guard: count(interviews) ≥ 20 before publish
              │       ├─▶ /admin/problems/:id/draft
              │       └─▶ /admin/problems/:id/publish
              │
              ├─▶ Stripe webhook      ──▶ Workspace.subscriptionStatus
              │
              └─▶ Resend (digest) + Telegram mirror ──▶ weekly distribution
```

## Milestones

1. **M0 — Editorial schema + spec freeze.** Drizzle schema (`problems`, `interviews`, `dossiers`, `subscribers`, `subscriptions`); spec for the 7 required sections approved. End of week 1.
2. **M1 — Back-office skeleton.** Login for editors, problem CRUD, state-machine transitions. End of week 3.
3. **M2 — Interview capture + 20-interview gate.** Structured interview form, count badge, hard publish gate at 20. End of week 4.
4. **M3 — Public dossier page.** Markdown render of the 7 sections; paywall split between free and paid tiers. End of week 5.
5. **M4 — Newsletter + Telegram digest.** Weekly auto-digest from the latest published problem; RSS feed; Substack export. End of week 6.
6. **M5 — Stripe + paid tier.** €19/month and €149/year prices; full-dossier gate; team tier at €99/month. End of week 7.
7. **M6 — Pilot publication.** Publish 4 validated problems over 4 weeks; refine the editorial template based on editor time tracking. End of week 11.

## Risks

- **20-interview gate is the editorial choke point.** If recruiting interviewees takes more than ~5 hours per problem, the weekly cadence breaks. Mitigation: a standing pool of opt-in interviewees (newsletter subscribers) and per-topic outreach templates in the back-office.
- **Free-tier cannibalisation.** If the free sections (headline + target user + gap) are too generous, nobody pays. If they are too thin, the newsletter does not grow. Mitigation: A/B test the paywall split during the pilot and tune on conversion data.
- **Anonymity leaks.** Verbatim quotes with demographic context are useful but can re-identify. Mitigation: a redaction checklist the editor must tick before publish; default strip of city, employer, and date.
- **Channel concentration.** Telegram + newsletter is the only distribution; if Telegram changes its rules or the newsletter deliverability drops, reach collapses. Mitigation: RSS feed + Substack mirror in v1.x; diversify from week 1.
- **Willingness-to-pay drift.** Quotes read as "I would pay €100" but rarely convert when a product lands. Mitigation: capture "what they actually pay today" alongside stated intent so the dossier reflects evidence.
- **Two-editor ceiling.** With a 2-editor team the per-week capacity is one problem at most; any feature work eats into editorial hours. Mitigation: feature work scheduled in dedicated 2-week blocks between publication cohorts.
