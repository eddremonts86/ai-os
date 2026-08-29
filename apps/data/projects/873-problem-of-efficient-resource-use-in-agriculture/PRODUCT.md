---
id: "873"
slug: problem-of-efficient-resource-use-in-agriculture
title: Problem of efficient resource use in agriculture
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr"
  captured: "2025-10-28"
category: agtech
date: "2025-10-28"
tags: [AgTech, Hardware, Other]
country: Bulgaria
wtp:
  raw: $10/month for small users
  currency: USD
  period: month
  min: 10
  max: 10
  mrrMid: 10
tech: [IoT sensors (soil moisture, weather), LoRaWAN gateway, MQTT ingest, Node.js + TanStack Start API, SQLite with Drizzle ORM, React dashboard for farmers]
---
# Problem of efficient resource use in agriculture

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A smallholder farmer installs a soil-moisture + weather sensor kit (one gateway + up to 5 probes) and gets a daily "irrigate / fertilize — yes/no, how much" recommendation per field, with a per-field history of water and fertilizer saved vs a calendar baseline — at $10/month, without owning the sensors outright or becoming a sensor engineer.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Smallholder farmer (Bulgaria, similar markets) | Currently waters and fertilizes on a calendar and wants sensor-driven recommendations without buying or maintaining the hardware themselves. |
| Mid-size / large agricultural operator | Runs multi-hectare operations; needs a per-hectare or per-device tier and an API into existing farm-management software. |
| Agricultural cooperative / consultant | Would deploy sensors across a region and resell recommendations to their members; needs a partner / wholesale tier. |
| Large international agribusiness (the author's contacts) | Wants technology-grade, real-time control over inputs across thousands of hectares for sustainability reporting and input-cost reduction. |

## Jobs To Be Done

1. **Functional job** — Know exactly when and how much to irrigate or fertilize each field, based on soil-moisture and weather data, without buying sensors or hiring an agronomist.
2. **Emotional job** — Stop the nagging feeling that the calendar-based schedule wastes water and burns fertilizer; trust the daily recommendation because the sensor history backs it up.
3. **Social job** — Be the farmer in the village who uses "sensor-driven irrigation" and can show neighbours the saved-water number, instead of the one who switched to drip but still waters on Tuesdays.

## Success Metrics

- **Activation:** ≥ 80% of installed kits produce at least one recommendation within 48 h of power-on (no onboarding dead-ends from misconfigured LoRaWAN provisioning).
- **Adoption:** ≥ 70% of small-tier subscribers follow the recommendation in the first month (defined as: actual irrigation within ± 25% of the recommended volume within 24 h).
- **Input savings:** average small-tier subscriber saves ≥ 20% water vs a calendar baseline by month 3 (measured against self-reported baseline).
- **Retention:** ≥ 80% of subscribers renew after the first season (6 months) — ag customers churn on field outcomes, not on features.
- **Co-founder conversation:** the author (George Petrov) is in active conversation as an early sales / consulting channel by week 4.

## Pricing & Monetization

Smallholder tier: $10/month, includes one LoRaWAN gateway + up to 5 probes (hardware is leased, not sold; subscriber returns the kit on cancel). Mid-size tier: per-hectare subscription with a wholesale hardware purchase option. Large-operator tier: per-device SaaS plus optional on-prem deployment. Cooperative / consultant partner tier: a flat partner fee plus per-member recommendation pricing.

## Competitive Landscape

- **Calendar-based irrigation / fertilization** — the current default; what the author says is "not technological enough".
- **Generic IoT soil-moisture kits (e.g. Xiaomi, Arduino + ThingsBoard)** — give the farmer a number, not a recommendation; require the farmer to interpret the data and own the hardware.
- **CropX / Semios / Tule / Arable** — commercial precision-ag platforms; priced for large operators, not the $10/month smallholder ceiling.
- **Local agronomist consultations** — what the author has been doing manually; high quality, low scale, geography-bound; the product's pitch is "same expertise, your phone, every day".

## Risks & Open Questions

- [ ] Validate the $10/month unit economics for one gateway + 5 probes including LoRaWAN connectivity, cloud ingest, and customer support — if it doesn't close, re-scope the small tier (fewer probes, monthly data cap) rather than raising price.
- [ ] Confirm LoRaWAN coverage in the launch region; if a smallholder's field is outside the network, the kit is dead on arrival and a fallback (cellular probes) breaks the $10 tier economics.
- [ ] Decide whether to ship weather data from a third-party provider (e.g. OpenWeather, national meteorological service) or partner with the author for on-site weather stations; the latter raises per-kit cost.
- [ ] Confirm the author (George Petrov) is interested in a co-founder role vs a regional reseller / advisor role; the product must be buildable without his full-time commitment.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr) · **Category:** agtech · **Tags:** AgTech,Hardware,Other
