---
id: "211"
slug: for-5-years-goods-have-been-stolen-from-the-office-ther
title: "For 5 years, goods have been stolen from the office. There is no available service that automatically distinguishes visitors from staff and alerts on suspicious patterns."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: security
date: "2026-03-25"
tags: [Security, IoT, Office]
country: India
tech: [Python, YOLOv8, OpenCV, RTSP, FastAPI, PostgreSQL]
---
# For 5 years, goods have been stolen from the office. There is no available service that automatically distinguishes visitors from staff and alerts on suspicious patterns.

## Problem

An Indian office has been losing goods (laptops, peripherals, small inventory) for years. Staff and visitor traffic are not differentiated, CCTV footage is reviewed only after the fact, and there is no service that classifies in real time who is in the building and flags a pattern (e.g. a visitor alone in a storage room after hours). Enterprise access-control systems exist but are expensive and treat staff and visitor as binary. Cheap AI cameras can detect people but do not distinguish staff from visitor without an enrolment step. The office needs a service that runs on existing CCTV, enrols staff once, and raises an alert when a visitor lingers in a sensitive area or when an authorised person exits with a bag they did not enter with.

## Objective

A self-hosted service that runs on existing office CCTV, learns staff appearance with a one-time enrolment, and emits real-time alerts on visitor-only presence in sensitive areas and on bag-carriage anomalies at exits.

## Target Users

Small and mid-size offices in India and South-East Asia (10-100 people) with existing CCTV but no enterprise access control. Also warehouse lobbies, clinics, and small co-working spaces with the same problem.

## MVP Scope

RTSP ingest from 1-4 cameras. One-time staff enrolment (5 photos per person). Real-time visitor-vs-staff classification. Rule engine: alert on visitor-only presence in sensitive areas, alert on bag-carriage anomaly at exit. Web dashboard with live alerts and a 7-day search. No cloud upload in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `211-.../SPEC.md` and the chosen stack (Python, YOLOv8, OpenCV). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in India.

For India, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

All processing must happen on a local NVR-class box for privacy. No uploads to cloud providers. Staff enrolment must be auditable (who enrolled whom, when). Alert latency under 5 seconds. Must not require any action from staff to function (no badges).
