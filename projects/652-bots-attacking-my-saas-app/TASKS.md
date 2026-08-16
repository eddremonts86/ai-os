---
id: "652"
slug: bots-attacking-my-saas-app
title: Bots attacking my SaaS App
status: draft
source:
  name: manual
category: other
---
_Lúa generó este análisis automáticamente el 2026-08-15_

## Phase 1: Core

- [ ] Threat-model the app (signup, login, form posts)
- [ ] Add Cloudflare Turnstile to signup + login
- [ ] Upstash rate limiter per IP + per fingerprint
- [ ] hCaptcha escalation triggered by anomaly score
- [ ] Audit dashboard showing attacks by endpoint
- [ ] Manual-review queue for borderline signups
