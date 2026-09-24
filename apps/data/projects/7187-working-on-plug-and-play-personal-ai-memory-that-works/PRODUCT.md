# PRODUCT.md — Working on Plug and Play personal AI Memory that works across AI agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ So I&#x27;ve been working on a project (Make0 AI) for a long time where I wanted to give common context to both Codex and Claude Code. The problem is simple - while working on Claude and after exhausting the daily&#x2F;weekly limits I&#x27;ve start again from scratch in Codex. Of course I can prompt Claude to summarise a handoff that I can give to Codex but that is inefficient.<p>So I thought of a creating a common context for both of them locally using a simple list of instructions like a shared md file. But the problem was the file kept on growing and after some point the common context went beyond 20k tokens and was just inflating the token budget unnecessarily.<p>Then I implemented a RAG based retrieval approach on the list to only load what is required for that prompt and voila, after a few more iterations it resulted into a graph memory - Brain.<p>So this product Make0 AI gives you the ability to create Brains that you can connect to any Ai agent via MCP and then they immediately know your likes, dislikes, preferences etc. AI agents can read, write to this memory.<p>This can be your long term memory and the agents just become the token providers and task executors. You have full control over your data&#x2F;memories from a single place. Think of this as a &quot;USB thumb drive brain&quot; that you plug to any agent.<p>I know I may not be the first one to implement this but I tried to make the UX simple and is not at all developer focused. You can just drag and drop your memories&#x2F;data to the brain and even play around with a visual brain.<p>One more thing, i&#x27;ve done benchmarks on the memory. LoCoMo scores 83.3% overall, with Single hop 92.5% in standard mode (available now) and in another configuration (experimental max mode) it scores 92% overall and 94.4% in single hop. Available in the benchmark page.<p>I&#x27;m currently keeping this invite only. Do let me know if you folks wanna try it!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49713789) · **Category:** ask-hn · **Tags:** Ask HN,Problem
