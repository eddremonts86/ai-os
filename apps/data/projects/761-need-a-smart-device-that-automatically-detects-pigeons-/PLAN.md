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

## Tech Stack

- **MCU:** ESP32-S3 (with vector instructions, enough for a small TFLite Micro model).
- **Sensing:**
 - PIR sensor (AM312 or equivalent) as a low-power wake trigger.
 - Low-resolution OV2640-class camera (VGA / QVGA), enabled only after PIR trigger.
 - Optional microphone for wing-beat / coo acoustic detection on the privacy-preserving SKU.
- **Detection model:** TFLite Micro bird-detection classifier, fine-tuned for pigeon silhouettes on balcony backgrounds; quantized int8 to fit the ESP32-S3 PSRAM.
- **Deterrent actuators:**
 - Piezo speaker driven by a small amp for variable-frequency ultrasonic (18–25 kHz) and predator-call audio.
 - 12 V solenoid + small diaphragm pump for a brief water spray (skipped on the no-water SKU).
 - High-brightness strobe LED (optional, behind a config flag for jurisdictions that restrict it).
- **Power:** 18650 Li-ion cell (3,000–3,500 mAh), TP4056-style charge management, 6 V / 1 W solar panel with a boost converter.
- **Enclosure:** IP65 ABS / polycarbonate with a UV-stable ASA front face; wall-rail mount bracket; French-language labelling.
- **Local UI:** single status LED (RGB) and a tactile button (cycle mode / test / reset).
- **No cloud.** All inference, logging, and adaptation run on-device; configuration via a Bluetooth LE phone app in v2.

## Architecture

The device is one tight loop: wake on PIR, snap a low-res frame, run the bird classifier, decide (pigeon / not-pigeon / unknown), apply the active deterrent profile, and log the event. The deterrent profile is a small state machine keyed by detection count in the last hour: low → ultrasonic only; medium → ultrasonic + predator call; high → ultrasonic + predator call + water spray. The device keeps a rolling 7-day histogram of detections and exposes it via the Bluetooth app so the user can see the roost pattern.

```
              ┌──────────────────────────┐
              │       PIR (always-on)     │
              └─────────────┬────────────┘
                            ▼
                  Camera power-on (1.5 s)
                            ▼
              ┌──────────────────────────┐
              │  TFLite Micro classifier │
              └─────────────┬────────────┘
                            ▼
       ┌────────────┬───────────────┬─────────────┐
       ▼            ▼               ▼             ▼
   no-bird      unknown          pigeon     escalation
   (idle)      (cooldown)       trigger     state machine
                                              │
                              ┌───────────────┼───────────────┐
                              ▼               ▼               ▼
                          ultrasonic    predator call    water spray
                                              │
                                              ▼
                                  Append to local event log
                                              │
                                              ▼
                          (BLE app reads the log on demand)
```

## Milestones

1. **M0 — Spec freeze + efficacy protocol.** Document the measurement protocol (7-day baseline → install → 30-day observation → ≥ 70% reduction target) before any hardware is built. End of week 1.
2. **M1 — Breadboard prototype.** ESP32-S3 dev kit + camera + PIR + piezo + battery; classifier running with a placeholder model; manual deterrent trigger via serial. End of week 3.
3. **M2 — Real classifier + adaptive state machine.** Train and quantize a pigeon classifier on a custom dataset; wire the escalation state machine; log events to flash. End of week 6.
4. **M3 — Enclosure + solar + IP65.** Industrial design v1; first 10 pilot units; CE / RED compliance review. End of week 9.
5. **M4 — Pilot program.** Install 20 units across the author's city (Lyon / Paris) plus 3 cafés; measure return-visits over 30 days; iterate on the deterrent mix. End of week 13.
6. **M5 — Production + DTC launch.** 100-unit production run; French-language product page; €299 / $299 price. End of week 17.

## Risks

- **Habituation remains the failure mode.** Even an adaptive system can be beaten by smart pigeons. Mitigation: log everything, ship at least two deterrent modes simultaneously, and add a fourth (compressed-air "boom") in the v1.1 SKU if the 30-day pilot shows regression.
- **BoM cost.** ESP32-S3 + camera + PIR + amp + pump + solar + 18650 + IP65 enclosure + assembly + warranty reserve — at $299 sale price the margin is thin. If the BoM exceeds $120, the unit must be redesigned (drop the water pump first, then the strobe).
- **Animal-welfare regulation in France / EU.** Ultrasonic and water spray are the lowest-risk stimuli; predator-call audio is borderline; strobe is restricted in some municipalities. Legal review must precede marketing.
- **Camera privacy optics.** A camera on a balcony reads as surveillance to neighbours. Ship the PIR + microphone SKU as the privacy-first variant and price it identically; let the user choose.
- **Solar in shaded installs.** North-facing balconies get little sun; the device must hit ≥ 2 weeks battery life with no solar input, or the user experience collapses in winter.
- **CE / RED timing.** Hardware compliance is the launch blocker; the project plan must reserve 6+ weeks for the notified-body process before the first paid ship.
