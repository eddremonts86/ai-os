---
id: "775"
slug: constantly-forgetting-minor-tasks-due-to-the-impulsive-
title: Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/productivity/6hmyvb2mk1-constantly-forgetting-minor-tasks-due-to"
category: productivity
date: "2026-01-24"
tags: [Productivity, Psychology, Other]
country: USA
tech: [Swift, SwiftUI, Core Data, ActivityKit, HealthKit, CloudKit]
---
# Constantly forgetting minor tasks due to the impulsive habit of «swiping» reminders away. Needs a tool that breaks this behavioral pattern.

## Tech Stack

- **Swift** as the implementation language, because the tool is iOS-first (the swipe gesture is a platform-native reflex on iOS in particular) and Swift is the path to the platform's notification surface.
- **SwiftUI** as the UI framework, because SwiftUI's declarative structure matches the engagement-step surface and supports the per-reminder theme variation cleanly.
- **Core Data** as the on-device store, because the reminder list, the dismissal log, and the engagement-choice records are persistent local data and Core Data is the right shape for iOS-first local persistence.
- **ActivityKit** for live activities and lock-screen integration, because the platform's notification surface is what the user dismisses and the tool's structural change needs to reach the lock screen too.
- **HealthKit** is not in scope; it is named here only to confirm the platform does not import from or write to HealthKit, because doing so would imply a wellness framing the user did not ask for.
- **CloudKit** for opt-in cross-device sync of the user's reminder list, so the user can switch between iPhone and iPad without losing the dismissal log; the local-first default means CloudKit is opt-in, not the storage path.

## Architecture

The reminder capture is a single screen: title, optional deadline, optional context text. Each reminder is stored as a Core Data row with the engagement choices and the user's selection history on the row. The presentation surface is the iOS reminder surface — notifications, lock-screen widgets, and Dynamic Island / live activity when the platform supports it. The dismissal path does not include any swipe-to-dismiss gesture. The user taps the notification and lands on the engagement surface; the only way out is one of the four engagement choices.

The four choices are: 'I have done this', 'I will do this in X minutes', 'I no longer need this reminder', and 'remind me again at a chosen time'. The first clears the task; the second defers with a user-stated duration; the third retires the reminder with a reason code; the fourth sets a follow-up. Every choice is recorded against the row, with timestamp, so the dismissal log is the user's behavioural record. The dismissal-pattern view aggregates over a configurable window, by choice, by reminder type, and by hour of day.

The per-reminder theme variation is a structural defence against the user learning one dismissal path for every reminder. Repetitive reminders get one engagement surface; one-off reminders get another; reminders the user has dismissed twice today get a third. The variation is keyed off the row's state and history, not off a random generator, so the user does not experience the variation as noise.

The dismissal log is local-first by default. CloudKit sync is opt-in and only enabled when the user explicitly enables cross-device sync in settings, so the user's behavioural record does not leave the device unless the user has chosen to. The export is plain text (one reminder per line with date and engagement choice) and is available without a paid tier.

## Milestones

1. **M1 — Reminder capture and storage** — SwiftUI capture screen; Core Data row with deadline and optional context; reminder list view.
2. **M2 — Notification and lock-screen surface** — Notifications, lock-screen widgets, and live activities; presentation surface reaches the user without a swipe-only dismiss path.
3. **M3 — Engagement screen** — The four engagement choices; per-choice recording; the only dismissal path is through the engagement screen.
4. **M4 — Defer and follow-up** — User-stated defer durations; 'remind me again at a chosen time' follow-up state.
5. **M5 — Dismissal-pattern view** — Aggregations by choice, by reminder type, by hour of day, over a configurable window; daily mirror in under two minutes.
6. **M6 — Per-reminder theme variation** — Repetitive, one-off, and recurrently-dismissed reminders get distinct engagement surfaces keyed off the row's state and history.
7. **M7 — Local-first and export** — Local-first default; CloudKit opt-in cross-device sync; plain-text export without a paid tier.

## Risks

- **Single-gesture drift** — if the engagement surface converges to one gesture, the user learns that gesture and the new reflex replaces the old swipe.
- **Friction calibration** — too-low friction becomes the new reflex; too-high friction drives abandonment. The level is a per-user measurement, not a constant.
- **Mirror honesty** — a dismissal-pattern view that frames the user's behaviour flatteringly is unfit; the mirror has to show the swipe-equivalent rate.
- **Streak framing risk** — gamifying the engagement path can produce goal-confusion (the user treats the streak as the value rather than the engagement). The streak has to reinforce engagement, not optimise for daily-active.
- **Data portability** — locking the behavioural log behind a paywall or a cloud-only setting is unfit; the export has to be plain text without a tier gate.
- **Cognitive accessibility** — a user under load finds the engagement step too effortful in the moment; the tool must not become a barrier to the user's own tasks.
- **Notification fatigue shift** — a tool that makes engagement heavier can produce more notifications, not fewer, in the user's first weeks; the data has to inform an honest read-out.
- **CloudKit opt-in clarity** — a user who does not realise cross-device sync is opt-in may believe their data is cloud-stored, which the design must avoid.
