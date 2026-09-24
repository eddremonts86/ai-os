# PRODUCT.md — Intent Based Infrastructure on Top of Terraform

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey everyone! I built a platform that works on top of Terraform to expose high level constructs you want to create in your infrastructure (intent) rather than actually dealing with cloud resources (typical terraform modules).<p>I am looking for other enthusiasts to work on this project, and gather feedback.<p>The problem I am trying to solve is complexity. Typically you make infra by either asking AI, or dealing with very low level resources that other people on your team might not fully understand. If you expose a higher level construct, people will only typically deal with a well understood graph of intent which is much easier to understand and reason about, without worrying about low level resources.<p>It works by declaring a model graph that consists of simple nodes like App, Region, Environment, Service, Server, etc that you show your intent with. E.g. My infrastructure consists of 3 AWS accounts (QA, Staging, Prod), with 2 Regions in each, and 1 Environment, under which my Service X resides.<p>The Octo library then converts those intent to actual cloud resources using your instructions. E.g. it would convert a Region node into a vpc + internet-gateway. Or an Environment into an ECS Cluster.<p>It will also generate the Terraform code for each of these cloud resources that your intent wanted.
You can then run this Terraform code normally and get your infrastructure.<p>There is a lot more depth, features, and roadmap items to this.
Happy to go in more detail.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49740408) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
