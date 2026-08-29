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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Letter of interest from one Indian state SDRF (Tamil Nadu / Karnataka / Kerala)
- [ ] Identify the Indian service partner (Bengaluru / Chennai) and sign MOU on spare-parts + annual support
- [ ] Industrial design freeze on the ground-unit chassis (IP65, tracked, manipulator-ready)
- [ ] Vendor selection for LiDAR, thermal camera, Jetson Orin SKU, mesh-radio nodes
- [ ] Regulatory pre-check with WPC (wireless) and DOT (cellular) on the proposed radio stack

## Phase 1: Core

- [ ] Ground unit v1: tracked chassis, manipulator, full sensor stack, edge-AI victim detector on Jetson Orin
- [ ] Ruggedised operator UI on a Samsung Tab Active (or equivalent) with map, thermal feed, comms panel
- [ ] ≤ 2-hour operator-training validation with 5 non-technical SDRF responders
- [ ] Base station: mesh-radio gateway + 4G/5G bridge, opt-in satellite uplink
- [ ] Tethered drone integrated with the ground unit via the mesh bus; 200 m fibre tether
- [ ] Soft-robot vine v1 (deferred — see risks): SPROUT-class or equivalent, with comms relay into voids
- [ ] End-to-end drill at a real or simulated collapse: locate a mannequin, map the structure, relay comms within 30 minutes
- [ ] Field-reliability soak test: 6 months of repeated drill deployments, ≥ 90% uptime
- [ ] Pricing quote locked at ≤ ₹50 lakh / ~$60,000 per heterogeneous kit at low-volume production

## Phase 2: Deploy

- [ ] Pilot deployment of 5 kits to a Tamil Nadu / Karnataka SDRF battalion with a 6-month evaluation contract
- [ ] Annual service-partner contract (spare parts, training refreshers, on-call engineering) at ₹3–5 lakh / year per kit
- [ ] National NDRF scale-up procurement (10+ kits) pending the pilot's field-reliability data
- [ ] NGO / academic pricing tier at ₹25–30 lakh per kit with software-limited non-military use
