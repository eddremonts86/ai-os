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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/753-for-5-years-goods-have-been-stolen-from-the-office-ther/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] ONVIF / RTSP discovery against a known-good Hikvision, Dahua, CP Plus, and TVT camera; document what works and what doesn't in a compatibility matrix
- [ ] Ingest worker subscribes to an RTSP stream, runs YOLOv8 person detection, ByteTrack identity tracking; ≥ 10 FPS sustained on a Hetzner CX31 with two concurrent streams
- [ ] Rule engine accepts `(event, zone, time-of-day, dwell-time, identity-prior)` and produces a verdict; five templates ship in v1: after-hours entry, loitering, near-shelf dwell > 30s, unattended bag > 2 min, lone staff in stockroom after 9pm
- [ ] One-tap template enable in the dashboard per shop; rule thresholds editable but default to sensible values
- [ ] WhatsApp Business API integration; template approval flow documented for India SMB use cases; SMS fallback configured for low-connectivity hours
- [ ] Alert payload includes a 10-second clip and a snapshot; clip storage on the local VPS for cloud tenants, on the shop's NUC for self-host
- [ ] Per-shop false-positive feedback: one-tap "not suspicious" button on each alert retunes the per-shop rule thresholds
- [ ] Dashboard: live camera grid, alert feed, false-positive feedback, all server-rendered with HTMX (no SPA in v1)
- [ ] End-to-end test: live Hikvision camera in the office, after-hours motion triggers an alert within 10s, WhatsApp message arrives on the owner's phone with the clip

## Phase 2: Deploy

- [ ] Provision Coolify on a Hetzner CX31 for the production cloud path
- [ ] Onboard 10 Indian SMB shops across two cities, at least one per major camera brand in the compatibility matrix
- [ ] Set up status page + WhatsApp template-approval status page
- [ ] Self-host runbook reviewed by the source author (Atish Paul) before general release
- [ ] Post-mortem after week 14 with the pilot cohort
