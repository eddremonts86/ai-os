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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An AI collision-prevention core that fuses open aircraft-position, airspace-restriction and wildlife-or-drone data into a near-real-time stream of collision-risk alerts, where every alert carries its input sources, its model version and its confidence so an aviation safety expert can validate the alerting logic and a technical co-founder can build on a foundation that is auditable end to end.

The system does not act on aircraft. It emits alerts that a pilot or controller can review, with a replay surface that lets the expert run a past window through the model and see what it would have produced. The first deployment is French, the alerting logic is reviewed by the aviation safety expert who posted the capture, and the loss-magnitude claim the source gestures at is left to a future measurement rather than asserted in the spec.

**One-liner:** A near-real-time collision-risk alerting core for aircraft versus birds and drones, built on open sensor feeds, with every alert carrying its data sources and model version so an aviation safety reviewer can audit what produced it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Aviation safety expert (the poster) | First domain reviewer of the alerting logic; defines what a useful alert looks like. |
| Technical co-founder (to be recruited) | Owns the engineering surface, the deployment shape, and the future sensor integrations. |
| French airport operations teams | Pilot the alerting feed against an actual approach path before any wider deployment. |
| Air-traffic controllers | Consume the alert feed alongside the existing transponder picture. |
| Bird-wildlife biologists | Consume the species-classification output alongside the strike feed. |
| French civil aviation authorities (DGAC) | Review the alerting system before any deployment goes beyond a pilot site. |

## Jobs To Be Done

1. **Functional job** — Surface a collision-risk alert in time for a pilot or controller to act, with the alert carrying the data sources and confidence that justify the call.
2. **Functional job** — Replay a past window through the model so the aviation safety expert can validate the alerting logic against known incidents.
3. **Functional job** — Extend the foundation with additional sensor feeds later (commercial radar, acoustic arrays) without rewriting the alert path.
4. **Emotional job** — Stop the feeling that the alerting system is a black box the expert cannot review.
5. **Social job** — Be the technical co-founder who ships a system the expert can show to a regulator and have the regulator find it auditable.

## Success Metrics

- **Time-to-alert** — measured end-to-end latency from a fused input event to the alert being delivered to the verified endpoint. This is the operational threshold that determines whether an alert is useful at all.
- **Model precision and recall** — measured against a labelled replay set the expert curates, with the numbers produced by running the suite rather than asserted in the spec.
- **Alert provenance completeness** — share of delivered alerts whose input IDs, model version and confidence are intact in the audit log. An alert without provenance is the failure mode the system is built to prevent.
- **Replay-window coverage** — share of past incidents the expert can replay through the system without a missing data gap. Coverage gaps are where the alerting logic cannot be validated.
- **Endpoint delivery success rate** — share of alerts the system successfully delivered to the verified endpoint, since an alert the system produced but did not deliver is the same as no alert.
- **Reviewer feedback turnaround** — median time from the expert flagging an alert to the system acknowledging the flag, since the expert is the first reviewer and slow turnaround breaks the validation loop.

## Pricing & Monetization

The source names no fee, no customer and no commercial model. What the architecture fixes is the cost shape: the alerting core is a streaming pipeline whose cost scales with the volume of inputs and the rate of alerts, not with the number of pilots or controllers. Any future commercial model has to be evaluated against that cost shape — per-airport subscription, per-alert volume, or per-aircraft covered — and the choice is open. The MVP at this stage is a technical foundation, not a commercial product.

## Competitive Landscape

- **Existing aviation safety alerting systems (the names the source does not provide)** — typically operate inside a single airport or airline, with sensor coverage that does not generalise across sites.
- **Open aviation data feeds (OpenSky, ADSB Exchange, the open NOTAM streams)** — provide the inputs but not the alerting core; the system is a layer above them, not a replacement.
- **Drone-detection vendors** — sell proprietary hardware-software stacks, often with their own alerting UX; the post's framing as an AI solution a technical co-founder can build suggests an open foundation rather than a closed vendor.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm with the aviation safety expert what an alert must contain to be useful at all — input sources, confidence, replay link, or a richer payload — before committing the alert schema.
- [ ] Decide whether the first deployment shape is a single-airport pilot or a regional feed, since the sensor coverage and the regulator's review path differ between the two.
- [ ] Confirm the open feed licences (OpenSky, open NOTAM streams) permit the alerting system's downstream use, including any commercial use if a commercial model is later adopted.
- [ ] Establish a baseline measurement of model precision and recall against a replay set the expert curates, before any wider deployment claim is made.
- [ ] Decide how the alerting system handles feed outages (an upstream feed goes silent) — degraded mode, alert suppression, or explicit outage signal — and surface that choice to operators.
- [ ] Confirm the review path with French civil aviation authorities before any deployment beyond a private pilot, so the regulator is engaged early rather than at launch.
