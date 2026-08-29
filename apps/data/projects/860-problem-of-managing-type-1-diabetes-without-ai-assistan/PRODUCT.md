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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A personal data companion for people with type 1 diabetes, focused first on Serbia, that lets the user import their own self-management data (CGM traces, pump history, food log, exercise log, manual notes) with their explicit consent, surfaces a personal observations surface of patterns in that data around meals, exercise and time of day, and exports a shareable summary the user can bring to their care team. The product stays explicitly on the personal-data-observation side of the medical-device boundary: it does not dose insulin, does not recommend doses, and does not replace clinical judgment. Every observation is traceable to the user's own data points, and every screen carries the non-medical-device and non-dosing disclaimers.

The product is deliberately scoped. It does not include a bolus calculator, does not integrate with an insulin pump for dosing, and does not generate clinical recommendations. What it does is give a person with T1D a personal observations surface they can bring to the next clinic visit, with the user's own data behind every claim.

**One-liner:** A personal data companion for people with type 1 diabetes, focused first on Serbia, that imports the user's own self-management data and surfaces a personal observations surface the user can bring to their care team — with explicit non-medical-device and non-dosing disclaimers on every screen and every export.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Adults with T1D in Serbia | Use a CGM and pump or pen and want a personal observations surface they can bring to the care team. |
| Parents and caregivers of children with T1D | Manage the child's data and want a structured way to bring observations to the next clinic visit. |
| Adolescents with T1D transitioning to self-management | Want a tool that helps them see patterns without telling them what to do. |
| Serbian endocrinologists and diabetes educators | Want patients to bring a written summary of personal observations rather than a stack of device screenshots. |
| Serbian T1D support groups and patient-association staff | Want a maintained, low-claim product to point members to. |
| Adults with T1D who travel frequently | Want a consistent personal observations surface to bring to a new care team in another country. |

## Jobs To Be Done

1. **Functional job** — Import my CGM, pump, food and exercise data into one place, with my explicit consent per source.
2. **Functional job** — Show me patterns in my own data around meals, exercise and time of day, traceable to the underlying data points.
3. **Functional job** — Export a shareable summary I can hand to my endocrinologist at the next visit.
4. **Functional job** — Keep my raw data on my device by default, with cloud sync as an explicit opt-in.
5. **Emotional job** — Stop feeling that the only synthesis of my numbers happens in a ten-minute clinic window.
6. **Social job** — Be able to walk into the clinic with a written personal observations summary and have a more focused conversation.

## Success Metrics

- **Import activation** — share of new user accounts that complete at least one HealthKit or Health Connect import within the first week.
- **Observation engagement** — share of generated observations the user opens and reads through, which is the proxy for whether the observations surface is trusted.
- **Export reuse** — share of users who export a shareable summary at least once, which is the proxy for whether the clinic-visit workflow is actually used.
- **Consent revocation rate** — share of users who revoke a previously granted import-source consent, since consent revocation is a positive signal that consent is being honoured.
- **Audit-log completeness** — share of imports, observations, exports and consent changes that appear in the audit log, which is a product honesty metric rather than a vanity one.
- **Disclaimer acknowledgement** — share of screens and exports for which both the non-medical-device and the non-dosing disclaimers were visibly rendered.

## Pricing & Monetization

The capture names no price, no tier and no business model; the only ground truth available is the title, the country and the category tags. What the architecture does fix is a cost shape: every active user consumes a per-import data ingestion, an on-device observation generation step, and an optional cloud-sync storage, while the regulatory-watch surface is a fixed cost across all users. A plausible paid shape is therefore a free tier with on-device-only usage and a paid tier with opt-in cloud sync, the shareable summary export and the audit log; the actual price is left as an open question because the source gives no number to quote, and a price band for Serbian and broader European users must reflect European personal-health-data purchasing power rather than a US default.

## Competitive Landscape

- **CGM- and pump-vendor apps** — abundant and well-designed, but device-scoped and not cross-source. The product competes on cross-source import and on the explicit non-medical-device positioning.
- **Manual logbooks and spreadsheets** — the incumbent for users without a CGM and pump, and a complement for users who want to add manual context. The product competes on cross-source import and on the on-device default.
- **Generic health-data dashboards** — flexible, but not T1D-specific and not designed for the personal-observations-and-clinic-visit workflow.
- **T1D community apps and patient-association tools** — useful for support and education, but typically not focused on the personal data-observation surface.

The capture names no competitor by name, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the regulatory classification for the day-one product with a Serbian medical-device lawyer and, if any EU expansion is in scope, with an EU MDR Software-as-a-Medical-Device advisor; the capture gives no legal sign-off.
- [ ] Establish the day-one HealthKit and Health Connect data sources, and the manual-entry schema for food, exercise and notes, given the capture names no specific source.
- [ ] Decide the wording policy for the personal observations surface, since wording that drifts toward clinical recommendation is a regulatory boundary crossing.
- [ ] Set the GDPR-compliant retention policy for imported health data, the cloud-sync encryption policy and the per-user data-deletion endpoint; the capture gives no data-retention rule.
- [ ] Determine the Serbian-versus-English UI policy for the day-one product, with input from a pilot user; the capture gives no language policy.
- [ ] Confirm the regulatory-watch surface sources (Serbian medical-device framework, EU MDR SaMD guidance, named regulator statements) so the operator has a documented basis for the boundary.
