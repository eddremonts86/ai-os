---
id: "851"
slug: problem-of-finding-a-workout-partner-in-a-new-gym
title: Problem of finding a workout partner in a new gym
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/59adku49n1-problem-of-finding-a-workout-partner-in"
category: fitness
date: "2025-11-08"
tags: [Fitness, Other]
country: India
tech: [Flutter, Dart, Supabase (PostgreSQL with row-level security), Supabase Auth, PostgreSQL with PostGIS for gym-radius queries, FCM for push notifications, WhatsApp Business API for India-region notifications, Coolify]
---
# Problem of finding a workout partner in a new gym

## Tech Stack

- **Flutter with Dart** for the cross-platform mobile surface, since the member meets the platform on a phone at the gym and Flutter keeps the iOS and Android surfaces consistent.
- **Supabase (PostgreSQL with row-level security)** for members, gyms, profiles, matches, introductions, and partnership confirmations — relational because every introduction joins to a member, a gym, a match and a partnership confirmation.
- **Supabase Auth** for the per-member identity layer, with phone-number sign-up since the source country is India and phone-based sign-up is the lowest friction there.
- **PostgreSQL with PostGIS** for the per-gym radius queries the per-gym verification path depends on, so a member's gym declaration is a spatial check rather than a free-text field.
- **FCM** for the introduction-arrival and partnership-confirmation notifications on Android, with the same path on iOS via APNs.
- **WhatsApp Business API** for India-region notifications where the member prefers WhatsApp over in-app notifications.
- **Docker** for local and staging runs of the back-end surface, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The platform has three surfaces — a member-facing surface, a gym-facing surface, and an admin surface — and one matching model underneath. The matching model carries the member, the gym verification, the four-field profile (time-of-day, equipment, intensity, goal), the match event, the introduction thread, and the partnership confirmation.

The member-facing surface is the workout-profile declaration, the match view, the short-introduction thread, and the partnership confirmation. The member joins the platform through phone-based sign-up, declares the gym they attend, confirms the gym through a one-time code the gym issues or a gym-side sign-up flow, and declares the four-field profile. The match surface filters other verified members at the same gym whose profile overlaps on at least three of the four fields; the member sees the overlap field-by-field before sending a short introduction.

The short-introduction thread keeps the platform as the channel for the first message. The introduction carries no phone number, address, email or any contact field; the platform is the channel. If both members confirm the introduction, the contact handoff happens inside the platform through a chat thread that does not surface phone numbers or addresses. The platform never publishes a member's contact information in a way the partner can copy.

The gym-facing surface is a small read-only dashboard for gyms that opt in. The dashboard shows the gym-side pair-formation rate (share of verified members at the gym who have a confirmed partner), the introduction volume, and the block-and-report count. The dashboard is read-only and does not surface individual member profiles. The gym sees the social signal, not the social data.

The matching path runs inside PostgreSQL with row-level security. The match query joins on gym_id and filters on the four-field overlap: a member at a different gym is filtered out at the database layer, not in application code that can be bypassed. The match is recomputed on every profile change and on a stated cadence so the surfaced set stays current.

The introduction thread is the trust surface. A member can block and report at any point in the thread; the report is recorded with the introduction ID and is reviewed. A reported introduction is closed and the partner's pair-formation rate reflects the closure. The platform documents the safety surface on every page.

The platform does not share member contact information outside the platform. The contact handoff is a chat thread inside the platform, with the partner's identity verified through the gym-side one-time code. The boundary with dating surfaces is documented on every page and enforced with a block-and-report path that the member can reach from inside the first message.

## Milestones

1. **M1 — Member sign-up and gym verification** — phone-based sign-up via Supabase Auth, the per-gym verification path, the one-time code integration.
2. **M2 — Workout-profile model** — the four-field profile schema, the per-field declarations, the profile-edit flow.
3. **M3 — Matching** — the per-gym match query, the three-of-four-field overlap rule, the surfaced match list with the overlap visible.
4. **M4 — Short-introduction thread** — the in-platform first message, the contact-handoff-only-on-confirmation path, the chat thread.
5. **M5 — Partnership confirmation** — the per-member partnership-confirmation field, the introduction-to-partnership rate metric.
6. **M6 — Gym-side opt-in and dashboard** — the gym-side verification, the gym-side dashboard, the pair-formation rate read.
7. **M7 — Safety surface** — the block-and-report path, the misuse review queue, the documented escalation path.
8. **M8 — Hindi and English copy** — both languages on member, gym, and admin surfaces.
9. **M9 — Regulatory confirmation** — sign-off on Indian personal-data and platform-liability rules before launch.

## Risks

- **Per-gym verification erosion** — a member self-declares a gym without the gym-side code, and the per-gym guarantee weakens. Mitigation: the gym-side code is mandatory for verified status; a member without a code experiences an honest "unverified" state and cannot be matched.
- **Four-field overlap drift** — two reviewers disagree on whether a surfaced match overlaps on three fields. Mitigation: the overlap rubric is documented; a labelled-sample evaluation measures inter-reviewer agreement.
- **First-message contact leak** — a member shares a phone number in the introduction text. Mitigation: phone-number detection at the message layer flags the message, with the platform suggesting the member keep the contact inside the platform.
- **Misuse report delay** — a member reports misuse after a partnership confirmation and the report arrives too late. Mitigation: the block-and-report path is reachable from inside the first message, before the partnership confirmation.
- **Gym-side non-participation** — most gyms do not issue one-time codes, and the per-gym verification path is thin. Mitigation: a minimum-viable-coverage gate per city before claiming the city is in scope.
- **Pool convergence on one profile** — most members in a gym declare similar profiles, and the match surface is empty. Mitigation: the surfaced match list shows the overlap field-by-field so the member can see whether the pool is genuinely thin or the profile declaration is too narrow.
- **Regulatory gate** — Indian personal-data and platform-liability rules can block the launch. Mitigation: regulatory review is its own milestone before launch, not a launch-day scramble.
