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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (landing hero, dossier page chrome, editorial back-office table)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire editor login (email-link via Resend, role-gated to the `editor` table)
- [ ] Decide Drizzle schema: `problems`, `interviews`, `dossiers`, `subscribers`, `subscriptions`, `publish_log`

## Phase 1: Core

- [ ] Landing page: explain "Validated Problems", capture email signup, link to Telegram community
- [ ] Editorial back-office: problem CRUD, state-machine transitions (`intake → research → interview → draft → publish`)
- [ ] Interview capture form: verbatim quote, demographic fields, eliciting question, willingness-to-pay answer, what-they-pay-today answer; PII redaction enforced on save
- [ ] 20-interview gate: hard publish button disabled until `count(interviews) ≥ 20`; SQL constraint as a backstop
- [ ] Dossier editor with the 7 required sections (headline, target user, interviews, workarounds, willingness-to-pay, competitive landscape, gap)
- [ ] Public per-problem page: markdown render with the free / paid split (`headline + target user + gap` public; rest gated)
- [ ] RSS feed + Substack-mirrored export of every published problem
- [ ] Weekly digest auto-generated from the latest published problem, sent via Resend and mirrored to Telegram
- [ ] Stripe Checkout for €19/month and €149/year; webhook gates the full dossier behind `Workspace.subscriptionStatus`
- [ ] Team tier at €99/month (up to 10 seats) with raw interview notes access
- [ ] End-to-end test: draft a problem, capture 20 interviews, publish, verify free / paid split, verify weekly digest lands in the inbox

## Phase 2: Deploy

- [ ] Publish the first 4 validated problems over 4 weeks
- [ ] Track editor time per problem; tune the back-office to keep it ≤ 5 hours
- [ ] A/B test the paywall split (which sections are free, which are paid) on conversion data
- [ ] Open the "intake → research → interview → draft → publish" status board publicly so subscribers see what's in flight
