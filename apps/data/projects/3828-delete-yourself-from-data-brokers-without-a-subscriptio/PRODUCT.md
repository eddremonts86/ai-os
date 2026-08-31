---
id: "3828"
slug: delete-yourself-from-data-brokers-without-a-subscriptio
title: Delete yourself from data brokers without a subscription
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493881"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Structured removal playbooks per broker, agent task instructions, request templates, verbose action logging, removal status dashboard, open-source repo distribution]
---
# Delete yourself from data brokers without a subscription

## Value Proposition

Do-it-yourself data removal without the subscription. The poster paid a service to get his phone, addresses and vehicles off the public internet and it didn't work; remove-your-data is the open-source answer — a repo that tells an AI agent exactly what to do, step by step, to remove personal information online. One commenter observed it does everything a paid service does and more, naming verbose logging, custom removal and a built-in dashboard.

**One-liner:** An open-source repo that tells your agent exactly what to do to remove your personal information online — no subscription.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Burned subscribers | People who paid a removal service and got no results (the poster's own position). |
| Privacy-minded individuals | Control over the process and visibility into every action via verbose logs. |
| Agent operators | A scripted workflow their AI agent can execute and re-run. |

The post's audience is anyone who has tried paid removal services and wants an alternative.

## Jobs To Be Done

1. **Functional job** — Get phone numbers, addresses and vehicles removed from data brokers without paying a subscription.
2. **Functional job** — Direct an AI agent through removal requests step by step.
3. **Functional job** — See exactly what happened: verbose logging of each action.
4. **Functional job** — Handle brokers not in the default list via custom removal.

## Success Metrics

- **Broker coverage:** the number of brokers with actionable removal playbooks.
- **Executions completed:** agent runs that end with requests submitted and logged.
- **Log completeness:** every action leaves a trace (the feature a commenter praised).
- **Self-serve rate:** users complete removals without the repo author's help — unstated by the post, so directional.

## Pricing & Monetization

None stated, by design: the repo is open source and free, positioned against paid services. No paid tier is mentioned.

## Competitive Landscape

The post positions the repo against the paid removal service the poster himself used — unnamed — and one commenter says it does everything a paid service does and more. No competitor is named by the poster; the product sits in the personal-data-removal category, differentiated by being open source, agent-executable and subscription-free.

## Risks & Open Questions

- [ ] To request removal you must hand the broker your data — a commenter notes it may end up "in some intern's mailbox" anyway.
- [ ] Broker forms and processes change constantly; playbooks rot unless maintained.
- [ ] The poster reports his paid service failed; the repo's own removal success rate is unstated.
- [ ] Agent execution of forms and emails is nondeterministic; errors compound across brokers.
- [ ] Open source and free means maintenance is volunteered, not funded.
