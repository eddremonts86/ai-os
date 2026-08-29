---
id: "753"
slug: for-5-years-goods-have-been-stolen-from-the-office-ther
title: "For 5 years, goods have been stolen from the office. There is no available service that automatically analyzes camera footage and sends alerts about suspicious activity."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/security/rgj4xt7ep1-for-5-years-goods-have-been-stolen-from"
  captured: "2026-03-25"
category: security
date: "2026-03-25"
tags: [Security, Business, Other]
country: India
wtp:
  raw: open to subscription or pay-per-incident
  currency: USD
  period: month
tech: [Python, RTSP / ONVIF camera ingest, YOLOv8 / RT-DETR detection, ByteTrack multi-object tracking, zone-based rule engine, FastAPI, PostgreSQL, alert delivery via WhatsApp Business API + SMS, on-prem NVR-friendly Docker]
---
# For 5 years, goods have been stolen from the office. There is no available service that automatically analyzes camera footage and sends alerts about suspicious activity.

## Tech Stack

- **Ingest:** RTSP / ONVIF clients in Python (onvif-zeep for discovery, ffmpeg for stream pull); runs as a worker per camera, decoupled from the API.
- **Detection:** YOLOv8 or RT-DETR for person detection; ByteTrack for multi-object tracking so a person across frames is one identity.
- **Rule engine:** Python service with a small DSL — `(event, zone, time-of-day, dwell-time, identity-prior) -> verdict` — and one-tap templates for the v1 ruleset.
- **API + dashboard:** FastAPI backend, server-rendered dashboard with HTMX for live alert feed (no SPA needed at this size).
- **Storage:** PostgreSQL for shops, cameras, rules, alert history, false-positive labels; bulk video stays on the shop's NVR.
- **Alert delivery:** WhatsApp Business API as primary; SMS gateway as fallback for low-connectivity hours.
- **Deployment:** Docker compose on a single Coolify / Hetzner VPS for cloud tenants; a separate "self-host" compose for the on-prem licence.

## Architecture

```
Cameras (ONVIF/RTSP) ─▶ Ingest workers ─▶ Detection + Tracker
                                                  │
                                                  ▼
                                       Rule engine (per-shop)
                                                  │
                              ┌───────────────────┴─────────────────────┐
                              ▼                                         ▼
                       PostgreSQL (alerts,                      WhatsApp Business API
                       false-positive labels)                   + SMS gateway
                              │
                              ▼
                       FastAPI dashboard (HTMX)
```

The detection pipeline runs at the edge of the shop (the same VPS for cloud tenants, the shop's own NUC for self-host tenants); only the rule-engine verdict and a short clip move over the wire to the alert-delivery layer. The dashboard reads from PostgreSQL and never touches the live video stream, so the API stays cheap even when ten shops are live at once.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + ONVIF compatibility matrix approved. End of week 1.
2. **M1 — Ingest + detection.** RTSP / ONVIF ingest running, YOLOv8 + ByteTrack producing per-camera identity tracks at ≥ 10 FPS on a Hetzner CX31. End of week 4.
3. **M2 — Rule engine + v1 templates.** Rule DSL implemented; five templates (after-hours, loitering, near-shelf dwell, unattended bag, lone-staff-stockroom) enable-able per shop. End of week 6.
4. **M3 — Alert delivery.** WhatsApp Business API primary, SMS fallback; alert includes 10-second clip + snapshot. End of week 8.
5. **M4 — Dashboard + false-positive loop.** HTMX dashboard with live grid and alert feed; one-tap "not suspicious" feedback that retrains the per-shop thresholds. End of week 10.
6. **M5 — Pilot.** 10 Indian SMB shops onboarded across two cities, weekly review with each owner for the first month. End of week 14.

## Risks

- **Camera compatibility surprises.** A "works with ONVIF" claim can hide profile-S mismatches and codec issues. The pilot must include at least one shop each on Hikvision, Dahua, and CP Plus so the v1 matrix is grounded in reality, not in datasheets.
- **Alert fatigue.** One noisy shop owner mutes the channel and the entire product becomes useless for that shop. The false-positive-learning loop is not a polish item; it is the load-bearing retention mechanic, and the per-shop threshold must adapt on the first day, not after a month of complaints.
- **WhatsApp Business API rate limits.** India SMB volumes are bursty (opening hour, closing hour). The alert-delivery layer must back off, batch, and fall back to SMS without dropping alerts during a rate-limit window.
- **Self-host operational burden.** A small shop owner cannot debug a Docker compose that won't start after a power cut. The on-prem licence ships with a watchdog that auto-recovers and a one-page runbook for the owner's nephew, not a Sysadmin's checklist.
