# PRODUCT.md — A date-only field should not become a local-time timestamp

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ &lt;!-- SC_OFF --&gt;&lt;div class=&quot;md&quot;&gt;&lt;p&gt;I’m building a browser-based health calculator suite, and a small JavaScript date choice turned into a correctness boundary.&lt;/p&gt; &lt;p&gt;An input type=date gives a calendar date. It does not give a moment in time. If that string becomes a local Date, midnight, timezone offsets, or a daylight-saving transition can move formatting or arithmetic onto an adjacent day.&lt;/p&gt; &lt;p&gt;In Flowy’s calculator engine, 2026-08-09 is parsed with Date.UTC. Every calculation adds whole UTC days, and formatting pins the timezone to UTC. Invalid calendar inputs such as 30 February are rejected by comparing the reconstructed UTC fields.&lt;/p&gt; &lt;p&gt;That keeps date-only semantics through period ranges, pregnancy dating, and calendar exports. The same rule is covered by a test that parses a date and expects the identical ISO date back.&lt;/p&gt; &lt;p&gt;The tradeoff is deliberate: these are calendar calculations, not event timestamps. If the domain later needs an actual appointment time, that should be a separate type with a timezone.&lt;/p&gt; &lt;p&gt;The calculators run in the browser, and the current methods are here: &lt;a href=&quot;https://flowyhealth.com/tools&quot;&gt;https://flowyhealth.com/tools&lt;/a&gt;&lt;/p&gt; &lt;p&gt;This feels bigger than health software. Birthdays, billing dates, hotel stays, and deadlines can all break when a calendar date is treated as an instant.&lt;/p&gt; &lt;p&gt;How are you representing date-only values in your product: ISO strings, Temporal.PlainDate, or a UTC-based wrapper?&lt;/p&gt; &lt;/div&gt;&lt;!-- SC_ON --&gt; &amp;#32; submitted by &amp;#32; &lt;a href=&quot;https://www.reddit.com/user/Particular_Luck80&quot;&gt; /u/Particular_Luck80 &lt;/a&gt; &lt;br/&gt; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/&quot;&gt;[link]&lt;/a&gt;&lt;/span&gt; &amp;#32; &lt;span&gt;&lt;a href=&quot;https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/&quot;&gt;[comments]&lt;/a&gt;&lt;/span&gt;

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

_Source:_ [Reddit r/SideProject](https://www.reddit.com/r/SideProject/comments/1vja9ih/a_dateonly_field_should_not_become_a_localtime/) · **Posted:** 2026-08-08T23:28:21+00:00
