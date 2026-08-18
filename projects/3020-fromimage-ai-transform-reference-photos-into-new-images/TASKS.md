---
id: "3020"
slug: fromimage-ai-transform-reference-photos-into-new-images
title: FromImage AI – Transform reference photos into new images with controllable edits
status: enriched
source:
  name: manual
  url: "https://betalist.com/startups/fromimage-ai?utm_campaign=startup-182635&amp;utm_medium=atom&amp;utm_source=newsfeed"
category: beta
date: "2026-08-18"
tags: [BetaList, Beta, Product]
---
# FromImage AI – Transform reference photos into new images with controllable edits

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en `apps/`
- [ ] Inicializar repo git
- [ ] Copiar `edd-app-template` → `apps/3020-fromimage-ai-transform-reference-photos-into-new-images/`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar `tailwind.config.ts` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Implement user signup and login, a credit-balance display, and a pricing page that lists subscription tiers and one-time credit packs before any generation feature is wired.
- [ ] Build the Postgres schema for users, credit balances, generations, refund events, and subscription state with credit arithmetic that runs inside transactions so balance drift is impossible.
- [ ] Build the upload pipeline that accepts a reference image, validates format and size, stores it in S3-compatible storage with a signed-URL read scope per user, and returns a stable key the rest of the pipeline references.
- [ ] Build the model gateway with a `ModelAdapter` interface and ship one image-to-image adapter against a chosen third-party provider so the first generation can land end-to-end.
- [ ] Wire the Fastify `generate` endpoint to debit a credit, call the model gateway, persist the resulting image, and return a download URL — with a refund transaction if the model call fails or the moderation check blocks the output.
- [ ] Build the React app with a structured keep/modify prompt editor and a canvas-based mask view (Konva or Pixi) so the user can paint which regions to keep and which to modify.
- [ ] Implement the iteration view that shows source and latest generation side by side, the user's previous prompt, and a one-click "tighten this" affordance so the loop is genuinely controllable.
- [ ] Add the text-to-image tab that reuses the same credit and refund infrastructure and calls a second `ModelAdapter` so the user can create images from scratch without leaving the app.
- [ ] Implement the refund-on-failure policy explicitly: every failed or moderation-blocked generation writes a refund event to the user's history with a human-readable reason, and the credit balance is restored inside the same transaction.
- [ ] Ship an end-to-end demo: signup, buy a credit pack via Stripe test mode, upload a reference, run an image-to-image generation, iterate twice, and confirm the credit balance, refund behaviour, and history all match expectations.

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el 2026-08-18_
