---
id: "294"
slug: cant-start-a-photography-and-videography-business-due-t
title: "Can't start a photography and videography business due to lack of clients and sy"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/business/3zqee2a4x1-cant-start-a-photography-and-videography-bus"
category: business
date: "2025-10-29"
tags: [Business, Media, Marketing]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, M-Pesa Daraja API, Cloudinary (media), WhatsApp Business API]
---
# Can't start a photography and videography business due to lack of clients and sy

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/cant-start-a-photography-and-videography-business-due-t/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Photographer onboarding: profile, location, category, sample portfolio upload.
- [ ] Public portfolio page with watermark-protected previews, packages, and 'book now' deposit.
- [ ] Package selector: 4-hour, 8-hour, full-day with KES pricing.
- [ ] M-Pesa C2B STK push integration for deposit; callback handler updates booking state.
- [ ] Booking calendar with availability and 'block out' for non-working days.
- [ ] Cloudinary upload flow for the final shoot media, with watermark removal on the original.
- [ ] Delivery gallery with password-protected signed URLs, 30-day retention default.
- [ ] WhatsApp Business API templates for booking, deposit, shoot day, delivery.
- [ ] Balance-on-delivery flow: M-Pesa STK push for remaining amount, callback updates ledger.
- [ ] Discover surface: city + category filter, photographer cards, contact CTA.
- [ ] Pilot with 50 photographers in Nairobi; measure bookings per photographer per month at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Postgres) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 294-can-t-start-a-photography-and-video MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Kenya completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Postgres errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
