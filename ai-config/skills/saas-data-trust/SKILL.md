---
name: saas-data-trust
description: Present data so it drives decisions and earns trust, instead of filling space — metric contracts, chart-format selection, freshness and provenance, and the no-duplication rule. Use when building or reviewing a dashboard, KPI card, report, analytics view or any metric display; when asked "is this dashboard useful", "our numbers look untrustworthy", "why does nobody act on this report", "add a chart here"; or when a screen shows numbers whose definition, unit or period is not visible.
---

# Data that earns trust

Data visualisation exists to shorten the distance between an observation and a decision. Anything that
does not shorten that distance is decoration.

## The metric contract

No metric ships without all of these. If one is unknown, that is the first finding.

| Element | Why |
| --- | --- |
| Understandable name | The customer's words, not the internal column name |
| Definition | What exactly is counted, and what is excluded |
| Unit | %, €, ms, rows, users — always visible |
| Period | "Last 7 days", not an unlabelled number |
| Source / provenance | When it affects whether the number is believed |
| Last updated | A timestamp, not an implication of freshness |
| Relevant comparison | vs previous period, vs target, vs cohort — with the base stated |
| Availability / quality state | Partial, estimated, degraded, stale |
| Next action on deviation | What the user does when the number is bad |

## Choose the right format

| Format | Use when |
| --- | --- |
| KPI | A summarised signal the user checks frequently |
| Table | Comparing multiple objects, or acting on them |
| Time series | Understanding evolution and spotting anomalies |
| Distribution | Understanding composition or concentration |
| Prioritised list | Deciding what to handle first |
| Explanatory sentence | A sentence communicates it better than a chart would |

## Avoid

- Charts with no axis, unit or period
- Decorative sparklines that cannot actually be read for trend
- Donuts with too many categories
- Rankings that do not explain the ranking criterion
- Percentages with no denominator
- Green/red arrows with no stated comparison base
- Stale data presented as current
- Vanity metrics unrelated to the customer's outcome
- Errors rendered as zero — a failed fetch is not `0`
- Estimates presented identically to observed data

## The no-duplication rule

> An additional representation must answer an additional question. If it does not, delete it.

Audit procedure: list every number visible on the screen, then list everywhere else that same number
appears. Each repetition must justify itself with a *different* question it answers.

## Trust checklist

- [ ] Every KPI has a definition reachable from the screen
- [ ] Every value has a unit
- [ ] Every comparison states its base
- [ ] Freshness is dated
- [ ] Source is visible where it matters
- [ ] Data quality or availability is indicated
- [ ] Errors are not rendered as zero
- [ ] Estimates are visually distinguished from observed data
- [ ] Sensitive actions leave an audit trail

## Progress and visible value

Activity is not value. Translate work into progress toward the outcome the customer bought.

Useful progress signals: percentage of *useful* setup completed · tasks remaining to reach a goal ·
items processed or resolved · risks eliminated · time saved · revenue/opportunity/coverage generated ·
quality improved · collaborators activated · change vs the previous period.

Rules: show progress toward a meaningful outcome, never toward "using more features" · explain how the
value is calculated · never inflate or use unverifiable estimates · celebrate real milestones, not
every click · connect progress to a concrete next action.

Worse: *"You have completed 7 actions."*
Better: *"You have reviewed 80% of critical items. 4 high-risk issues remain."*

## Confirmation layers and safety

Trust grows when the system protects the user without interrupting them needlessly.

| Situation | Correct response |
| --- | --- |
| Reversible, low risk | Execute, offer Undo |
| Hard to reverse | Ask for explicit confirmation |
| Destructive | State exactly what will be deleted, and the consequences |
| High cost | Show scope, cost and actor before confirming |
| Sensitive change | Leave an audit record |

A good confirmation answers: what will happen · which objects it affects · can it be reverted · who
will see it · is there a cost · what should the user do next.

Avoid: confirming every trivial action · generic "Are you sure?" modals · hiding consequences in
secondary text · closing a modal after an error and losing entered data · showing success before the
server confirms when no safe rollback exists.

## Related skills

`saas-expensive-ui` · `saas-ui-audit` · `saas-perceived-speed` · `dataviz` (chart craft and palettes).
