---
id: "753"
slug: for-5-years-goods-have-been-stolen-from-the-office-ther
title: "For 5 years, goods have been stolen from the office. There is no available service that automatically analyzes camera footage and sends alerts about suspicious activity."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/security/rgj4xt7ep1-for-5-years-goods-have-been-stolen-from"
  captured: "2026-03-25"
category: security
date: "2026-03-25"
tags: [Security, Business, Other]
country: India
wtp:
  raw: open to subscription or pay-per-incident
  currency: USD
  period: month
tech: [Python, RTSP / ONVIF camera ingest, YOLOv8 / RT-DETR detection, ByteTrack multi-object tracking, zone-based rule engine, FastAPI, PostgreSQL, alert delivery via WhatsApp Business API + SMS, on-prem NVR-friendly Docker]
---
# For 5 years, goods have been stolen from the office. There is no available service that automatically analyzes camera footage and sends alerts about suspicious activity.

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A small Indian shop owner who already owns CCTV cameras gets a real-time alert on their phone the moment something suspicious happens — after-hours entry, loitering near high-value stock, unattended bag — instead of finding out the next morning that merchandise is gone. The service works with the cameras and NVR they already own, sends alerts on WhatsApp (the channel they actually answer), and is priced at a level a single-shop owner can absorb monthly instead of the enterprise SOC tier that current solutions assume.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Small Indian retail / office shop owner | Already owns cameras but cannot watch the feed; loses goods periodically and only finds out afterwards; cannot afford a guard. |
| Small warehouse / godown operator | Same pain, larger space, fewer cameras; same need for real-time alerts instead of recordings. |
| Small chain owner (3–10 outlets) | Wants a single dashboard across stores and would value cross-store anomaly patterns. |

## Jobs To Be Done

1. **Functional job** — Know within seconds that something suspicious is happening in the shop, from the existing CCTV install, without watching a live feed.
2. **Emotional job** — Stop feeling helpless about goods walking out of the shop; react to an alert instead of discovering a loss the next morning.
3. **Social job** — Be the shop owner whose neighbourhood hears "they caught someone" rather than "they lost stock again".

## Success Metrics

- **Detection:** ≥ 80% of true-positive suspicious events flagged within 10 seconds of occurrence during pilot.
- **False-positive rate:** ≤ 1 alert per camera per 8-hour shift that the shop owner marks "not suspicious" — every false alert is one closer to the owner muting the channel.
- **Activation:** ≥ 70% of onboarded shops have at least one rule enabled and at least one alert acknowledged within 14 days.
- **Retention:** ≥ 60% of activated shops are still subscribed after 3 monthly cycles.

## Pricing & Monetization

Two paths the source explicitly invites: subscription or pay-per-incident. Ship both. Cloud subscription at ₹1,499/month per camera (under the ₹1,500 ceiling the SMB can absorb) with a 14-day free trial; pay-per-incident at ₹49 per verified alert after the first 20 alerts/month are included. Self-host licence at ₹14,999 one-time per shop for owners who prefer on-prem and will run the Docker stack on a small NUC. The 1% equity ask from the source author is preserved as a documented relationship — handled by the founders, not by the product.

## Competitive Landscape

- **Generic CCTV NVR (Hikvision / Dahua iVMS)** — does record-and-store but does not analyse and does not alert on a phone channel the SMB uses; the source explicitly said recording alone has not solved the problem in 5 years.
- **Enterprise SOC vendors (e.g. STANLEY Security, Securitas remote video)** — built for multi-site enterprise customers; pricing floor and contract terms are out of reach for a single shop in India.
- **AI-camera startups with their own hardware** — require the owner to replace the existing cameras, which the source said is not what they want; pricing is typically bundled with hardware lease.
- **WhatsApp alert bridges (e.g. open-source frigate + n8n)** — technically possible but require the owner to wire up their own stack, which is precisely the audience the source says is being underserved.
- **Manual guard** — the alternative; the source said this is "too expensive" and the product is replacing it with software.

## Risks & Open Questions

- [ ] Validate that the WhatsApp Business API delivers alerts to Indian phone numbers within 5 seconds at the volumes a small chain would generate; rate limits and template approval are non-trivial and have bitten other SMB-alert products.
- [ ] Confirm the ONVIF / RTSP compatibility matrix covers the Hikvision, Dahua, CP Plus and TVT models that dominate Indian SMB installs; an "almost works" demo would be a worse outcome than a clear "your camera is not supported" message.
- [ ] Decide the false-positive learning loop's privacy posture: per-shop tuning is valuable but uploading "this alert was not suspicious" feedback can leak shop-layout information if not scoped carefully.
- [ ] Settle the equity conversation with the source author explicitly and early; the 1% ask is unusual and not something the product spec can resolve, but ignoring it is a worse failure than negotiating it.
