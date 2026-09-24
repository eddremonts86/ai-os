# PRODUCT.md — EACL is a situated ReBAC authorization library for Datomic and Datahike

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ EACL is a situated ReBAC authorization library inspired by SpiceDB &amp; Google Zanzibar, built in Clojure and backed by Datomic Pro, Datahike, Datalevin or DataScript. EACL is suitable for multi-Peer deployments. I have been working on EACL for ~2 years in my personal capacity and I use it in all my Clojure projects now.<p>- You can try the EACL performance demo: <a href="https:&#x2F;&#x2F;demo.eacl.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;demo.eacl.dev&#x2F;</a><p>- And play with EACL Drive, a toy clone of Google Drive: <a href="https:&#x2F;&#x2F;drive.eacl.dev&#x2F;" rel="nofollow">https:&#x2F;&#x2F;drive.eacl.dev&#x2F;</a> (runs in-browser on DataScript)<p>EACL can efficiently answer questions like:<p>- &quot;Does &lt;subject&gt; have &lt;permission&gt; on &lt;resource&gt;?&quot; via `eacl&#x2F;can?` or `eacl&#x2F;check-permission`<p>- &quot;Which &lt;resources&gt; does &lt;subject&gt; have &lt;permission&gt; for?&quot; via `eacl&#x2F;lookup-resources`<p>- &quot;Which &lt;subjects&gt; have &lt;permission&gt; on &lt;resource&gt;?&quot; via `eacl&#x2F;lookup-subjects`<p>EACL supports four Consistency Modes that map to SpiceDB&#x27;s consistency semantics, so you can run these queries against the database as-of now, or &lt;N seconds ago&gt; via `at-least-as-fresh` semantics for better cache reuse.<p>SpiceDB is the most faithful open-source implementation of Google Zanzibar, and is used OpenAI, Reddit and Netflix. Zanzibar powers Google Drive, YouTube, Gmail and Google Calendar, serving billions of authorization requests per day over billions of Relationships.<p>&quot;Situated&quot; here means that permission data co-exist with your application data. This has several advantages over external AuthZ:<p>- Reduced network latency (no network hop to external system),<p>- Strong local consistency,<p>- Scale reads by scaling Peers horizontally, and<p>- Real-time UI view maintenance – tail the tx-log and run `eacl&#x2F;lookup-subjects` for changed permissioned entities and notify online users of novelty, instead of polling or re-querying for all online users.<p>Rationale:<p>I spent the better half of 2024 integrating with SpiceDB at a former employer. SpiceDB is great, but it becomes non-trivial to keep an external authorization system in-sync, especially when there is an impedance mismatch between your data and SpiceDB’s 3-tuple Relationship schema. Plus, you also have to deal with eventual consistency.<p>So, you change your data model to match the Spice schema to make syncing easier. Now you can tail the transactor log via `d&#x2F;listener` and write Relationship changes 1-for-1.<p>But once you do that, you might as well run your permission queries in your application and then you have one less system to deal with...and this is exactly what EACL does. You still retain the option to migrate to SpiceDB later.<p>EACL is aimed at a different scale from SpiceDB: Spice is benchmarked against 100B Relationships. EACL aims for ~1-100M Relationships in a situated environment, but there is no reason it won&#x27;t scale further if you scale out Peers.<p>EACL is open-source under EPL 2.0.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49712785) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
