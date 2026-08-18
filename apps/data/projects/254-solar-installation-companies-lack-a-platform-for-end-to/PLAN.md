---
id: "254"
slug: solar-installation-companies-lack-a-platform-for-end-to
title: "Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/ldt9cicmy1-solar-installation-companies-lack-a-plat"
category: business
date: "2026-01-10"
tags: [Business, Marketing, Other]
country: Brazil
---
# Solar installation companies lack a platform for end-to-end tracking of a customer's project — from sale to official approval, causing complaints and dissatisfaction

## Tech Stack

- Ruby on Rails 7 for the application; chosen because the data model (projects, milestones, events, attachments, customers) is the bread-and-butter of Rails, and the installer-side CRUD flow benefits from Rails' scaffold speed.
- PostgreSQL for projects, milestone templates, milestone events, attachments, and customer email addresses.
- ActionMailer (or Resend via SMTP) for the weekly digest emails to the customer.
- ActiveStorage (S3-compatible MinIO) for permit receipts, photos, and inspection attachments.
- Hotwire (Turbo + Stimulus) for the installer's milestone-entry console so the form stays fast on a field engineer's phone on a 4G connection at the install site.
- Self-hosted on Coolify; the workload is per-project, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Installer console** — the installer creates a project, picks a milestone template (residential rooftop, commercial rooftop, ground-mount), and records milestone events as the project progresses. Each event takes under a minute.
2. **Customer status page** — a public, login-free URL per project that shows the timeline in plain Portuguese: milestone, date, status note, attachment if present. Overdue milestones are flagged.
3. **Weekly digest job** — a Monday-morning job that emails each active customer a summary of what changed in their project this week, what is blocked, and what the next milestone is expected to be.

The MVP is a status surface. It does not file permits, talk to distributors, or integrate with the installer's existing CRM in v1; it sits alongside them.

## Milestones

- **M1 — Project + milestone data model.** Templates per project type; an installer can create a project and record a milestone event.
- **M2 — Customer status page.** Public, login-free URL per project; timeline view with overdue flags; attachment links.
- **M3 — Weekly digest.** Monday-morning job that summarises the week's events for each active customer.
- **M4 — Stale-project alert.** Email to the installer's project manager when a project has had no event recorded in 14 days.
- **M5 — Installer onboarding.** Onboard three to five Brazilian installers with seeded projects; vet milestone labels with a Brazilian installer.

## Risks

- Installer-side friction is the binding constraint. A milestone-entry flow longer than one minute will not be used; the page will go stale and the customer experience will be worse than having no page. The MVP must measure time-to-record and stay under that ceiling.
- Stale timelines are worse than no timeline. The MVP must include a stale-project alert to the installer's project manager, not just a quietly stale customer page.
- Distributor integration is tempting but out of scope. The MVP cannot scrape distributor portals or guess at permit status; it relies on the installer's recording. This must be clear in the installer's onboarding docs.
- Localisation: terminology (homologação, art, vistoria) is specific to the Brazilian solar industry. The MVP needs a Brazilian installer to vet the milestone labels before launch.
- Single installer per project is the assumption. Co-installers, sub-contractors, and field-engineer handoffs are out of scope; the MVP records one installer's view of the timeline.
