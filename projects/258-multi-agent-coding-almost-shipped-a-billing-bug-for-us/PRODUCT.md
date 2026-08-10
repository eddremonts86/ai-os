# PRODUCT.md — Multi agent coding almost shipped a billing bug for us

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;Small team, b2b saas. Our setup is a planner (opus 5 lately) that breaks a task into a plan, then composer 2.5 does the work&lt;/p&gt; &lt;p&gt;Last week we changed how invoices round. One agent wrote it, another agent signed off on it, both fully confident it was done&lt;/p&gt; &lt;p&gt;It was rounding per line item instead of on the total. At our volume that overcharges people a cent or two, over and over, and nobody notices a cent until support does&lt;/p&gt; &lt;p&gt;It only got stopped because everything runs a review gate before merge, coderabbit / bugbot on the diff, loop till clean. the part that stuck with me is that two agents agreed with each other and were both wrong. thats the failure mode i dont have a good answer for&lt;/p&gt; &lt;p&gt;So now nothing merges until that gate signs off, no matter how sure the agents sound. we&amp;#39;re b2b, id rather move slow than quietly overbill a customer&lt;/p&gt; &lt;p&gt;whats your safeguard for when the agents are confident and agree with each other and are still wrong?&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Potential_Orchid_590&quot;&gt; /u/Potential_Orchid_590 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SaaS/comments/1vjm66c/multi_agent_coding_almost_shipped_a_billing_bug/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SaaS/comments/1vjm66c/multi_agent_coding_almost_shipped_a_billing_bug/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| SaaS founders | _[What pain they feel]_
| _[How this solves it]_ |
| B2B teams | _[What pain they feel]_
| _[How this solves it]_ |
| Operators | _[What pain they feel]_
| _[How this solves it]_ |

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

_Source:_ [Reddit r/SaaS](https://www.reddit.com/r/SaaS/comments/1vjm66c/multi_agent_coding_almost_shipped_a_billing_bug/) · **Posted:** 2026-08-09T10:13:45+00:00
