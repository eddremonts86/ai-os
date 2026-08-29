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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

An Indian state disaster-response force gets a heterogeneous rescue-robot kit (tracked ground unit + tethered drone + soft vine + rugged tablet + mesh-radio base station) that an SDRF operator can deploy in ≤ 10 minutes, locate trapped survivors in a collapsed structure, and relay comms into voids — at a procurement price that an Indian state disaster-management budget can absorb. The product closes the gap between academic rescue-robot demos (which do not survive a real rubble pile) and the operations-grade systems that only wealthy national agencies can buy.

## Target Users

| Stakeholder | Why they care |
|---|---|
| NDRF / SDRF teams in India | Currently relies on cadaver dogs and partial international aid; needs a domestic, procurement-friendly platform. |
| State disaster-management authorities | Procurement budgets are tight; need ROI per rupee on rescue-capability uplift. |
| Industrial operators (mines, O&G, ports, metros) | Confined-space rescue capability is a regulatory and reputational must-have. |
| Humanitarian NGOs in disaster zones | Need a portable, durable platform that works without reliable backhaul. |
| Academic SAR robotics labs | Want a cheaper platform than Spot / ANYmal to build research on top of. |

## Jobs To Be Done

1. **Functional job** — Locate and communicate with trapped survivors inside a collapsed structure within 30 minutes of arrival, using a kit that an SDRF operator can drive after ≤ 2 hours of training.
2. **Emotional job** — Stop the helplessness that comes from arriving at a collapse with no eyes inside the rubble.
3. **Social job** — Be able to point at a domestic, Indian-built capability rather than wait on international SAR teams to mobilise.

## Success Metrics

- **Drill success:** the kit locates and communicates with a mannequin in a simulated collapse within 30 minutes of arrival, in ≥ 4 of 5 validation drills.
- **Operator training:** a non-technical SDRF operator drives the ground unit to a target after ≤ 2 hours of training, in 5 of 5 cases.
- **Procurement price:** at ≤ ₹50 lakh / ~$60,000 per heterogeneous kit, the product is within reach of an Indian state SDRF's annual capex line.
- **Field survival:** ≥ 90% of pilot kits remain operational after 6 months of repeated drill deployments (no IP65 failure, no sensor-tree disconnection).
- **Detection recall:** the edge-AI victim detector finds ≥ 80% of human-shaped thermal signatures in dust / low-light at ≤ 5 m range.

## Pricing & Monetization

Government procurement pricing at ₹45–50 lakh (~$54,000–$60,000) per heterogeneous kit, with volume discounts above 10 kits (national procurement scale). A separate "service partner" annual contract covers spare parts, training refreshers, and on-call engineering support at ₹3–5 lakh / year per kit. NGO / academic pricing at ₹25–30 lakh (~$30,000–$36,000) per kit, software-limited to non-military use.

## Competitive Landscape

- **Boston Dynamics Spot** — production-grade but $150k+ for a single quadruped with no manipulator, no soft-robot vine, and no Indian service network.
- **ANYbotics ANYmal** — similar profile, also Western-priced and service-network-dependent.
- **DJI industrial drones (M30 / M350)** — strong aerial component but no ground / soft-robot integration; detection AI is on the edge but the platform is drone-only.
- **Academic SAR robots (Howie Choset snake, MIT Cheetah)** — research only; never produced for procurement.
- **Cadaver dogs + manual drills** — current Indian SDRF baseline; slow, dog-fatigue-bound, no comms relay into voids.

## Risks & Open Questions

- [ ] The Indian SDRF procurement process is bureaucratic; a state-level pilot (Tamil Nadu / Karnataka / Kerala) is the path of least resistance before national NDRF scale.
- [ ] Mesh radio + backhaul-bridging under disaster conditions is non-trivial; a small "base station" team with cellular + satellite fallback must be part of the MVP.
- [ ] The soft-robot "vine" (e.g. SPROUT-style) is the most novel component and the highest residual technical risk; the MVP should ship the ground + drone pair first and treat the vine as a v1.1 add-on.
- [ ] Operator-UI simplicity vs. ROS flexibility — a custom UI is required for the ≤ 2-hour-training target, but ROS underneath keeps the academic-lab market addressable. Invest in a clear separation between the operator UI and the ROS layer.
- [ ] Long-tail service and spare-parts network in India — a single Bengaluru / Chennai service partner is the floor; without it, no procurement officer will sign.
- [ ] Regulatory clearance for radio / cellular gear in India (WPC + DOT), export-control implications if the vine or drone subassemblies are imported.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/other/m5ks0dxi31-the-problem-of-lacking-effective-rescue) · **Category:** other · **Tags:** Other
