# PRODUCT.md — Fraise: a memory database for AI agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Fraise is a memory database for AI agents — a single binary that stores facts as a temporal graph of facts, topics and entities, queried in a small language with
two verbs:<p>```
  remember &#x27;acme moved to annual billing&#x27; topic:billing entity:acme
  recall billing entity:acme since:30d top:5
```<p>Two verbs because the caller pays for every token it reads back. A recall is ranked and capped rather than exhaustive, with recent facts outranking older ones.<p>Unlike most memory layers that use existing databases (vector, graph) to index data, Fraise provides a lightweight, no infrastructure layer that is designed to be used directly by agents: hence the simple query language to manage memory.<p>Fraise has a hybrid (graph, text and vector) retrieval engine: text and vector are used to find seeds, which are starting points for the graph search. The Fraise graph is bipartite: facts linked to entities and &#x2F; or topics.<p>It ships an MCP server (that I actually use now with my Claude Code sessions). Which means that memory persists across sessions. 
You can use `claude mcp add fraise -- fraise mcp` to set it up. It also supports Codex (all instructions available in the docs).<p>I benchmarked it against mem0, Letta, Graphiti, EverOS and cognee on LoCoMo, with every system ingesting the same conversations using the same extraction model and the same embedding model, and answering the same questions. Retrieval recall at k=10: 0.893 against a best of 0.897, at 0.18s p50 (twice as fast as the next system) and about a third of the tokens of the highest scorer. Scalability-wise, writes are essentially linear, but reads grow linearly with vertex degree (e.g. a topic with 30K facts attached costs about 55× than one with 500).<p>This is 0.1.0 so plenty of work to do. As mentioned above, scalability with adversarial graph topologies, but also persistency: for now Fraise is in memory with no file storage. This is the first feature for 0.2.0.<p>If this is a topic that is of interest, I&#x27;d love to chat, or if you have any feedback feel free to reach out!<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;FraiseHQ&#x2F;fraise" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;FraiseHQ&#x2F;fraise</a>
Docs: <a href="https:&#x2F;&#x2F;docs.getfraise.dev" rel="nofollow">https:&#x2F;&#x2F;docs.getfraise.dev</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49609014) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
