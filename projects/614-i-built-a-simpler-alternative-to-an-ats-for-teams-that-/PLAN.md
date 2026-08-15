---
id: "614"
slug: i-built-a-simpler-alternative-to-an-ats-for-teams-that-
title: I built a simpler alternative to an ATS for teams that receive CVs by email
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vp0wp4/i_built_a_simpler_alternative_to_an_ats_for_teams/"
  captured: "2026-08-15"
category: saas
date: "2026-08-15"
tags: [saas, recruitment, cv-parsing, b2b, freemium]
scores:
  money: 6
  learn: 5
  fun: 5
tech: [Python, FastAPI, PostgreSQL, OpenAI API (CV extraction), IMAP/Graph email ingestion, Next.js]
---
# I built a simpler alternative to an ATS for teams that receive CVs by email

## Tech Stack

- **Backend:** Python + FastAPI — async-friendly for the email polling and CV extraction pipelines, plus a small JSON API for the front-end.
- **Database:** PostgreSQL — structured candidate records (experience, skills, technologies, languages, role context) and full-text search on extracted text.
- **CV extraction:** OpenAI API (or equivalent LLM) to turn PDF/DOCX CVs into the structured candidate fields. The model is a swappable component.
- **Email ingestion:** IMAP for generic mailboxes, Microsoft Graph for Microsoft 365 mailboxes. The team provides credentials; RecrutFlo polls for new mail with CV attachments.
- **Front-end:** Next.js (App Router) for the searchable candidate library, search filters, and the per-candidate detail view with editable extracted fields.
- **Hosting:** Containerised on Coolify for the MVP, with the same Docker image deployable to other hosts.

## Architecture

Three components that map to the product flow:

1. **Mailbox connector** — IMAP or Microsoft Graph poller, scoped to the team's recruitment mailbox. Detects new mail with CV attachments, downloads the attachment, and hands it off.
2. **CV extraction pipeline** — PDF/DOCX → text → LLM extraction → structured candidate record (experience, skills, technologies, languages, role context). Recruiter can correct any field; corrections feed back as examples.
3. **Searchable candidate library** — web UI over the structured records. Filters by skill, technology, language, role context, date received. Each candidate has a detail view that shows the original CV next to the extracted fields.

The pipeline is one-way by design: AI organises, the recruiter decides. No ranking, no scoring, no auto-reject.

## Milestones

- **M1 — Working MVP on the founder's own mailbox.** Connect to one IMAP mailbox, parse a handful of real CVs by hand, confirm the extracted fields match what a recruiter would have typed.
- **M2 — Searchable library.** Build the candidate list, filters, and per-candidate detail view with editable fields. End-to-end test on a real recruitment mailbox.
- **M3 — Free plan, public sign-up.** Land the free plan with no time limit and no payment details. Onboard the first 5–10 teams from the founder's network.
- **M4 — Validation.** Run the feedback the poster is asking for: "is recruitment inbox → searchable CV library a clear and useful proposition?" Decide whether the proposition holds and what plan limits (if any) drive an upgrade.
- **M5 — Paid tier (only if the free plan earns it).** Define a paid tier around the limit that actually chafes in M3 — volume of CVs, seats, or retention window — and ship it. No upgrade prompt until the team has proven the value to themselves.

## Risks

- **CV parsing quality.** Uneven across languages and CV layouts; if recruiters have to rewrite every record, the product is more work than the spreadsheet. Mitigation: editable fields with the original CV alongside, and corrections captured for prompt tuning.
- **Mailbox credential trust.** Asking a team to hand over IMAP or Microsoft Graph access to their recruitment mailbox is a sensitive ask for a small, new product. Mitigation: clear scope (read-only on the recruitment mailbox), no write-back, transparent documentation.
- **Freemium without a timer.** A free plan with no time limit means conversion has to come from clear value inside the plan limits, not from a trial expiring. Risk that teams never upgrade if the limits are too generous.
- **Positioning drift.** The poster is explicit that this is "deliberately not a full ATS". Any feature creep toward pipelines, rankings or auto-decisions would break the proposition. Mitigation: a written scope guard reviewed before any feature that touches candidate selection.
- **Distribution.** The poster is asking the public for feedback, which suggests distribution is the bottleneck, not engineering. Risk that without a clear channel into small companies and recruitment agencies, the product does not get enough real mailboxes to validate CV parsing quality at scale.
- **Compliance.** CVs contain personal data. GDPR / equivalent privacy rules apply; the founder has not said what region they are in, so scope is open.