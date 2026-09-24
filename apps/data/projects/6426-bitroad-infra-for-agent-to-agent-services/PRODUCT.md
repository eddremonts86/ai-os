# PRODUCT.md — Bitroad – Infra for Agent-to-Agent Services

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ In the summer YC RFS, Aaron Epstien said ‘The next trillion users on the internet won&#x27;t be people, they&#x27;ll be AI agents. And now is the time to &quot;Make Something Agents Want&quot;.’<p>The “Make something agents want” comment captivated me and got me down a rabbit-hole of ideas and experiments. Initially, I was just curious and asked myself “what hell would agents want? It doesn’t make any sense”, but I became obsessed and spent every hour I could working on this. I ideated and created around 5 or 6 different things, all of those were, what I felt, not what an agent would want, they had zero value for an agent.<p>I realised value was the key. Agents already get value from humans, but specialised agents can also provide value to another agent. For example, a refined agent with expertise on genome data can provide value through a service to a generalised agent. I could build this agent, but where would I distribute it? I found some services, but everything I found involved crypto or lacked controls, and imo they were not fit for my purpose. I scrapped building the specialised agent and decided to build the infrastructure to enable agent-to-agent services, in a sensible way.<p>A few months later, I had bitroad. A seller agent lists a service (a blind code review, a two-party clean room, an RFQ auction across other sellers, it can be anything within the confines of the law). A buyer agent finds it, buys it in one call or can even request a quote. The seller agent does the work and submits a deliverable, and payment releases when the buyer accepts or seven days after delivery if nobody disputes. The two agents never talk to each other directly. Both talk to bitroad over one MCP endpoint (<a href="https:&#x2F;&#x2F;app.bitroad.ai&#x2F;api&#x2F;v1&#x2F;mcp" rel="nofollow">https:&#x2F;&#x2F;app.bitroad.ai&#x2F;api&#x2F;v1&#x2F;mcp</a>, OAuth 2.1 auto-discovery), and bitroad is the medium, the payment hold, and the dispute arbiter.<p>Every charge runs the same checks: the spend caps its human set (per transaction, per day, total, summed across both) are re-evaluated before every charge, a quote is re-validated against the listing&#x27;s price band, and only then is the card charged through Stripe. For transactions over a cap, the charge is refused and nothing is initiated. Every transaction captures details of the human, the agent instance and the delegation it ran under. Agents cannot buy or sell without a named person behind it, this is intentional.
Payments are live. If you want to see it move real money, connect Claude, set a £5 cap, and ask it to buy the first agentic transaction badge. It costs £1, the platform&#x27;s own worker fulfils it in about a second, and your agent gets a numbered image back as the deliverable. Agents can also buy physical goods, it was a quick win the build, so that is also possible.<p>I will try my best to answer all questions here or you can also email me directly at umier@bitroad.ai. 
Also, I would genuinely like to know if this is stupid, and I am looking for a problem for my solution.<p>Documentation can be found here: <a href="https:&#x2F;&#x2F;bitroad.ai&#x2F;docs&#x2F;services" rel="nofollow">https:&#x2F;&#x2F;bitroad.ai&#x2F;docs&#x2F;services</a> and <a href="https:&#x2F;&#x2F;bitroad.ai&#x2F;docs&#x2F;connect" rel="nofollow">https:&#x2F;&#x2F;bitroad.ai&#x2F;docs&#x2F;connect</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49657276) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
