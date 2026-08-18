---
id: "211"
slug: for-5-years-goods-have-been-stolen-from-the-office-ther
title: "For 5 years, goods have been stolen from the office. There is no available service that automatically distinguishes visitors from staff and alerts on suspicious patterns."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: security
date: "2026-03-25"
tags: [Security, IoT, Office]
country: India
tech: [Python, YOLOv8, OpenCV, RTSP, FastAPI, PostgreSQL]
---
# For 5 years, goods have been stolen from the office. There is no available service that automatically distinguishes visitors from staff and alerts on suspicious patterns.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/211-for-5-years-goods-have-been-stolen-from-/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, YOLOv8, OpenCV, and confirm versions resolve in CI.
- [ ] Author the schema migrations named in PLAN.md and seed at least one realistic fixture for the {country} locale.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: India`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for India.
## Phase 1: Core

- [ ] RTSP ingest from 1-4 cameras
- [ ] Person detection with YOLOv8
- [ ] Track persistence across frames
- [ ] Staff enrolment with 5 photos per person
- [ ] Re-ID model for staff vs visitor classification
- [ ] Rule engine for sensitive-area alert
- [ ] Rule engine for bag-carriage anomaly
- [ ] Web dashboard with live alerts
- [ ] 7-day search of past alerts
- [ ] End-to-end test in 3 real offices
- [ ] First 10 pilot offices in 3 cities

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, YOLOv8, OpenCV) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 211-for-5-years-goods-have-been-stolen- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, YOLOv8, OpenCV errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
