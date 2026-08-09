# PRODUCT.md — How I built a low-latency Japan reverse geocoding API on Cloudflare Workers + D1 to solve Google Maps API pricing spikes

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;&lt;em&gt;Disclosure: I am the founder/developer of ReverseGeoJP.&lt;/em&gt;&lt;/p&gt; &lt;p&gt;Hey everyone,&lt;/p&gt; &lt;p&gt;I wanted to share some technical &amp;amp; architecture learnings from building a micro-SaaS: a reverse geocoding API specifically tailored for Japan location data.&lt;/p&gt; &lt;h1&gt;The Problem: Google Maps API Costs &amp;amp; Complex GIS Data&lt;/h1&gt; &lt;p&gt;If you&amp;#39;ve built location-based apps operating in Japan (travel tools, delivery apps, geotagged content), you usually run into two main obstacles:&lt;/p&gt; &lt;ol&gt; &lt;li&gt;&lt;strong&gt;Unpredictable API Costs&lt;/strong&gt;: Google Maps Geocoding API costs $5.00 per 1,000 requests. For early-stage apps or high-frequency polling, a sudden traffic spike can cause terrifying unexpected bills.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Messy Local Data&lt;/strong&gt;: Official Japanese address datasets (MLIT) and postal code files from Japan Post are fragmented in heavy Japanese CSVs. Running your own PostGIS server just for basic reverse geocoding is heavy and expensive to maintain.&lt;/li&gt; &lt;/ol&gt; &lt;h1&gt;Architecture &amp;amp; Solution&lt;/h1&gt; &lt;p&gt;To fix this, I built an API with predictable flat-rate pricing and zero server maintenance:&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Compute &amp;amp; Database&lt;/strong&gt;: Built entirely on Cloudflare Workers + D1 (SQLite at the edge).&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Data Indexing&lt;/strong&gt;: Pre-processed and indexed official MLIT coordinate data and 7-digit postal code records into optimized SQLite spatial lookup tables.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Latency&lt;/strong&gt;: Sub-50ms responses globally by avoiding origin server roundtrips.&lt;/li&gt; &lt;/ul&gt; &lt;h1&gt;Lessons Learned&lt;/h1&gt; &lt;p&gt;Storing spatial indices inside D1 SQLite databases allows executing lightweight B-Tree/R-Tree queries right on the edge node nearest to the user. This eliminated $100+/mo cloud database server costs completely.&lt;/p&gt; &lt;p&gt;Happy to answer any questions about spatial indexing on D1 or structuring flat-rate APIs!&lt;/p&gt; &lt;p&gt;&lt;em&gt;(Feel free to ask if you&amp;#39;d like the link to test the live demo/docs!)&lt;/em&gt;&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/tarkun55&quot;&gt; /u/tarkun55 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

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

_Source:_ [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vjaphw/how_i_built_a_lowlatency_japan_reverse_geocoding/) · **Posted:** 2026-08-08T23:49:44+00:00
