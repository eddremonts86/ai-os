# PRODUCT.md — Litelink – local-first, embedded stream capture into Iceberg tables

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN! I just wanted to share litelink a local-first, embedded capture library I built in python (code is heavily AI generated but designed and reviewed by yours truly). I&#x27;ve been using this for point-and-shoot WebSocket capture but I imagine it could also be useful for observability&#x2F;metrics ingestion as well. Litelink supports a single writer per stream.<p>I&#x27;ve been doing a lot of development and deployments on tiny VMs (2 vCPU, 8GB, 50-100GB disk) and didn&#x27;t want the complexity or cost of managing central brokers (Kafka), databases (Postgres), and CDC&#x2F;connectors just to get queryable WebSocket stream capture running.<p>With litelink, you configure a log in code, and end-to-end setup takes &lt;5 minutes (see the example scripts in the repo). The log is itself an Iceberg table (actually two: a local and archive table), so there&#x27;s no second copy of your data to keep in sync or connector to manage.<p>I&#x27;m sure there are still bugs, but I recently migrated all the capture feeds for a personal research project to litelink, and the experience has been night and day. Before that, I&#x27;d hand-rolled a capture system and was dealing with all the issues you&#x27;d expect (e.g. small file problem). I&#x27;ll post some before&#x2F;after stats in a comment below.<p>I tried to channel the same ethos as LanceDB&#x2F;Iceberg&#x2F;SQLite. Everything runs local first without a network connection required. I&#x27;ve tried to abstract the complexity of stream&#x2F;data lifecycle maintenance away behind a few public library methods. Hopefully someone else finds this useful! Let me know what you think.<p>repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink</a><p>spec: <a href="https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink&#x2F;blob&#x2F;main&#x2F;docs&#x2F;SPEC.md" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;nhobin219&#x2F;litelink&#x2F;blob&#x2F;main&#x2F;docs&#x2F;SPEC.md</a><p>pypi: `pip install litelink`

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49549760) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
