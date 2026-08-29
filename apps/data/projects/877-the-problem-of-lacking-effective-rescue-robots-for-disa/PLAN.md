---
id: "877"
slug: the-problem-of-lacking-effective-rescue-robots-for-disa
title: The problem of lacking effective rescue robots for disaster situations
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-rescue"
  captured: "2025-10-27"
category: other
date: "2025-10-27"
tags: [Other]
country: India
tech: [ROS 2, NVIDIA Jetson Orin, LiDAR + depth + thermal cameras, "4G/5G + mesh radio", Cloud-edge AI orchestration]
---
# The problem of lacking effective rescue robots for disaster situations

## Tech Stack

- **Robot middleware:** ROS 2 (Humble / Iron) for the ground unit; PX4 on the tethered drone; a custom low-level controller for the soft-robot vine.
- **Onboard compute (ground unit):** NVIDIA Jetson Orin (32 GB / 64 GB SKU depending on sensor stack), with the inference for victim detection running locally.
- **Sensing:**
 - Ouster / Hesai LiDAR (16–128 beam) for SLAM and 3D mapping.
 - Stereoscopic depth camera for short-range obstacle avoidance.
 - Thermal camera (FLIR Boson or similar) for victim detection.
 - Industrial gas sensor stack (CH4, CO, O2, H2S) for hazard awareness.
 - Two-way audio with a high-SPL speaker and a noise-cancelling mic.
- **Comms:**
 - Primary: 4G/5G with eSIM and dual-SIM failover.
 - Secondary: 802.11 mesh (Rajant / Silvus-class mesh nodes) for backhaul-bridge.
 - Tertiary: tethered fibre + copper on the ground unit (200 m reel) for guaranteed link into voids.
- **Drone:** a custom quadcopter built on a Pixhawk / Cube Orange + HereLink, tethered to the ground unit for indefinite flight time during reconnaissance.
- **Operator UI:** an Android-based ruggedised tablet (Samsung Tab Active / Getac) running a custom Kotlin app; the ROS layer is invisible to the operator.
- **Edge AI:** a fine-tuned YOLO-NAS / RT-DETR model for human-shape thermal detection, quantized for the Jetson Orin; updated OTA on a quarterly cadence.
- **Manufacturing partners:** Indian EMS for chassis + enclosure (Bengaluru / Pune); ROS / autonomy integration in-house; final assembly in Chennai.

## Architecture

The kit is a small fleet of co-operating agents: the ground unit is the workhorse, the drone is the over-the-pile scout, the soft vine is the void-penetrator, and the rugged tablet is the operator's command surface. All four share a common ROS 2 / DDS bus on a private mesh; the base station bridges that bus to the outside world (cellular / satellite) only when the operator chooses to. The operator UI presents three panes: a 3D map (LiDAR SLAM), a thermal victim-detection feed, and a comms panel.

```
Operator (rugged tablet)
        │  (private mesh, 5 GHz)
        ▼
Base station ─── 4G/5G + satellite (optional, opt-in)
        │
        ├──▶ Ground unit (Jetson Orin + LiDAR + thermal + audio)
        │       ├──▶ ROS 2 / DDS bus
        │       ├──▶ Edge-AI victim detector (TFLite / TensorRT)
        │       └──▶ Tethered fibre reel (200 m)
        │             │
        │             └──▶ Soft-robot vine (penetrates voids)
        │
        └──▶ Drone (tethered, PX4)
                └──▶ Aerial scout + comms relay into voids
```

## Milestones

1. **M0 — Spec freeze + state procurement partner.** Letter of interest from one Indian state SDRF; budget envelope locked; service partner MOU. End of month 1.
2. **M1 — Ground unit v1.** Tracked chassis, manipulator, sensor stack, edge-AI victim detector running on Jetson Orin; ruggedised to IP65. End of month 4.
3. **M2 — Operator UI.** Android-tablet UI with map, thermal feed, comms panel; ≤ 2-hour training validation with non-technical operators. End of month 6.
4. **M3 — Drone + base station.** Tethered drone integrated with the ground unit; mesh-radio base station + 4G/5G bridge; end-to-end comms validated in a real test collapse. End of month 9.
5. **M4 — Soft vine v1.** SPROUT-style or equivalent vine that penetrates rubble voids; comms relay through the vine into the ground unit. End of month 12.
6. **M5 — Pilot with state SDRF.** 5 kits deployed to a Tamil Nadu / Karnataka SDRF battalion; 6 months of repeated drills; field reliability data. End of month 18.

## Risks

- **Field survival.** Every academic rescue robot fails the same way: it works on the lab floor and dies on the rubble pile. The MVP must budget 6+ months of field validation with the state partner before claiming efficacy.
- **Procurement bureaucracy.** Indian state SDRF procurement is a 12–18-month cycle at minimum; without a state-level letter of interest before the build, the kits will sit on a shelf.
- **Service network.** Without a Chennai / Bengaluru service partner, no procurement officer will sign. The MVP plan must include service-partner selection before the first delivery.
- **Operator UI simplicity.** A custom Android UI that hides ROS is essential — but it must also expose the raw sensor feeds that ROS researchers want. Building both well is a budget line that easily doubles.
- **Soft-robot vine reliability.** Vines are the most novel component and the least field-tested. The MVP should ship without it and treat it as a v1.1 add-on; otherwise the project risks slipping the procurement window waiting for a component that may not work.
- **Regulatory.** WPC (wireless) and DOT (cellular) clearances, plus export-control implications for any imported subassemblies (drone, camera, LiDAR), can stall the schedule by 3–6 months.
