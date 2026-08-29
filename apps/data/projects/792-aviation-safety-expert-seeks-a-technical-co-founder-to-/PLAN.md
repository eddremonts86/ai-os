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

## Tech Stack

- **Rust with Axum** for the alert API and the replay surface, because the alert path is a near-real-time fanout where predictable latency matters more than framework breadth.
- **Apache Kafka** as the streaming backbone for the fused sensor feed, so input ingestion, model inference and alert delivery are decoupled and back-pressure is handled at the broker rather than in the application.
- **TimescaleDB on PostgreSQL** for the per-alert audit log and the replay window store, since both are time-series workloads where retention and time-range scans dominate.
- **PostgreSQL with PostGIS** for the airspace and wildlife-or-drone geo layers, so spatial joins (aircraft position against restricted zone, against wildlife habitat) run in the database rather than in application code.
- **ONNX Runtime** for the model inference step, so the model artefact is portable across edge inference nodes and the alerting core is not tied to a single framework.
- **FFmpeg** for the optical-feed preprocessing where a camera input is part of the pilot site, since the camera frames need to be normalised before the model sees them.
- **Edge inference nodes (NVIDIA Jetson Orin)** as the deployment shape at a pilot airport, so the inference happens close to the sensor and the alert path does not depend on a remote round-trip.
- **gRPC** for the high-throughput alert delivery to the operator surface, with **MQTT** as the alternative where the operator side already speaks it.
- **OpenSky Network feed** as the first open aircraft-position source, documented and licence-confirmed before wider use.
- **Docker** for local and staging runs, and **Coolify** for the centralised orchestration plane, with edge inference nodes registered against it.

## Architecture

The system has three planes — a sensor-ingestion plane, a model-inference plane, and an alert-delivery plane — with Kafka as the bus between them. Each plane scales independently, and each plane can be paused or replaced without taking the others down. The audit log is a fourth plane that records every event end to end, so any alert can be replayed from its inputs to its delivery.

The sensor-ingestion plane reads from the open feeds (OpenSky for transponder-derived aircraft state, the open NOTAM feed for airspace restrictions, and the wildlife-or-drone source the pilot site chooses). Each ingested event is normalised against a published schema and written to Kafka with the source ID and the ingestion timestamp. Normalisation is strict: a malformed event does not silently become a default, it is rejected with a logged reason. The plane exposes a feed-health endpoint so the operator surface can show when an upstream feed is degraded.

The model-inference plane consumes from Kafka, applies the model via ONNX Runtime, and writes the per-(aircraft, wildlife-or-drone) risk score back to Kafka with the input IDs and the model version stamped on. The plane runs as a stateless service that can be deployed multiple times for throughput, with each replica claiming a partition. Edge inference nodes run the same plane close to the sensor at a pilot site, so latency-critical alerts do not depend on a centralised round-trip. The model artefact is versioned and stored alongside the audit log, so the exact weights that produced an alert are inspectable later.

The alert-delivery plane reads risk scores above a configured threshold from Kafka and emits alerts to verified endpoints (HTTP webhook and gRPC stream). Each alert carries its provenance — input source IDs, model version, timestamp, confidence — and is also written to the TimescaleDB audit log so a reviewer can query the alert later. The plane handles back-pressure by buffering to Kafka rather than dropping alerts; a saturated endpoint is surfaced on the operator surface rather than silently losing alerts.

The replay surface is a separate read-only API that pulls a past window from TimescaleDB, re-runs it through the current model version (or a pinned historical version), and returns what the system would have produced. The surface is what the aviation safety expert uses to validate the alerting logic against known incidents without waiting for live data. The replay surface is read-only and cannot modify the audit log; it is the reviewer's tool, not a back-door.

The orchestration plane is Coolify, with the central services deployed there and the edge inference nodes registered against it for configuration and version rollouts. The model version is rolled out by updating the artefact on Kafka and the inference plane, with the previous version kept live for the audit log's replay pointer until the new version is validated.

## Milestones

1. **M1 — Ingestion plane** — OpenSky and NOTAM feed connectors, normalisation against the published schema, feed-health endpoint.
2. **M2 — Inference plane** — ONNX Runtime integration, the model artefact registry, edge-node deployment on Jetson Orin at a pilot site.
3. **M3 — Alert-delivery plane** — gRPC and HTTP endpoints, provenance stamping, audit-log writes, back-pressure handling.
4. **M4 — Replay surface** — read-only replay API, pinned model versions, replay-window coverage dashboard.
5. **M5 — Operator surface** — feed health, alert volume, alert provenance inspection, replay-window coverage.
6. **M6 — Domain validation** — the aviation safety expert reviews the alerting logic against a labelled replay set; the model's precision and recall are measured, not asserted.
7. **M7 — Regulator engagement** — DGAC review path opened before any deployment beyond a private pilot.

## Risks

- **Feed outage silently degrades the alert path** — an upstream feed goes silent and the alerting system produces fewer alerts without surfacing why. Mitigation: feed-health surfaced on the operator surface and outage signals propagated to the alert path so the absence is visible.
- **Model drift** — the model's performance degrades as the airspace or wildlife patterns change. Mitigation: continuous replay evaluation against a labelled set, with drift signals surfaced before any precision or recall claim ages.
- **Alert-provenance loss** — an alert is delivered without its provenance chain because a plane dropped a field. Mitigation: alert schema validated end to end, with malformed alerts rejected at the delivery plane rather than passed through.
- **Edge-node connectivity loss** — the pilot site's inference node loses connectivity to the central orchestration plane. Mitigation: edge node runs the inference plane autonomously with a cached model artefact and reconciles with the central audit log on reconnect.
- **Regulatory block** — DGAC review surfaces a requirement the MVP does not satisfy. Mitigation: regulator engagement is its own milestone before wider deployment, not a launch-day scramble.
- **Open-source licence drift** — an upstream feed changes its licence and the alerting system's downstream use is no longer permitted. Mitigation: feed-licence review is a recurring task, with feed changes triggering a deployment pause.
- **Loss-magnitude overclaim** — the plan, or any future marketing, asserts a specific loss number the source does not provide. Mitigation: the loss-magnitude claim is deferred to a future measurement rather than asserted in the spec.
