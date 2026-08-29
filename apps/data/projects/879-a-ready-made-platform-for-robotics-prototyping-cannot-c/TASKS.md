---
id: "879"
slug: a-ready-made-platform-for-robotics-prototyping-cannot-c
title: A ready-made platform for robotics prototyping cannot create an active user community
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/4jgemm3td1-a-ready-made-platform-for-robotics-proto"
  captured: "2025-10-26"
category: marketing
date: "2025-10-26"
tags: [Marketing, Other]
country: Israel
wtp:
  raw: software licences for joint projects / partnership equity offers
  currency: USD
  period: month
tech: ["Existing platform: Love Code hardware-software stack; new layer: Next.js + Node.js", PostgreSQL, Discord + Discourse for community surface, OAuth-based SSO into the platform, Hotjar + PostHog for funnel analytics]
---
# A ready-made platform for robotics prototyping cannot create an active user community

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Postgres + Prisma on a Coolify-managed Docker instance
- [ ] Bootstrap Next.js 14 (App Router) project with TypeScript
- [ ] Wire Resend transactional email for license-key delivery and the weekly digest
- [ ] Decide the "publish to gallery" webhook contract with the Love Code demo/professional apps (or fall back to manual import)

## Phase 1: Core

- [ ] Prisma schema: accounts, profiles, projects, partners, license keys, activity events
- [ ] Email-link signup + profile page (display name, bio, hardware configurations, public project list)
- [ ] Project publish form (title, description, hardware list, optional photo / link to YouTube clip)
- [ ] Gallery index: paginated list of public projects, filterable by hardware / tag
- [ ] YouTube RSS + docs markdown seed pipeline: cron-driven daily import, ≥ 20 gallery entries on day one
- [ ] Partner application form: organisation, type (educational / vendor), proposed integration description
- [ ] Admin queue: review pending partner applications, approve / reject, generate license key on approval
- [ ] Public partner page template: organisation, integration description, partner logo / link, list of issued license keys (key code only, not the licensee)
- [ ] Activity event log: every publish, every partner approval writes an event row
- [ ] Weekly digest email: assembled from the previous 7 days of activity, opt-in toggle in profile
- [ ] End-to-end test: signup, publish one project, approve one partner, send one digest, observe the activity feed picks each up

## Phase 2: Deploy

- [ ] Onboard two partner integrations live (one educational platform, one component vendor)
- [ ] Move Resend to a production sender domain
- [ ] Set up backup cadence for the Postgres volume (Coolify + object storage)
- [ ] Review week-10 pilot signals and decide v1.5 scope (remote online lab: in or out)
