# PRODUCT.md — Opair, a coding harness that eschews autonomy

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Obviously everyone is writing their own coding harness these days, so I&#x27;ll cut straight to the points of difference in mine:<p>* There&#x27;s no tool that grants shell access. Instead there&#x27;s a bunch of development-specific tools, scoped to restricted functionality.<p>* Reads and writes are gated by access control. Project files can be read without prompting, git-ignored files and dotfiles can&#x27;t.<p>* The shipped MCP integrations are restricted to read-only access. There are no tools for git add and commit.<p>* Perhaps the biggest difference is separate driver and navigator modes. In driver mode, Opair works like other harnesses but with less autonomy for the agent. In navigator mode, the agent has no access to writable tools at all and instead monitors the project for changes you make in your regular editor. The idea is to imitate the relationship with a human pair programmer.<p>Why on earth would anyone build this? Because I want less autonomy, not more. I don&#x27;t want to read a massive diff at the end of an implementation push, I want to be involved all the way through. Opair is my attempt to make the human&#x2F;agent relationship more like pair programming and less like code review.<p>I wrote more about this in a philosophy doc:<p><a href="https:&#x2F;&#x2F;www.opairdev.org&#x2F;philosophy" rel="nofollow">https:&#x2F;&#x2F;www.opairdev.org&#x2F;philosophy</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49625009) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
