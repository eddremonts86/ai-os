# PRODUCT.md — Talleyrand – Open-source AI thinking workspace built as a question tree

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I like to discuss complex topics with LLMs, but their linear chat is a bad place to think through hard questions. Every good answer raises three new questions. You ask one, then scroll back and forth to find the other two. Twenty messages in, you&#x27;ve forgotten some of the questions you wanted to dig into. You start a new chat and it forgets everything, so you have to re-read what you already know. And you can&#x27;t just click &quot;yeah, I know this, skip it&quot; or &quot;off topic&quot;.<p>I built Talleyrand (working at Sage, a nonprofit), which keeps your questions in a tree. You can branch out from any sentence in an answer. Every LLM prompt is built from the brief, the other threads, your highlights, your reactions and what you&#x27;ve read, so the answers are personalized to you. After each answer it suggests follow-ups and &quot;big-picture&quot; questions that challenge your framing. You can react to anything in one click (&quot;off-topic&quot;, &quot;already know this&quot;, &quot;interesting&quot;), and later prompts take the reactions into account.<p>Some details:
- Free, MIT. Sign in with Google, bring your own OpenAI key. If you want to use Claude, add an Anthropic key. Keys are stored in your browser only.
- Self-hostable with Docker. Stack: FastAPI and MongoDB on the backend, React and TypeScript on the front. The only setup work is Google OAuth credentials, which I know is annoying, but you can ask Claude to remove that if you need to.<p>Happy to iterate on your feedback and make it easier to use!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49646061) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
