# PRODUCT.md — I built a Netflix-style semantic search engine for Jellyfin, powered by local vector embeddings

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;table&gt; &lt;tr&gt;&lt;td&gt; &lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vj9vhv/i_built_a_netflixstyle_semantic_search_engine_for/&quot;&gt; &lt;img src=&quot;https://external-preview.redd.it/NDVldTNsb25nOGloMYd4bckuKEmltAI0rV9_sES0XmfOaVtg9MnRdsO78ur1.png?width=640&amp;amp;crop=smart&amp;amp;auto=webp&amp;amp;s=e939fc500aac20e171688add321a75b1b21322fa&quot; alt=&quot;I built a Netflix-style semantic search engine for Jellyfin, powered by local vector embeddings&quot; title=&quot;I built a Netflix-style semantic search engine for Jellyfin, powered by local vector embeddings&quot; /&gt; &lt;/a&gt; &lt;/td&gt;&lt;td&gt; &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;TL;DR: Stock Jellyfin search matches exact titles and little else. I built a layer on top where you describe what you want and get real results. Everything runs local. Posting here as it turned out better than I hoped and to see if anyone beyond me wants this, before I take the post to &lt;a href=&quot;/r/jellyfin&quot;&gt;r/jellyfin&lt;/a&gt; and decide whether to clean up and open source the code.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;The problem&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;I run Jellyfin at home. Sometimes I forget the name of a film, or just want to find similar stuff. I ended up googling first, then searching my own library for the title Google gave me. Netflix-style &amp;quot;describe and find&amp;quot; search does not exist for self-hosted libraries.&lt;/p&gt; &lt;p&gt;So I built one for myself. You type intent instead of titles:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;movies like the matrix but funnier&lt;/li&gt; &lt;li&gt;underrated horror from the 80s&lt;/li&gt; &lt;li&gt;feel good movies under 90 minutes&lt;/li&gt; &lt;li&gt;samuel l jackson marvel movies (his Marvel films, not my whole catalog)&lt;/li&gt; &lt;li&gt;movies like avengers but not marvel&lt;/li&gt; &lt;li&gt;scary but funny, nothing too gory for family movie night&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;The search reads cast, franchise, mood, decade and runtime. Negation works, so &amp;quot;but not X&amp;quot; does what you expect. Empty result pages never happen. Filters too tight, and the results degrade to the closest match with a note saying what got dropped.&lt;/p&gt; &lt;p&gt;The part I am most pleased with: every search shows its reasoning. Which path the query took, which signals fired, what got filtered, why each result matched.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;How this works&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;Pipeline: enrich existing servet → index → classify → retrieve → fuse → re-rank&lt;/p&gt; &lt;p&gt;&lt;em&gt;Offline enrichment, once per library, then weekly for additions&lt;/em&gt;&lt;/p&gt; &lt;p&gt;An LLM pass reads each title and writes metadata I do not otherwise have:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;plot summary&lt;/li&gt; &lt;li&gt;mood and vibe&lt;/li&gt; &lt;li&gt;target audience&lt;/li&gt; &lt;li&gt;aliases&lt;/li&gt; &lt;li&gt;synthetic search phrases someone might type to find the film&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;The enriched record lives in Postgres and acts as mu source of truth. Batch job, so the expensive model work happens up front instead of on every search.&lt;/p&gt; &lt;p&gt;&lt;em&gt;Three indexes&lt;/em&gt;&lt;/p&gt; &lt;p&gt;No single method covers everything, so each title gets indexed three ways.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Vectors in Qdrant. Three separate spaces for plot, vibe and search phrases. &amp;quot;cozy sci-fi&amp;quot; matches on feel rather than wording. This is the semantic part.&lt;/li&gt; &lt;li&gt;Keyword (BM25) in Meilisearch. Fast, typo tolerant lookup over titles, aliases and genres. Still the right tool when you know the name.&lt;/li&gt; &lt;li&gt;Structured facets in Postgres. Cast, year, runtime, certification, genre, franchise. Hard filters, not vibes.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;em&gt;At query time&lt;/em&gt;&lt;/p&gt; &lt;p&gt;A classifier works out the type of ask: title lookup, mood, or &amp;quot;movies like X&amp;quot;. Candidates come from whichever sources fit. Reciprocal rank fusion merges the ranked lists. A re-rank step nudges on rating and fixes what vectors get wrong on their own, like genre conjunctions and exact cast or franchise matches.&lt;/p&gt; &lt;p&gt;A small FastAPI gateway runs the pipeline. The Jellyfin plugin forwards the query and falls back to normal Jellyfin search if the gateway is down.&lt;/p&gt; &lt;p&gt;Everything runs on my hardware. The only external calls happen during the offline enrichment batch.&lt;/p&gt; &lt;p&gt;&lt;strong&gt;Where this stands&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;There are lots of shortcuts I took to make it work for my own library with my own server endpoints etc and I did not consider publishing this. Cleaning up, documenting and open sourcing is a chunk of work, so I wanted a read on interest first. I wouldn&amp;#39;t intend to charge for this it would be FOSS if I released it, but not gonna do it unless people seem to want it.&lt;/p&gt; &lt;p&gt;Demo library is seeded from TMDB metadata, titles and posters only, no files. It&amp;#39;s there to show the search ranking over a realistic large catalog.&lt;/p&gt; &lt;p&gt;Two questions:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Would you run this?&lt;/li&gt; &lt;li&gt;Got a query you think would break the search? Drop the query below. Every bug I have found so far came from a weird search someone threw at me.&lt;/li&gt; &lt;/ul&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/bit-voyage&quot;&gt; /u/bit-voyage &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://v.redd.it/9xpb5jong8ih1&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vj9vhv/i_built_a_netflixstyle_semantic_search_engine_for/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt; &lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
| Hobbyist builders | _[What pain they feel]_
| _[How this solves it]_ |
| Weekend hackers | _[What pain they feel]_
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

_Source:_ [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vj9vhv/i_built_a_netflixstyle_semantic_search_engine_for/) · **Posted:** 2026-08-08T23:10:13+00:00
