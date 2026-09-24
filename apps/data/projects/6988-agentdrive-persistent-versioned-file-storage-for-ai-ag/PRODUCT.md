# PRODUCT.md — AgentDrive – persistent, versioned file storage for AI agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ We’re opening the private beta for AgentDrive, a persistent file&#x2F;workspace layer for AI agents.<p>AgentDrive gives agents:<p>- Versioned artifacts and folders
- Hosted MCP access for coding agents
- Direct upload sessions for larger files
- Share links and controlled public publishing
- Workspace-scoped authorization and auditability
- Many supported file formats such as MD, HTML, JSON, images, videos, and even spreadsheets<p>The MCP surface is intentionally narrow and reviewed rather than exposing the entire storage API.<p>It’s a private beta, so some features are deliberately out of scope for now.<p>See more details: <a href="https:&#x2F;&#x2F;tokencanopy.com&#x2F;products&#x2F;agentdrive" rel="nofollow">https:&#x2F;&#x2F;tokencanopy.com&#x2F;products&#x2F;agentdrive</a><p>Try the beta: <a href="https:&#x2F;&#x2F;app.tokencanopy.com&#x2F;drive&#x2F;" rel="nofollow">https:&#x2F;&#x2F;app.tokencanopy.com&#x2F;drive&#x2F;</a><p>For MCP clients:<p><pre><code>   claude mcp add --transport http --scope user agentdrive https:&#x2F;&#x2F;drive.mcp.tokencanopy.com&#x2F;mcp
   claude mcp login agentdrive

   codex mcp add agentdrive --url https:&#x2F;&#x2F;drive.mcp.tokencanopy.com&#x2F;mcp
   codex mcp login agentdrive
</code></pre>
A public API&#x2F;SDK integration experience is on the roadmap so that you can use AgentDrive in your product, but it is not available as a beta user interface today.<p>We’d especially appreciate feedback on:<p>1. Was connecting and using AgentDrive through MCP clear?
2. Which tools or storage primitives are missing?
3. What would be the first workflow you ask your agents do with AgentDrive?<p>Open source repo is also on the roadmap so that you can host it on your own infrastructure! Sign up at tokencanopy.com for more future updates.<p>Any feedback or feature requests can be sent to support@team.tokencanopy.com. You can reach out to me directly at josh@tokencanopy.com<p>I&#x27;d love to personally connect with more founders and developers who are building in the coding agent infra space: <a href="https:&#x2F;&#x2F;github.com&#x2F;jiashuoz" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;jiashuoz</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49699287) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
