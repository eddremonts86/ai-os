# PRODUCT.md — STXT, indentation-based format with schemas and no escape characters

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ STXT is a human-first text format for documents: indentation-based, with namespaces and schemas written in the same language. It has very few rules, no escape characters, and is designed around simplicity and readability. The goal is a language that people write naturally, and machines parse securely and reliably.<p>Compared with XML, you keep namespaces and schemas, but without closing tags or escape characters. There is no entity expansion or external resource references either. Compared with YAML or TOML, every value is text (no Norway problem), a text block is literal, and schemas are STXT documents too.<p>The combination of STXT and Markdown allows validated and structured documents, with the expressiveness of Markdown.<p>To explain it, I&#x27;ve created the main portal <a href="https:&#x2F;&#x2F;stxt.dev" rel="nofollow">https:&#x2F;&#x2F;stxt.dev</a>, made with STXT itself (add .stxt to any URL to see the source). In the portal you can find all the specifications, the tutorial, VSCode extension, a CLI, parsers in Java, TypeScript, Python, and a playground: <a href="https:&#x2F;&#x2F;play.stxt.dev" rel="nofollow">https:&#x2F;&#x2F;play.stxt.dev</a>. All available in <a href="https:&#x2F;&#x2F;github.com&#x2F;stxt-lang&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;stxt-lang&#x2F;</a>.<p>An example in STXT (extra indentation for HN):<p><pre><code>  Book (com.example.library):
      Title: Modern Software Architecture
      Authors:
          Author: Keyla Brown
          Author: Joan Costa
      ISBN: 978-84-123456-7-4
      Published: 2026-08-25
      Summary &gt;&gt;
          This book offers a practical view
          of patterns and best practices
          for designing distributed,
          scalable systems.
</code></pre>
And the template with the structure and cardinality:<p><pre><code>  Template (@stxt.template): com.example.library
      Structure &gt;&gt;
          Book:
              Title: (1)
              Authors: (1)
                  Author: (+)
              ISBN: (1)
              Published: (1) DATE
              Summary: (?) TEXT
</code></pre>
Why STXT? I created STXT in the spring of 2013, as a language that preserves the most used of XML, while being able to be written by non-technical people. The first version was finished, different from the current one, but I never announced it. In 2014 my daughter was born; my priorities changed.<p>Time passed, other languages were created, and we arrived at 2025. In those years I didn&#x27;t find another format with the same balance of characteristics that STXT has, and I decided that was the time to resume the project.<p>Since then, I&#x27;ve been revising the language, using it for personal projects, and I consider it usable and stable.<p>I&#x27;d love to have your feedback, impressions and comments.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49681808) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
