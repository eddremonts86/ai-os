# PRODUCT.md — GSL – I wanted to describe the architecture, not just draw it

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built GSL because I got fed up of building architecture diagrams that couldn&#x27;t quite capture all of the nuance of the real world. I liked the idea of using a system like Mermaid or PlantUML to represent my systems but there was never really a satisfactory way of describing what was happening.<p>I liked the easy-to-follow syntax of those diagramming tools but they very quickly ran into limitations. When you describe an API gateway component, you can&#x27;t really say that it belongs in a specific region but also that it belonged in a certain zone of the architecture or which team owns it. And when I described what systems interacted with each other I only had the ability to use a text field to describe all of the metadata about the relationship. Is it HTTPS vs an async lambda invocation? What auth do we need?<p>Something else I wanted was the ability to query the architecture. Surely when you have the full graph of what talks to what, you should be able to pose questions like:
* &quot;which customer actions trigger a call to vendor X&#x27;s API?&quot;
* &quot;what will be affected if database Y goes down?&quot;<p>I couldn&#x27;t really find anything that did that in a way that felt natural. Diagramming tools were either completely visual or too presentation focussed to express what I wanted. Existing graph languages felt too clunky or cumbersome. I struggled to find any that worked with sets and querying in a way that felt right.<p>So one rainy afternoon, I decided to see how far I could get with ChatGPT and some ideas - GSL was born!<p>In the repo there is:
* A specification for GSL, a language for defining directed graphs with nodes and edges along with set annotations to declare cross-cutting relationships
* A specification for GQL, the companion query language
* gsl-query - a CLI tool for executing queries on your GSL models
* gsl-diagram - a very primitive tool for turning GSL into Mermaid or PlantUML diagrams
* A small VS Code plugin for syntax highlighting
* Guides, tutorials, documentation
* Rich examples (including some non-tech oriented ones)<p>I think GSL has turned into the language that I was looking for at the beginning of the year. I&#x27;m starting to use it in my day job. The guides and documentation have been written to make it easier for agents and LLMs to use and my casual use so far has shown some promise.<p>It&#x27;s still very much an experiment but I&#x27;d like to get other people to take a look and see if it&#x27;s useful for them too. Have I even made the right assumptions and picked the right abstractions? Have you tried to do something like this yourself?<p>You can begin with the &quot;Getting Started&quot; guide, the specs, or just jump right in to the flagship examples. &quot;Example #3: Architecture Across Boundaries&quot; is fairly close to what I wanted to do originally.<p><a href="https:&#x2F;&#x2F;github.com&#x2F;dnnrly&#x2F;gsl-lang" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;dnnrly&#x2F;gsl-lang</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49710515) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
