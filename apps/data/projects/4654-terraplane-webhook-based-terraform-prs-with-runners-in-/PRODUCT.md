# PRODUCT.md — Terraplane: webhook-based Terraform PRs with runners in your network

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Terraplane lets you run Terraform from GitHub PRs against private networks without punching holes in firewalls.<p>I built Terraplane after running in to the same problem for years:<p>1: I don&#x27;t want the IaC pipeline to die when the server it&#x27;s running on does. An all-in-one box is a single point of failure.
2: I don&#x27;t want to bend my network around the tools I use. I&#x27;d prefer not to punch holes in firewalls or peer networks just so automation can reach what it&#x27;s managing
3: Cross-account IAM&#x2F;SA assumption isn&#x27;t the same as direct network access<p>A runner with cloud credentials can call a lot of APIs for sure. However many TF providers require direct access to the resource they&#x27;re managing and role assumption often doesn&#x27;t cut it.<p>Terraplane is designed to address this.<p>An orchestrator component runs somewhere you&#x27;re happy for public traffic to reach. Webhooks hit the runner and it queues jobs for execution.<p>Agents run inside your network and pull jobs from the orchestrator. They run TF plan&#x2F;apply locally, and return the output to the orchestrator.<p>Credentials for private services stay in the network they belong to.<p>Terraplane is roughly designed to be ready to write integrations for SCM providers other than GitHub. I haven&#x27;t done it yet, but it should be fairly trivial.<p>This is an early alpha. I use it for my org&#x27;s IaC pipeline and I&#x27;ve been happy with the results. I&#x27;m open to any and all feedback.<p>I built this for me, I hope it works for you.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Early adopters | _[What pain they feel, and how this solves it]_ |
| Founders | _[What pain they feel, and how this solves it]_ |
| SMEs | _[What pain they feel, and how this solves it]_ |

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49532920) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
