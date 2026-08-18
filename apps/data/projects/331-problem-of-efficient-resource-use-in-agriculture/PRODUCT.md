---
id: "331"
slug: problem-of-efficient-resource-use-in-agriculture
title: Problem of efficient resource use in agriculture
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/agtech/5gr3p49mg1-problem-of-efficient-resource-use-in-agr"
category: agtech
date: "2025-10-29"
tags: [AgTech, Hardware, Other]
country: Bulgaria
tech: [Raspberry Pi firmware (C), LoRaWAN stack, InfluxDB on a NAS, Grafana, MQTT broker (Mosquitto)]
---
# Problem of efficient resource use in agriculture

> Product brief authored from the source title and category. The poster's text was not available (source.name: manual); sections below re-state the problem and infer only what the title and category support.

## Value Proposition

A Bulgarian smallholder gets a printable per-zone irrigation and input plan each morning, based on sensor data rather than habit, and pays for the kit within two seasons of reduced water and fertilizer waste.

## Target Users

- Bulgarian smallholders running 50-200 hectares of mixed crops without an in-house agronomist.
- Cooperative members who share one kit across several holdings and want a printable daily plan.
- Agri-extension officers who need a fleet view of multiple farms for subsidy reporting.

## Jobs To Be Done

1. **Functional job** - Decide how much to irrigate each zone today, without walking the whole field.
2. **Emotional job** - Stop second-guessing applications made on instinct in dry years.
3. **Social job** - Hand the extension officer a credible daily record at the end of the season.

## Success Metrics

- **Pilot metric:** >= 15% reduction in irrigation water use across 3 farms vs. the operator's own previous-season baseline.
- **Adoption:** kit operates unattended through one full growing season without intervention.
- **Reliability:** sensor uptime >= 90% per node per month.

## Competitive Landscape

- **Pessl / Davis / CropX** - capable systems, but priced for agribusiness, not for a 100-hectare smallholder.
- **Manual scouting and calendar-based spraying** - what the farmer does today; cheap, wasteful.
- **EU-subsidised pilot projects** - useful but stop at the end of the grant.

## Risks & Open Questions

- See PLAN.md Risks for the technical / operational risks.
- [ ] Confirm pricing model and WTP signal in user interviews before MVP launch.
- [ ] Validate country-specific compliance (data, payments, content) before MVP launch.

---

_Source:_ ProblemHunt (manual capture) · **Category:** agtech · **Tags:** AgTech, Hardware, Other
