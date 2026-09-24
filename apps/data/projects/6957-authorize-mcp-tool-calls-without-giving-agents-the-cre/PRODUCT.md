# PRODUCT.md — Authorize MCP tool calls without giving agents the credentials

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN, Adam here.<p>We built a small MCP example around a single problem:<p>How do you let an agent use a tool that needs credentials without giving the credentials to the agent?<p>The demo has two tools. One is open. One is protected.<p>When the agent calls the protected tool, Keydris checks the policy first:<p>ALLOW → run the tool
REJECT → stop<p>The credential stays on the server. The agent never sees it.<p>We do the check through a small middleware on the MCP server called the KIT Reader.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;keydrisLabs&#x2F;mcp-auth-keydris-template" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;keydrisLabs&#x2F;mcp-auth-keydris-template</a><p>We&#x27;re early. If you&#x27;re building with MCP, Claude Code or Codex, I&#x27;d love to know how you&#x27;re handling this today and where you think this approach breaks.<p>We support other elements like integrations etc but would love your feedback

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49695295) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
