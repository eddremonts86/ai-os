# PRODUCT.md — Competitive Language Learning (E-Sport)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ For the past few years i&#x27;ve been on Duolingo &amp; was able to learn Hindi &amp; Spanish (even helped me get state seal of biliteracy)<p>One of the biggest problems that I see in my generation (Gen Z) is loneliness. I love Duolingo&#x27;s community, but sometimes (well actually oftentimes), I felt myself struggling to come back.<p>Online language learning is a skill where dominantly, the entire motivation is connection and the entire daily practice is solitude.<p>Nobody learns Spanish to know Spanish. They learn it to talk to their partner&#x27;s family, to not be the silent one at the table, to move somewhere and have a life there. Then they spend 90 days alone with an owl.<p>I was thinking of a way to connect people around the globe-through the shared passion of learning languages, &amp; creating a competitive social space where people could compete in rapid-fire matches, instantly get feedback, &amp; learn through teaching their own avatar (vs a more passive &quot;lesson-style&quot; learning). They learn on the spot, under pressure, &amp; are put in different situations where they have to maneuver through different absurd scenarios &amp; speak or type the language in a satisfactory way).<p>The core flow is: Learn (2–5 min interactive segment) → Teach (explain it to your avatar) → Avatar attempts (your score).<p>Then you take that into ranked 1v1 matches against someone near your level, chess.com style: a blind judge grades both players on speaking and writing, ratings move, there&#x27;s a global ladder with titles and perks.<p>The point is to bridge this through competition &amp; internal community-building. Beyond the sport, users can interact with each other &amp; create micro-societies based on their shared interests of the language. People learning Spanish who have gotten an interest in creating foods-stuff like Carne Asada or Gazpacho would join a community (based on their shared interest of the language).<p>On the technical side I found an interesting mix of problems (that turned out to just be one).<p>Matchmaking needs P(A beats B) from two ratings.
Grading open-ended output is unreliable with rubrics, so instead of scoring one answer I only ever ask &quot;which of these two is better&quot;, Comparative Judgment, with scores recovered via Bradley–Terry.
Calibrating content difficulty across CEFR&#x2F;JLPT levels is Item Response Theory, usually a Rasch model.<p>All three are the same logistic function. Elo is an online gradient step on the Bradley–Terry likelihood; Rasch is Bradley–Terry with one side fixed as &quot;the item.&quot; So a 1v1 match is the pairwise comparison the judge needs, the judge&#x27;s output is the observation the rating update consumes, and item difficulty falls out of the same fit. Ratings are Glicko-2, so a new player carries explicit uncertainty (high RD) and converges in a handful of matches instead of thirty. Users see it as a Fluency Score.<p>Two Questions: 
The human one: does competition make you want to practice, or does it just make you anxious about practicing?<p>If you&#x27;ve shipped LLM-as-judge somewhere the score had real consequences, how did you detect drift you couldn&#x27;t see from inside the system?<p>If you think you may benefit&#x2F;want to use from this, I put together a small waitlist of people who might be interested in using this in the future (I also put a small demo of a little creative writing prompt on the site... see if you can get highest accuracy!)<p>Thanks for taking the time to read
<a href="https:&#x2F;&#x2F;thelingo.xyz" rel="nofollow">https:&#x2F;&#x2F;thelingo.xyz</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49544661) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
