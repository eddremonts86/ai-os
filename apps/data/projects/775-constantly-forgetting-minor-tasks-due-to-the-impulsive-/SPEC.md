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

## Problem

The poster constantly forgets minor tasks because of the impulsive habit of 'swiping' reminders away, and needs a tool that breaks the behavioural pattern. The ProblemHunt capture is the title plus the country USA and the tags Productivity, Psychology, Other; nothing further — so the actor is a habitual reminder-swiper, the symptom is the swipe, and the missing piece is a tool that breaks the pattern rather than repeating the gesture the user has already learned to dismiss.

The implied problem is not the reminders, it is the gesture. A standard reminder is delivered, the user dismisses it with a swipe, the user forgets the underlying task. The pattern is the issue: the swipe gesture has become a meaning-free reflex that cancels the reminder without engaging the task. A tool that breaks the pattern cannot use the same gesture as the dismissal, and cannot simply add 'please don't swipe' — the swipe is faster than the decision. The missing piece is a reminder surface where dismissal requires engagement that the swipe gesture does not provide.

The 'Psychology' tag is the strongest signal that the post treats this as a behavioural-design problem, not a notification-volume problem. Beyond the title the source names no specific task type, no productivity app currently in use, no swipe volume, and no time-of-day pattern. The plan reasons from the actor (habitual reminder-swiper), the gesture (the swipe that cancels without engaging), and the missing piece (a tool that breaks the pattern), without inventing a persona's profession, a notification volume, or a trigger time.

## Objective

Ship a reminder tool whose dismissal path requires an engagement step the swipe gesture cannot perform, so the user cannot dismiss a reminder without first acknowledging the underlying task. The tool surfaces minor tasks in a way that the user's habitual swipe path cannot clear without effort, and tracks the dismissal pattern to show the user what their own behaviour has been.

## Target Users

- A habitual reminder-swiper who has noticed the swipe and wants a tool that makes dismissal cost attention the swipe cannot fake.
- A user on a daily-tasks reminder surface who keeps losing minor tasks to reflex dismissal and wants a reminder surface that engages them, rather than repeating the dismissed gesture.
- A user who has tried lowering reminder volume and found the swipe reflex still wipes the ones that arrive, because the volume was not the structural problem.
- A user who wants a behavioural mirror — a tool that shows, honestly, how often the user has been swiping reminders away without engaging the task behind them.
- A user whose cognitive style has them dismiss small reminders without thinking and then rediscover the same task hours later.

## MVP Scope

- A reminder capture surface that accepts a small task with a deadline (or no deadline) and stores it as a row in the user's local reminder list.
- A presentation surface for active reminders that does not use a swipe-right-to-dismiss gesture anywhere in the dismissal path.
- A dismissal path that requires engagement with the underlying task: a short answer ('I have done this', 'I will do this in X minutes', 'I no longer need this reminder'), each one typed or tapped with intent.
- A deferred-dismissal path that asks the user how long until the next presentation, rather than letting the user cancel the reminder and the task together.
- A dismissal-pattern view that aggregates, over a configurable window, how often the user dismissed reminders with each engagement choice, and how often the user's 'swipe' would have dismissed the reminder reflexively.
- A streak view that rewards engagement (not dismissal speed), so the motivation surface is on the side of the behaviour the tool is trying to encourage.
- A privacy surface that explains what is stored on device, what is synced, and what is removed when the user uninstalls.
- A per-reminder theme that varies the engagement step between repetitive and one-off reminders, so the user does not adapt to a single engagement gesture the way they adapted to the swipe.
- A motion journal that logs engagement and dismissal timing locally and surfaces a daily mirror the user can read in two minutes.
- A export of the dismissal log as plain text without a paid tier.

## Design Direction

See DESIGN.md for this project's design tokens.

## Constraints

- The capture is one sentence plus the country USA and three tags; nothing beyond that is invented here, including profession, current productivity app, swipe volume, or trigger times.
- The reminder cannot be silently dropped: every active reminder must end in one of the four engagement choices the dismissal path surfaces, never in a reflexive swipe.
- The engagement step has to be friction the swipe cannot fake but not so much friction that the user abandons the tool. The level of friction is a design variable the team has to measure.
- Per-reminder theme variation is a structural defence against the user learning a single dismissal gesture and dismissing all reminders the same way they dismissed the first.
- The dismissal-pattern view has to be honest: if the user has been swiping, the tool shows the user has been swiping, not a flattering summary.
- Behavioural-design tools that operate on user attention carry a responsibility to not be manipulative; the tool's reward surfaces have to reinforce engagement and not optimise for daily-active metrics at the cost of the user's actual task completion.
- Local-first storage is the design default for behavioural data; the data is the user's, and a tool that leaks the dismissal log is unfit by definition.
