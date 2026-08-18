---
id: "3008"
slug: svbtle-nudges
title: Svbtle Nudges?
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338991"
category: ask-hn
date: "2026-08-17"
tags: [Ask HN, Problem]
---
# Svbtle Nudges?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** Paste a vendor email you cannot explain, get a one-screen dossier of who sent it, what likely triggered it, and how to mute it — without giving the tool your inbox.

The product is small on purpose. The user copies a "someone nudged you" or "your account has been inactive" email from their inbox, pastes it into the form, and within a few seconds sees a dossier: claimed sender (and whether it is a person, a product team, or automation), the trigger class (dormant-account, social-graph, marketing cadence, transactional anomaly), and the vendor's own preferences page when known. No account, no inbox access, no server-side processing of the email body. The value is collapsing a 30-minute detective exercise into 30 seconds.

## Target Users

| Stakeholder | Why they care |
|---|---|
| The OP (dormant-blog vendor-email recipient) | Wants to know if a real person nudged them or if it was automation, before deciding whether to ignore, engage, or unsubscribe |
| Power users with a "vendor audit" habit | Wants a faster triage than opening every marketing email and reading the footer |
| Privacy-focused developers | Wants to track who has their contact info and how it is being used, without giving any tool inbox access |

## Jobs To Be Done

1. **Functional job** — Identify who/what triggered an unexplained vendor email and find the right preferences page to mute that class of message.
2. **Emotional job** — Reduce the small, recurring discomfort of receiving emails whose origin you cannot verify.
3. **Social job** — Be able to say to a coworker or partner "I checked, it was just marketing automation" with evidence, instead of just dismissing it.

## Success Metrics

- **Time-to-dossier:** Median time from paste to rendered dossier is under five seconds for known vendor patterns.
- **Pattern coverage:** Directory covers at least 50 named phrasings across the top 20 SaaS vendors that send re-engagement emails at v1 launch.
- **Mute-action completion:** At least 40% of dossier views result in a click on the vendor preferences link or the "reply generator" copy button.
- **Local-history retention:** Median user revisits their own history at least twice in the first 30 days.

## Pricing & Monetization

Free in v1. The product runs on a single small server plus a curated directory, and does not have a monetization path beyond optional donations or a future "vendor dossier API" for power users.

## Competitive Landscape

Source gives no competitive signal in this thread. The closest existing tools are inbox-side services like Leave Me Alone or SaneBox that focus on unsubscribing, not on explaining a single message's origin. Comparing to those without source warrant would be invention.

## Risks & Open Questions

- **Liability for naming "the trigger."** A dossier that says "this is automation, ignore it" is a strong claim. Mitigation: dossier always frames findings as "likely" / "based on the directory," never as fact.
- **Directory drift.** Vendor phrasings change. Mitigation: ship a "report outdated" link per dossier so users flag stale entries.
- **Vendor pushback.** A tool that publicly calls out which teams send undisclosed nudges could draw cease-and-desist letters. Mitigation: keep the directory factual and source each entry from the public email itself.
- **The user might be wrong about it being unexplained.** Sometimes the trigger is obvious once surfaced. That is a feature, not a failure.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49338991) · **Category:** ask-hn · **Tags:** Ask HN,Problem
