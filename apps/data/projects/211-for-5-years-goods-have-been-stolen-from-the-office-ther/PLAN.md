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

## Tech Stack

Python + FastAPI for the orchestration. YOLOv8 for person detection. OpenCV for the tracking. A small re-ID model for staff/visitor classification. PostgreSQL for the audit log. Local NVR-class box for the inference. RTSP ingest for the cameras.

## Architecture

Camera RTSP → person detection → track → re-ID against enrolment set → classify → rule engine → alert. Audit log per alert with the snippet of footage. Web dashboard for review and enrolment.

## Milestones

M0 — RTSP ingest and person detection on 1 camera. M1 — staff enrolment flow. M2 — visitor-vs-staff classification. M3 — rule engine with the two alert types. M4 — 10 pilot offices in three cities.

## Risks

Risk of misidentifying a staff member as a visitor with severe consequences. Risk of running afoul of India's DPDP Act on biometric data. Staff enrolment may be socially awkward. Lighting and camera angles may make classification brittle.

## Data Model

## Integrations

Python + FastAPI for the orchestration. YOLOv8 for person detection. OpenCV for the tracking. A small re-ID model for staff/visitor classification. PostgreSQL for the audit log. Local NVR-class box for the inference. RTSP ingest for the cameras.
