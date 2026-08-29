---
id: "761"
slug: need-a-smart-device-that-automatically-detects-pigeons-
title: Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market only works temporarily.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/hardware/xaf7mgmiy1-need-a-smart-device-that-automatically-d"
  captured: "2026-02-23"
category: hardware
date: "2026-02-23"
tags: [Hardware, Other]
country: France
wtp:
  raw: $200-$400 one-time
  currency: USD
  min: 200
  max: 400
  period: one-shot
  mrrMid: 300
tech: [ESP32-S3, PIR + camera (object detection), piezo speaker, weatherproof enclosure, Li-ion / solar, edge ML (TFLite Micro)]
---
# Need a smart device that automatically detects pigeons and permanently deters them. Everything on the market only works temporarily.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A city dweller or small business owner gets a self-contained, solar-powered smart device that detects pigeon landings in real time at the protected spot, triggers a humane aversive stimulus (ultrasonic + predator call + brief water spray) on landing, and adapts its deterrent pattern over the roost cycle — so the pigeons stop returning instead of habituating. One $200–$400 one-time purchase replaces an endless cycle of half-effective DIY methods (vinegar, spikes, reflective discs).

## Target Users

| Stakeholder | Why they care |
|---|---|
| City resident with a balcony / rooftop / windowsill | Tired of cleaning droppings, tired of failed DIY deterrents; willing to spend a one-time $200–$400 to fix it. |
| Café / restaurant owner with outdoor seating | Hygiene, customer comfort, health-department risk from pigeon droppings. |
| Building / facility manager | Façade damage from acidic droppings, tenant complaints; one device per problem spot, not a full pest-control contract. |
| Pest-control operator | Sells / installs the device as a service to building clients; recurring revenue. |

## Jobs To Be Done

1. **Functional job** — Stop pigeons from returning to a specific roost spot, autonomously, with one install.
2. **Emotional job** — Stop the dread of stepping onto the balcony and seeing fresh droppings again, every week.
3. **Social job** — Be able to invite friends over without warning them about the pigeons.

## Success Metrics

- **Efficacy:** in pilot installs, ≥ 70% reduction in pigeon return-visits per protected spot, measured over 30 days vs. a 7-day pre-install baseline.
- **Habituation resistance:** efficacy does not regress between day 14 and day 30 (the failure mode the author explicitly called out).
- **Battery life:** ≥ 4 weeks between charges in solar-equipped installs; ≥ 2 weeks in shade-only installs.
- **False positives:** ≤ 1 deterrent activation per day per device triggered by non-pigeon motion (passers-by, leaves, cats).
- **Returns:** ≤ 5% return-for-refund rate — the device either works visibly or the money-back guarantee is the dominant cost.

## Pricing & Monetization

One-time $299 per device, fitting inside the author's $200–$400 range with room for distribution margin. A "pest-control operator" tier sells at $249 with a co-branded case and a partner portal (deferred to phase 2). No subscription in v1 — the device is fully functional offline and a subscription would undermine the value prop.

## Competitive Landscape

- **Bird-X / BirdStop / BirdBlazer ultrasonic repellers** — passive ultrasonic, no detection, pigeons habituate within weeks.
- **Pigeon spikes / netting** — physical exclusion; ugly, installation labour, and the author already tried them and found them ineffective long-term.
- **Decoy owls / reflective tape / wind chimes** — visual / motion deterrents; habituation is the standard failure mode the source describes.
- **Professional pest control (Rentokil, anti-pigeon gel, spikes installed)** — €200–€500+ per visit, recurring, requires technician.
- **Generic IoT PIR + water-sprinkler repellers** (e.g. ScareCrow, motion-activated sprinklers) — closest competitor on the "active detection" axis; not pigeon-specific, doesn't adapt.

## Risks & Open Questions

- [ ] EU / French animal-welfare regulations around aversive stimuli to birds — water spray and ultrasonic are usually fine; predator-call audio is borderline; legal review before launch.
- [ ] Pigeon-detection accuracy at the edge on an ESP32-class MCU — TFLite Micro can do it but the model must be tuned for low-light / silhouette cases; the camera + PIR wakeup combo mitigates power but not accuracy.
- [ ] Habituation remains the existential risk — even an adaptive system can be outsmarted. The MVP must measure this explicitly in the pilot and either ship a fourth deterrent mode (e.g. brief compressed-air "boom") or admit partial efficacy in marketing.
- [ ] BoM cost at the $299 price point — ESP32-S3 + camera + solar + battery + IP65 enclosure is tight. Confirm with the first 100-unit prototype run before announcing the price.
- [ ] Privacy optics — a camera on a balcony looks like surveillance to neighbours. PIR-only mode (no camera, acoustic detection only) is a viable v1 SKU; the camera SKU is the higher-accuracy option.
- [ ] Distribution in France — the author is a French consumer. CE marking, French-language packaging and manual, and a Euro-pricing SKU are required.

---

_Source:_ [ProblemHunt](https://problemhunt.pro/en/hardware/xaf7mgmiy1-need-a-smart-device-that-automatically-d) · **Category:** hardware · **Tags:** Hardware,Other
