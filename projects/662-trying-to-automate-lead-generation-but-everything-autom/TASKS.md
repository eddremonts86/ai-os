---
id: "662"
slug: trying-to-automate-lead-generation-but-everything-autom
title: trying to automate lead generation but everything automated feels spammy?i will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp4cvt/trying_to_automate_lead_generation_but_everything/"
category: startups
date: "2026-08-15"
tags: [outbound, deliverability, cold-email, b2b]
tech: [Next.js 14, Postgres + Drizzle, Prospeo API, Resend, Cloudflare DNS]
---
# trying to automate lead generation but everything automated feels spammy?i will not promote

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/662-trying-to-automate-lead-generation-but-everything-autom/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Build the three-panel workspace in Next.js: import, per-contact brief, composer — with the no-auto-send design enforced at the UI level
- [ ] Wire the Prospeo integration for verified contact import, with a "do not email again" check at ingest that prevents the same person being emailed twice across lists
- [ ] Stand up the deliverability dashboard for the sending domain: reputation score, SPF/DKIM/DMARC status, send volume, bounce rate, and a 5% bounce tripwire that halts sending
- [ ] Implement the 7-day warm-up plan: 10 emails per day to known contacts, with reputation snapshots at the end of each day and a 1-10 domain-trust score
- [ ] Add the Resend webhook ingestion for replies, with a classifier that buckets responses into "interested / not now / not interested / out of office" and surfaces the "interested" bucket to the sender's inbox
- [ ] Ship the daily "do not email again" enforcement: a Postgres table that all future imports consult before a contact is added to the queue
- [ ] Document the founder's pre-product reply rate (2% automated / 8-10% manual) and produce a public case study template for the post-product reply rate after 30 days

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy to Coolify
- [ ] Verify in production
