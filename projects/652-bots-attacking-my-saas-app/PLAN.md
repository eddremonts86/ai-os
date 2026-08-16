---
id: "652"
slug: bots-attacking-my-saas-app
title: Bots attacking my SaaS App
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Cloudflare (Turnstile + WAF rules), Upstash for rate limiting, hCaptcha as escalation, a fingerprinting library (FingerprintJS or open-source), a logging layer (Axiom or ClickHouse) for attack-pattern visibility.

## Architecture

Edge (Cloudflare WAF + Turnstile) → app gateway (rate limit + fingerprint check) → signup/login (hCaptcha escalation) → audit log (Axiom). Per-endpoint risk classification drives which layers fire.

## Milestones

- [ ] Edge WAF + Turnstile for signup/login
- [ ] Per-endpoint rate limiting
- [ ] Fingerprint collection + cross-account correlation
- [ ] Escalation flow: invisible → interactive → block
- [ ] Audit dashboard (attacks by endpoint, false-positive rate)
- [ ] Recovery flow for blocked real users

## Risks

- Each technique degrades over time; need ongoing tuning.
- Vendor lock-in (Cloudflare, hCaptcha) on critical path.
- False positives damage product trust; under-instrument and you won't see them.
