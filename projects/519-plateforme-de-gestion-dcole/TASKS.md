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

## Phase 0: Scaffold

- [x] Capture problem from Reddit + write SPEC.md skeleton
- [ ] Define DESIGN.md (French typography, mobile-first parent portal)
- [ ] Provision Django + Postgres on Scaleway (Paris region)
- [ ] Brevo account + sender domain
- [ ] RGPD consent copy reviewed by a French lawyer

## Phase 1: Core

- [ ] Enrollment: student, parent, class, teacher CRUD
- [ ] Attendance: teacher mobile-friendly entry; absence triggers parent alert
- [ ] Grade book: per-class, per-trimestre, with French grading scales (0-20, mentions)
- [ ] Parent portal: read-only attendance + grade + announcements
- [ ] Announcement board (staff → all parents, per class)
- [ ] Data export (CSV per table) + per-parent data deletion endpoint
- [ ] End-to-end test: enroll 200 students → 4 weeks of attendance + grades → parent sees correct portal

## Phase 2: Deploy

- [ ] Pilot in 1 French K-12 school (200 students)
- [ ] Coolify-side deployment of Django app
- [ ] RGPD annual audit scheduled
- [ ] Post-mortem after week 18 with pilot school

---

_Lúa generó este análisis automáticamente el 2026-08-14_
