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

## Problem

An aviation safety expert in France is searching for a technical co-founder to build an AI system that prevents daily collisions between aircraft and birds or drones — incidents the post describes as causing massive losses. The capture itself is a co-founder search rather than a product spec, and the plan here treats the AI collision-prevention system the expert describes as the artefact. The source does not quote a specific loss figure, an accident count, an airport, an airline or a regulator, and the plan does not invent any of those.

The capture is a one-line problem statement from ProblemHunt, with country listed as France and no further detail. What the source names is the actor (an aviation safety expert), the pain (daily collisions between aircraft and birds and drones causing massive losses — the post uses "massive" as a qualitative descriptor, not a quoted number), and the missing thing (an AI solution). The plan treats those bare facts as the ground truth and reasons only about what an AI collision-prevention system must do at the engineering level, without inventing losses, airports, customers or claims.

The honest reason this is authorable at all is that the engineering surface is well-known from the aviation safety literature: bird-strike and drone-strike prevention is a multi-sensor fusion problem (radar, optical, acoustic, transponder feeds) with a real-time alerting path to pilots and air-traffic controllers. The plan scopes the narrowest honest MVP — sensor ingestion, model-based detection, and a verified-alert path — and explicitly defers any loss-magnitude claim, since the source uses "massive" as a gesture, not a measurement.

## Objective

Stand up the technical core of an AI collision-prevention system that fuses the available sensor feeds (open aircraft transponder data, open airspace feeds, optical and acoustic sources where deployed) into a near-real-time stream of collision-risk alerts with a verifiable per-alert provenance, so a technical co-founder can take the foundation and the aviation safety expert can validate the alerting logic against their domain knowledge.

## Target Users

- The aviation safety expert who posted the capture, who is the first reviewer of the alerting logic and the first domain authority on what a useful alert looks like.
- A technical co-founder recruited alongside the expert, who owns the engineering surface and the deployment shape.
- Airport operations teams in France who would pilot the alerting feed against an actual approach path, since the source country is France and the first deployment is French.
- Air-traffic controllers at the piloted site, who consume the alert feed alongside the existing transponder-based picture.
- Bird-wildlife biologists at the piloted airport, who consume the species-classification output alongside the strike feed.
- Civil aviation authorities reviewing the alerting system before any wider deployment.

## MVP Scope

- Ingestion of an open aircraft-position feed (the OpenSky Network is the documented open source of transponder-derived state) into a streaming pipeline, normalised against a published schema.
- Ingestion of an open airspace-restriction and NOTAM feed, so the alerting system has a current ground truth of where drones and aircraft are not supposed to be.
- A detection model that, given the fused stream, produces a near-real-time risk score per (aircraft, wildlife-or-drone report) pair, with the model version and inputs stamped onto every alert.
- An alert delivery path that emits the alert to a verified endpoint (an HTTP webhook and a gRPC stream), with the alert payload carrying its provenance (input source IDs, model version, timestamp, confidence).
- A replay surface that re-runs a past window through the model and shows what the alerting system would have produced, so the expert can validate the alerting logic against known incidents without waiting for live data.
- A per-alert audit log that records the input IDs, the model version, the confidence score, and the endpoint the alert was delivered to, so an aviation-safety reviewer can inspect any alert later.
- A documented model card naming the training data sources, the model's known failure modes, and the model's intended use, so the alerting system is not deployed in a context the model was not designed for.
- French-language and English-language copy on the operator surface, since the source country is France and the first domain reviewer is French.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The system is a near-real-time alerting core, not an autonomous avoidance controller. A pilot or controller remains the human in the loop; the system emits alerts, it does not act on the aircraft.
- Every alert carries a verifiable provenance chain — input IDs, model version, timestamp, confidence — so a reviewer can trace any alert back to the data and the model that produced it.
- The plan does not quote a loss figure. The source uses "massive" as a qualitative descriptor; any specific number on what a collision costs an airline, an airport, or an insurer would be invention and is left out.
- The system uses open data sources at MVP. Paid feeds (commercial radar, restricted drone telemetry, paid NOTAM streams) are out of scope until the open-source pipeline is validated.
- Model performance cannot be asserted in numbers the source does not provide. The plan commits to a measured evaluation suite (precision, recall, time-to-alert), with the actual numbers produced by running the suite, not predicted here.
- French civil aviation authorities (DGAC) will need to review any alerting system before deployment. The MVP surfaces the review path as a documented step rather than treating the regulator as a future concern.
- The system does not store or process personal data beyond what the open feeds already publish, so personal-data handling is bounded by the feed providers' policies rather than introducing a new risk surface.
