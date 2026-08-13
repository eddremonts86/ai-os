---
id: "010"
slug: the-owner-of-a-tech-agency-hasnt-found-a-suitable-tool-
title: "The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/24mf80ltt1-the-owner-of-a-tech-agency-hasnt-found-a"
  captured: "2026-07-17"
category: business
date: "2026-07-17"
tags: [Business, Dev, Productivity, No-Code, Other]
country: Colombia
wtp:
  raw: "$100/month"
  currency: USD
  min: 100
  max: 100
  period: month
  mrrMid: 100
---

# The owner of a tech agency hasn't found a suitable tool for projects, domains, monitoring, and proposals. Willing to pay $100/month.

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md (single-pane dashboard, agency-branded)
- [ ] Provision Next.js + Postgres + Resend + Puppeteer serverless
- [ ] Recruit 1 pilot agency for design partner work
- [ ] Porkbun sandbox API key

## Phase 1: Core

- [ ] Agency onboarding: branding (logo, colours, agency name), team seats
- [ ] Client list: manual entry + bulk CSV import
- [ ] Domain integration: Porkbun (read-only), expiry warnings, renewal reminders via Resend
- [ ] Project integration: Linear + Asana (read-only), per-client project status
- [ ] Monitoring integration: UptimeRobot + BetterStack (read-only), per-client monitor status
- [ ] Dashboard: per-client attention-needed view (expiring domain, slipping project, failing monitor)
- [ ] Proposal template editor: scope / pricing / timeline / terms blocks, per-agency branding
- [ ] Proposal PDF: Puppeteer render, Resend send, open + click tracking
- [ ] End-to-end test: 5 clients, 3 proposals sent, 1 renewal reminder delivered

## Phase 2: Deploy

- [ ] Production deployment on Vercel + Neon
- [ ] Add Namecheap + GoDaddy registrar integrations
- [ ] Stripe billing with the $100 / $200 / custom tiers
- [ ] Recruit 30 LATAM pilot agencies across the two lower tiers
- [ ] Status page for the platform itself (eat your own dog food)
- [ ] Post-mortem at week 22 with the 30-agency cohort