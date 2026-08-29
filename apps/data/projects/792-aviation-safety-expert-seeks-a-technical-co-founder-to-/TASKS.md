---
id: "792"
slug: aviation-safety-expert-seeks-a-technical-co-founder-to-
title: Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/9g9de9og51-aviation-safety-expert-seeks-a-technical"
category: ai
date: "2026-01-13"
tags: [AI, Dev, Logistics, Travel, Hardware, Other]
country: France
tech: [Rust, Axum, Apache Kafka, TimescaleDB, PostgreSQL with PostGIS, ONNX Runtime, FFmpeg, edge inference nodes (NVIDIA Jetson Orin), gRPC, MQTT, OpenSky Network feed, Coolify]
---
# Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/792-aviation-safety-expert-seeks-a-technical-co-founder-to-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Connect the OpenSky Network feed and the open NOTAM feed into the ingestion plane, normalised against the published schema with malformed events rejected and logged.
- [ ] Stand up Kafka as the streaming backbone between ingestion, inference and alert-delivery, with retention and partitioning sized for the alert volume the pilot site will see.
- [ ] Model the airspace and wildlife-or-drone layers in PostgreSQL with PostGIS, so spatial joins run in the database rather than in application code.
- [ ] Integrate ONNX Runtime for the model inference step, with the model artefact versioned and stored alongside the audit log.
- [ ] Deploy the inference plane on edge inference nodes (NVIDIA Jetson Orin) at the pilot site, with a cached model artefact and a local audit-log buffer that reconciles on reconnect.
- [ ] Implement the alert-delivery plane: gRPC and HTTP endpoints, provenance stamping (input IDs, model version, timestamp, confidence), audit-log writes, back-pressure handled by buffering to Kafka.
- [ ] Build the replay surface as a read-only API that re-runs a past window through the current or pinned model version and returns what the system would have produced.
- [ ] Implement the TimescaleDB audit log schema for alerts and replay windows, with retention tuned for the regulator's review window.
- [ ] Surface the feed-health endpoint and the alert-provenance inspector on the operator surface, so an aviation safety reviewer can see what produced any alert.
- [ ] Author the model card (training data sources, known failure modes, intended use) before any deployment claim is made.
- [ ] Confirm the open feed licences (OpenSky, open NOTAM) permit the system's downstream use before any commercial-shape work begins.
- [ ] Run a labelled replay-set evaluation with the aviation safety expert, producing measured precision and recall rather than asserted numbers.
- [ ] Open the DGAC review path before any deployment beyond a private pilot, with the regulator engaged as a documented milestone.
- [ ] Add French-language copy on the operator surface alongside English, since the first domain reviewer and the first pilot site are French.
- [ ] Run an end-to-end test at the pilot site: live feeds ingested, alerts produced with full provenance, alerts delivered to a verified endpoint, replay of a past window producing the same alert the system delivered live.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
