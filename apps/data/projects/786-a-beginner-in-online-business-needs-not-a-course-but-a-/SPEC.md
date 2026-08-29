---
id: "786"
slug: a-beginner-in-online-business-needs-not-a-course-but-a-
title: "A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/h0x8gh7a71-a-beginner-in-online-business-needs-not"
category: ai
date: "2026-01-18"
tags: [AI, Business, Startups, Other]
country: USA
tech: [Remix, TypeScript, SQLite (better-sqlite3), Anthropic Claude API, Trigger.dev background jobs, PostHog analytics, Fly.io]
---
# A beginner in online business needs not a course, but a personalized AI guide that will create and lead them through an individual step-by-step plan.

## Problem

The poster is a beginner in online business who has decided that another course is not what they want. The title is unusually explicit about what they do want instead: not a course, but a personalised AI guide that creates and leads them through an individual step-by-step plan. The pain is the gap between generic education and the specific situation of one person — their time, their budget, their skill set, their idea — and the missing thing is a system that adapts to that situation rather than asking the beginner to map themselves onto a fixed curriculum.

The capture is a one-line ProblemHunt problem statement with the country USA as its only extra detail. The title carries the rest: the actor is a beginner, the pain is the inadequacy of the course model for that beginner, and the missing thing is a personalised AI guide that produces and walks through a plan. The poster names no niche, no budget and no prior skill, so we cannot claim the user has a SaaS idea or a side hustle or a freelance career in mind; what we can work from is the artefact the title asks for — a plan that is created for one person and led step by step rather than watched passively.

The implied hard parts are the plan itself and the discipline to follow it. A system that just generates a plan and dumps it on a beginner is the same problem as a course in a different shape; the value is in the conversation that follows — the AI checking what was tried, adjusting the next step when reality does not match the assumption, and keeping the beginner moving when the obvious next move is to do nothing. Trust is the other hard part, because the beginner has to believe the plan is theirs rather than a template.

## Objective

Ship a conversational AI guide that turns a beginner's situation — idea, time, budget, current skills, constraints — into a personalised step-by-step plan and then walks the beginner through it, one step at a time, adapting the next step from what the beginner reports. The capture is rich enough to fix the interaction model: the plan is generated, the plan is led, and the beginner is treated as a person with a specific situation rather than a viewer of a course.

## Target Users

- Beginners in online business who explicitly do not want another course and recognise the title's framing of personalised over generic.
- Beginners who have tried courses and dropped off, because the generic pacing did not match their time or their specific idea.
- Beginners with a concrete idea who need a plan tailored to that idea rather than a generic business-startup curriculum.
- Beginners with limited time per week who need a plan that fits a real schedule rather than a recommended one.
- Beginners who want an accountably check-in, so the AI notices when they stop and asks what got in the way.

## MVP Scope

- Conversational onboarding in plain language that captures the beginner's idea, time per week, available budget, current skills and any constraints, before any plan is generated.
- A personalised plan generated from that onboarding, with each step phrased as a single concrete action the beginner can do this week.
- Step-by-step pacing: after each step the beginner reports what happened, and the AI generates the next step from that report rather than from a fixed sequence.
- Persistent plan history in SQLite so the beginner can return days later and pick up where they left off without re-explaining themselves.
- Trigger.dev background jobs that summarise completed steps and surface a weekly review without blocking the chat loop.
- A daily check-in the beginner can opt into, prompting for a one-line update and adjusting the plan when the answer is consistently "no progress".
- PostHog analytics to track step completion, drop-off points and time-between-steps so the plan generator can be tuned against real beginner behaviour.
- Manual override so the beginner can rewrite any step in their own words; the AI continues from the rewritten step rather than the original.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The plan must be generated for one person at a time; no shared template may be presented as personalised, and any reused structure has to be acknowledged as such.
- The guide is conversational, not a video or a course; the artefact the beginner sees is a plan and a chat, not a curriculum index.
- The beginner's situation data is personal — idea, budget, location — and the system must keep it on a single small deployment rather than pushing it through a marketing-grade analytics pipeline.
- The AI cannot skip the planning step and jump straight to advice; the title names the plan as the artefact.
- The AI must not invent market sizes, customer counts or revenue projections the beginner did not supply; plans that need such numbers leave them blank for the beginner to fill in rather than fabricating them.
- The MVP is one beginner at a time on one deployment; multi-tenant coaching is not in scope.
- Each plan must adapt to what the beginner reports; a fixed sequence presented as personalised is the failure mode the title is rejecting.
