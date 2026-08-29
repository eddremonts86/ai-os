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

## Problem

Atish Paul runs a small business in India with security cameras installed in the office where they serve customers and sell products. They cannot sit and watch the footage continuously, and over 5 years goods have been periodically stolen — someone comes in, takes items, and the loss is only discovered afterwards. They explicitly say they do not want a "record and store" system; they want a service that analyses the camera feed in real time and sends an alert when something suspicious happens, so they can respond immediately instead of just documenting the loss after the fact. They have tried hiring a security guard (too expensive) and looked for ready-made solutions in India but found everything "either too expensive for a small business or not adapted to [their] needs." They are open to either subscription or pay-per-incident pricing as long as the service is affordable and actually prevents theft rather than just recording it. The author also indicates they are ready to provide feedback and want 1% equity in the startup that builds the solution.

## Objective

Ship a camera-feed monitoring service for small Indian businesses that turns the existing CCTV install into a real-time alert channel — flagging suspicious activity (after-hours loitering, repeated short re-entries, unattended-bag events, customer lingering near stock) and pushing an alert to the owner's phone within seconds, at a price point a single-shop owner in India can absorb monthly.

## Target Users

- Primary: small Indian retail / office shop owners who already own an NVR or DVR plus 2–8 IP cameras and cannot afford a 24×7 guard; they need alerts, not recordings.
- Secondary: small warehouse / godown operators with a similar pain who own analog or IP cameras and have no monitoring today.
- Tertiary: small chain owners (3–10 outlets) who need a single dashboard across stores and would value cross-store anomaly patterns.

## MVP Scope

- Ingest from the cameras the user already owns: ONVIF / RTSP streams, with the user's existing NVR or DVR kept as the recording store so the service does not have to replace the storage layer.
- Real-time motion + person detection on each stream using an off-the-shelf detector (YOLOv8 / RT-DETR) and a tracker (ByteTrack) so a single person is one identity across frames, not eight.
- A small rule engine with v1 templates the shop owner can enable with one tap: "after-hours entry", "person near high-value shelf > 30s", "loitering", "unattended bag for > 2 minutes", "staff entering stockroom alone after 9pm".
- Alert delivery via WhatsApp Business API (the channel Indian SMBs actually answer) plus SMS fallback for low-connectivity areas; alert includes a 10-second clip and a snapshot.
- Single-shop dashboard: live grid of cameras, alert feed, false-positive feedback button ("this wasn't suspicious") that the rule engine learns from per-shop.
- Self-hosted or cloud-hosted deployment; the cloud path is a single Docker compose on a Coolify / Hetzner-style instance plus a managed alert-routing service, not a managed recording service.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Pricing must work for an Indian SMB: target ≤ ₹1,500/month per camera for the cloud path, or a one-time ₹15,000 self-host licence for shops that prefer on-prem; the service cannot price itself out of the shop's reach.
- Must work with the cameras and NVR the shop already owns (Hikvision, Dahua, CP Plus, generic ONVIF); no "replace your hardware" requirement.
- Alert delivery has to keep working on 2G / intermittent 4G — WhatsApp and SMS are the primary channels, and the alert payload is small enough to send even on a flaky uplink.
- Local data sovereignty: video frames leave the shop only when an alert is raised; bulk footage stays on the shop's own NVR.
- The 1% equity ask from the source author is documented and respected; it is not a generic placeholder, and the equity conversation belongs to a human, not the product spec.
