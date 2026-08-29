---
id: "860"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/45u31o0b41-problem-of-managing-type-1-diabetes-with"
category: health
date: "2025-10-30"
tags: [Health, Food, AI, Other]
country: Serbia
tech: [React Native (Expo), TypeScript, FastAPI (Python), PostgreSQL, TimescaleDB (optional time-series extension), DuckDB (on-device analytics), Apple HealthKit, Google Health Connect, Coolify, Docker]
---
# Problem of managing type 1 diabetes without AI assistance

## Problem

The capture is a category-level problem statement from ProblemHunt: the `## Problem` body carries only the country name Serbia, and the title — "Problem of managing type 1 diabetes without AI assistance" — is the entire problem statement. Nothing else in the capture adds detail: no description, no quoted persona, no insulin regimen named, no CGM or pump brand cited, no clinical threshold stated, no care team referenced. The honest ground truth is therefore the title plus the `Health, Food, AI, Other` tags plus the country.

The problem the title names is real and recurring for people with type 1 diabetes, in Serbia and elsewhere: a person living with T1D makes dozens of self-management decisions every day — what to eat, when to eat, how much insulin to take, when to check glucose, how to interpret a CGM trace, how to respond to an unexpected high or low — without an AI assist that can summarise the patterns in their own data and surface them back as observations the person and their care team can act on. Existing T1D tools are predominantly manual logbooks or device-specific viewers; the friction is not that no data exists, it is that the data sits in different silos (a CGM app, a pump history, a food log, an exercise log, a paper notebook) and the person has to do the synthesis by hand.

The product implication, without inventing specifics, is that a person with T1D needs a way to bring their own self-management data into one place, with their explicit consent, and receive a personal observations surface — patterns in glucose around meals, around exercise, around time of day — that they can bring to their care team, without the product itself taking on any clinical decision-making role. The MVP is a personal data companion; it is not a medical device, it is not a dosing assistant, and it does not replace the care team's judgment. The capture does not name the regulatory classification, and the honest treatment is to name that as a constraint and an open question rather than to assert one — insulin-adjacent software can sit on either side of the medical-device boundary depending on what it claims to do, and an MVP that explicitly stays on the data-observation side of that boundary is the safest first move. Country-specific facts the capture does not state — the current Serbian medical-device regulatory framework for software, the Serbian Health Insurance Fund (RFZO) reimbursement rules for CGM and pump hardware, the Serbian-language versus English-language UI expectation, or the specific Apple HealthKit and Google Health Connect data sources available on the Serbian app stores — are flagged as open questions rather than asserted.

## Objective

Ship a personal data companion for people with type 1 diabetes, focused first on Serbia, that lets the user import their own self-management data (CGM traces, pump history, food log, exercise log, manual notes) with their explicit consent, surfaces a personal observations surface of patterns in that data (around meals, exercise, time of day), and exports a shareable summary the user can bring to their care team. The product must stay explicitly on the personal-data-observation side of the medical-device boundary: it does not dose insulin, it does not recommend doses, it does not provide medical advice, and it does not replace the care team's judgment. Every observation must be traceable to the user's own data, every claim must be framed as a personal observation the user and the care team can discuss, and the regulatory classification must be named as an open question the operator commits to revisiting before any claim beyond observation is added.

## Target Users

- Adults with type 1 diabetes in Serbia who use a CGM and a pump or pen, and who want a personal observations surface they can bring to their care team.
- Parents and caregivers of children with type 1 diabetes in Serbia, who manage the data on the child's behalf and want a structured way to bring observations to the next clinic visit.
- Adolescents with type 1 diabetes in Serbia transitioning to self-management, who want a tool that helps them see patterns without telling them what to do.
- Serbian endocrinologists and diabetes educators who want their patients to bring a written summary of personal observations to the consultation rather than a stack of device screenshots.
- Serbian T1D support groups and patient-association staff who advise members on self-management tools and want a maintained, low-claim product to point them to.
- Adults with T1D who travel frequently and want to bring a consistent personal observations surface to a new care team in another country.

## MVP Scope

- A mobile app (React Native via Expo) that imports the user's self-management data with explicit per-source consent, with Apple HealthKit and Google Health Connect as the day-one sources, plus a manual entry path for food, exercise and notes when no device is connected.
- A personal observations surface that surfaces patterns in the imported data — glucose around meals, glucose around exercise, time-of-day patterns — rendered as observations traceable to the underlying data points the user can tap through.
- A shareable summary export that assembles the user's chosen observations into a PDF the user can hand to the endocrinologist at the next visit, with the user's explicit consent per export.
- An explicit non-medical-device disclaimer on every screen and every export, naming that the product is a personal data companion and that all decisions remain with the user and their care team.
- An explicit non-dosing disclaimer on every observation, naming that the product does not recommend insulin doses, does not recommend food choices and does not replace clinical judgment.
- An on-device analytics layer (DuckDB) that runs the observations over the user's local data export so the raw data does not have to leave the device by default.
- An opt-in cloud-sync path that encrypts the data at rest, with a documented retention policy and a clear per-user data-deletion endpoint.
- An audit log of every import, every observation generated, every export and every consent change, with the data version referenced.
- A regulatory-watch surface on the operator side that tracks the Serbian medical-device framework, the EU MDR Software-as-a-Medical-Device classification for insulin-adjacent software, and any named guidance that affects the product's claims, with a stated policy that any new claim beyond observation triggers a regulatory review before shipping.
- An operator-facing content-review surface that ensures every observation wording stays on the personal-observation side of the medical-device boundary.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The product is a personal data companion only; it does not dose insulin, does not recommend insulin doses, does not recommend food choices, does not provide medical advice, and does not replace the care team's judgment, and the disclaimers must be visible on every screen and every export.
- The regulatory classification of insulin-adjacent software varies by jurisdiction and by claim; the product must stay explicitly on the personal-data-observation side of the medical-device boundary, and any new claim beyond observation must trigger a regulatory review before shipping.
- Every observation must be traceable to the user's own data points; an observation that cannot be traced is a fabrication and is a release blocker.
- The product must not generate copy that an endocrinologist could mistake for a clinical recommendation; the wording policy must be enforced in product copy and in the operator content-review surface.
- The default data path is on-device (DuckDB over a local export) so the user's raw data does not have to leave the device; cloud sync is opt-in, encrypted at rest, and deletable on the user's request.
- Personal health data imported into the app is sensitive under GDPR, under Serbian personal-data law and under any health-data regulation in the user's jurisdiction; a documented retention policy and a clear per-user data-deletion endpoint must exist before any pilot user is onboarded.
- The capture names Serbia, and the day-one language policy must respect Serbian-language and English-language expectations rather than defaulting to one; the exact language policy is left as an open question to be confirmed with a pilot user.
- The MVP does not include a dosing engine, a bolus calculator, an insulin-pump integration or a CGM-closed-loop claim; each is a separate product decision that would require its own regulatory review.
