---
id: "519"
slug: plateforme-de-gestion-dcole
title: Plateforme de gestion d’école
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo3utd/plateforme_de_gestion_décole/"
category: saas
date: "2026-08-14"
---
# Plateforme de gestion d’école

## Tech Stack

- **Backend:** Django + PostgreSQL, hosted on a French VPS (Scaleway) for RGPD data residency.
- **Frontend (staff):** Django templates + HTMX for server-rendered interactivity; no SPA.
- **Frontend (parent portal):** Django templates, mobile-first responsive, French-language copy.
- **Email + SMS:** Brevo (Sendinblue) for transactional + parent alerts.
- **File storage:** Scaleway Object Storage (S3-compatible, in-region).

## Architecture

A single Django app handles staff and parent flows. Attendance and grade entry go straight to Postgres. Parent alerts fire via Brevo on absence events. Daily attendance + grade snapshots are pre-rendered for the parent portal so page load is fast on low-end phones.

```
Browser ─▶ Django (staff UI + parent portal)
              │
              ├─▶ PostgreSQL (student, attendance, grade tables)
              │
              └─▶ Brevo (transactional email + SMS on absence)
```

## Milestones

1. **M0 — Schema + enrollment flow.** Student/parent/class/teacher tables. End of week 3.
2. **M1 — Attendance + grade book.** Teacher-facing entry, parent-facing read-only. End of week 6.
3. **M2 — Parent portal + absence alerts.** End of week 8.
4. **M3 — Pilot in 1 school (200 students).** End of week 12.
5. **M4 — RGPD audit + 3-school rollout.** End of week 18.

## Risks

- **RGPD scope creep.** French schools have nuanced consent rules (especially for minors); a wrong call here is a fine. Mitigation: legal review of consent flows before pilot; explicit data-export and deletion paths.
- **Parent UX floor.** Many parents are not power users; a portal they cannot navigate defeats the purpose. Mitigation: usability test with 5 parents in week 7.
- **Teacher adoption.** Teachers have workflows they are used to; switching costs are real. Mitigation: a "shadow mode" that runs alongside the old system for 4 weeks before cutover.
