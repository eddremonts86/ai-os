---
id: "809"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-pa
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev"
  captured: "2026-01-03"
category: startups
date: "2026-01-03"
tags: [Startups, Research, Other]
country: Russia
tech: [SvelteKit, TypeScript, PostgreSQL with row-level security, Drizzle ORM, Rust screening-verifier service, Calendly integration for booking, Resend for transactional email, Plausible for privacy-respecting analytics, Coolify]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations + Stripe Connect platform application
- [ ] Bilingual i18next setup (Russian + English)
- [ ] Respondent identity verification flow (phone or email + reference)
- [ ] First 50 vetted respondents onboarded (initial screening interview per respondent)

## Phase 1: Core

- [ ] Model the screener, the participant declaration, the match event, the booking event, the interview-completion record, and the escrow-release event in PostgreSQL with Drizzle and row-level security.
- [ ] Build the team-facing screener builder: persona fields, three to five screener questions, the persona-fields contract the team agrees to.
- [ ] Build the participant-facing sign-up with verified email or phone, persona-field declaration, and the screener-question answer surface.
- [ ] Implement the Rust screening-verifier service: persona-field validation, match signal (in-scope, out-of-scope, partial), row-level-security-respecting storage.
- [ ] Build the team-facing match view: matched participants with their persona fields and screener answers, the screening record the team reads.
- [ ] Wire the Calendly integration for the booking invite that goes to the participant; keep the platform's booking flow separate from the team's scheduling tool.
- [ ] Implement the escrow-hold path on the team side, with the release gated on the team's interview-completion record.
- [ ] Implement the no-show policy: a no-show releases no payment, the team is not charged, the booking is recorded as a no-show.
- [ ] Build the post-interview ratings view: per-team rating, low-rating-participant drop from the recommended pool, the recalibration dashboard.
- [ ] Surface the calibration dashboard on the team-facing surface: match-to-interview rate, interview-completion record coverage, per-team repeat rate, pool diversity.
- [ ] Add the documented escalation path for a team that disputes a participant's persona fields or screener answers.
- [ ] Add the per-interview cost monitoring as a calibration metric, with the cost-shape reviewed when pool diversity degrades.
- [ ] Wire Russian and English copy throughout team, participant and admin surfaces; keep other languages out of scope at MVP.
- [ ] Add the regulatory-confirmation milestone before live interviews: Russian personal-data rules, EU GDPR where applicable, payment-processor licensing.
- [ ] Run an end-to-end test: a team posts a screener, three participants match and submit screener answers, the team picks one, the booking invite goes out, the interview is recorded as completed, escrow releases on the record, the participant's per-team rating updates, and the pool-diversity metric reflects the new participant.

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Per-respondent pattern detector (answer text similarity, completion-time anomalies)
- [ ] Manual review queue for flagged consistency scores
- [ ] Per-persona payout floor adjusted quarterly
- [ ] Per-screener quality rubric review queue (first-100 screeners)
- [ ] Post-mortem at week 14: did the consistency check actually filter out professional-respondent noise?
