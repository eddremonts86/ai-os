# PRODUCT.md — ReviewAssist-Uses coding session to fix code and guided PR walkthrough

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We are a three person team and one thing that we cannot afford to do is spend too much time on the PR. While there are review tools around it to help in the process, all of them start from the diff and the other problem is all of them cost money.<p>So, I build an MCP server which resides in every developer claude session. The MCP server spawns couple of sub agents: Author and Reviewer<p>Author holds the chat session without the code and the Reviewer holds the diff. The reviewer tries to reason out from the diff and asks questions to the author for grounding. Once the reviewer gets all the answers, it generates an intent document that contains whats and whys of the changes. It also contains what was tried and not done and the assumptions that were taken. While the reason for generating such an intent document was to ease up the review process but it also gave us a side benefit which made the MCP server more useful for us. In this process, the author is unable to answer to ground some of the questions from the session chat and ends up relaying it back to the main session agent, which then corrects the code and provides an explanation to the author which is not present in the session.<p>Overall, the mcp server and the github action have helped us reduce the bugs while shipping code. This made me bullish on the product and I wanted to make sure it gets its due light.<p>Do try it out and raise issues or bash it if it does not work.<p>Thanks for reading.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49546071) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
