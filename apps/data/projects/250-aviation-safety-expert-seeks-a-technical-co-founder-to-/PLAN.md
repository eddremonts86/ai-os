---
id: "250"
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
---
# Aviation safety expert seeks a technical co-founder to develop an AI solution that prevents daily collisions between aircraft and birds/drones — a problem causing massive losses.

## Tech Stack

- Python 3.11 + FastAPI for the perception backend; the work is real-time signal processing, ML model serving, and structured event emission, which Python covers well with PyTorch and a small ops surface.
- PyTorch for the perception models (radar-track association, optical bird/drone classification, collision-risk predictor); chosen over TensorFlow for the more flexible research-to-deployment path on edge hardware.
- NVIDIA Jetson Orin (or a comparable edge GPU) at the sensor site for low-latency inference; chosen because the system must run at the airport, not in a remote cloud, both for latency and for operational-data-residency reasons.
- ROS 2 (Robot Operating System) for sensor integration and timestamping; chosen because radar + camera + tracking is exactly the kind of multi-sensor pipeline ROS is built for.
- TimescaleDB (PostgreSQL extension) for time-series storage of sensor tracks, classifications, and alerts; querying a season of data by runway and contact type is the validation workload.
- A small React + Vite desktop view for the tower: contacts, classifications, collision-risk scores, and the runway context. Reads only; tower staff never act on AI output during the MVP.
- Self-hosted on a single physical server at the pilot site plus the edge unit at the sensor; no cloud dependency in the MVP path.

## Architecture

Three pieces:

1. **Sensor stack** — radar unit + PTZ or fixed optical camera on the approach corridor. Both stream to the edge unit with hardware timestamping.
2. **Perception + alert pipeline** — radar tracks and optical frames flow through PyTorch models for classification and collision-risk prediction. Outputs are emitted as structured events to TimescaleDB.
3. **Tower view + validation harness** — the tower view shows contacts, classifications, and collision-risk scores in real time. The validation harness replays the season's events against actual operational records to compute recall and false-alarm rate.

The MVP is shadow-mode advisory. Tower staff see the view but do not act on it; the system runs in parallel with existing wildlife-management procedures.

## Milestones

- **M1 — Co-founder agreement.** Equity, IP, and decision rights signed before any code is written.
- **M2 — Sensor placement.** Radar and camera installed at one runway approach corridor with airport authority cooperation.
- **M3 — Perception v1.** Classification pipeline (bird / drone / other) running on radar and optical streams; outputs persisted.
- **M4 — Collision-risk predictor.** Real-time scoring that combines classification, contact trajectory, and active-aircraft context.
- **M5 — Tower view.** Real-time view in the tower with contacts, classifications, and risk scores.
- **M6 — Validation season.** Three to six months of shadow-mode operation, with recall and false-alarm rate published.

## Risks

- Co-founder risk: the partnership is the product. If the fit is wrong, the project stalls before the sensor is installed. M1 must be done before any technical work.
- Certification gate: the moment the system starts driving operational decisions (not advisory), it falls under aviation-safety regulation. The MVP must keep the system shadow-mode only and document the boundary clearly.
- False-alarm fatigue: a noisy alert is worse than no alert. The MVP must measure the false-alarm rate per shift and tune before declaring success; a low-recall, low-false-alarm system is more useful than a high-recall, high-noise one.
- Sensor cooperation: the airport must host the radar and cameras. Without that, the pilot cannot run. M2 must be a precondition for technical milestones.
- Weather and night envelope: optical sensors degrade in fog, heavy rain, and night. The MVP must publish its operating envelope rather than overpromise detection in those conditions.
