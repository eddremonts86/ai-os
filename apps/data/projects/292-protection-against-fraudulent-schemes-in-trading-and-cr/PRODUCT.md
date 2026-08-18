---
id: "292"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/finance/3ix68wvr71-protection-against-fraudulent-schemes-in-tra"
category: finance
date: "2025-10-29"
tags: [Finance, Security, AI]
country: Madagascar
tech: [Next.js 14, TypeScript, Postgres, Chainalysis / TRM Labs (txn risk), WhatsApp Business API, Orange Money / MVola payment APIs]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A Malagasy user forwards a suspect trading offer or pastes a payment reference and gets a clear, local-language risk verdict and a recovery pathway in under 60 seconds.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Malagasy first-time crypto/trading investor | Approached by a 'mentor' on WhatsApp; needs a sanity check before paying. |
| Malagasy mobile-money user | Has already paid into a suspect scheme and needs a clear path to report and recover. |
| Madagascar central bank / BCMM | Wants a consumer-side data source for early fraud signals without staffing a hotline. |

## Jobs To Be Done

1. **Functional job** — Pause a payment before it leaves Orange Money when the destination is suspect.
2. **Emotional job** — Stop the shame spiral after losing money to a scheme
3. **Social job** — Tell the family group chat 'don't pay, this is flagged' with evidence.

## Success Metrics

- Pre-payment check latency ≤ 60 seconds.
- User-reported prevented-loss amount (Ariary value) — tracked via self-report.
- Fraud-report-to-authority hand-off SLA — 95% within 24 hours.
- WhatsApp bot weekly active retention ≥ 50% after the first flagged scheme.

## Pricing & Monetization

Free for individual users. B2B tier: telcos, mobile-money operators, BCMM pay per fraud case escalated and per API call. Government/NGO partnerships: free, capped at agreed volume.

## Competitive Landscape

- Chainabuse / Etherscan address flagging — crypto-only, English-only, no local-language recovery path.
- BCMM consumer warnings — published after the loss, not at the moment of decision.
- Local radio / WhatsApp awareness campaigns — reach exists, individual triage does not.

## Risks & Open Questions

- [ ] False positives — a legitimate broker flagged as fraud damages trust. Mitigation: confidence-scored verdicts; 'medium risk' = warning, not block; partner legal clinic reviews high-confidence blocks weekly.
- [ ] Whistleblower risk to the schemes — flagged schemes retaliate. Mitigation: pseudonymised user IDs in the database; only legal-aid partner sees the full identity.
- [ ] Local authority capacity — a flood of reports the BCMM cannot process backfires. Mitigation: tiered routing; only high-confidence cases go to authority, the rest to the legal-aid clinic.

---

_Source:_ [manual](https://problemhunt.pro/en/finance/3ix68wvr71-protection-against-fraudulent-schemes-in-tra) · **Category:** finance · **Tags:** Finance, Security, AI
