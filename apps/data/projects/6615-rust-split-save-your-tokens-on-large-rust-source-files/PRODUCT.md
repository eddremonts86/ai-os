# PRODUCT.md — Rust-split – save your tokens on large Rust source files

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ A common failure mode for AI SW development is that agents tend to build large &quot;God&quot; files.<p>This is bad on your token burn. A) because the larger your source file the more churn the LLM takes to find and emit edits, which are more likely to fail, and B) the real kicker - the agent&#x27;s process is to move one item at a time, which is an O(n^2) algorithm, but especially bad because it inevitably breaks and the code mushes up and sadness ensues (burning time and tokens).<p>So, I have had lots of success with rust-split and a few skill notes. rust-split uses the AST (syn) to find the correct boundaries. Two passes: explode cuts the file into top-level items with their comments and #[attrs] attached - lossless, cat the chunks together and you get the original back byte for byte, so you can check it before trusting it - then split writes the module layout under a LOC ceiling. What&#x27;s left for the LLM is basically fixing imports, which doesn&#x27;t burn anywhere near as many tokens. It&#x27;s not perfect with the transition but fixing small import issues LLMs can do efficiently.<p>rust-split is released as a GitHub attested release or a crates.io install:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split</a><p><pre><code>    cargo install rust-split
</code></pre>
Be sure to add the skill file (<a href="https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split&#x2F;blob&#x2F;main&#x2F;skills&#x2F;rust-split&#x2F;SKILL.md" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split&#x2F;blob&#x2F;main&#x2F;skills&#x2F;rus...</a>) and set your project&#x27;s line thresholds. I chose a soft limit of 1000 LOC to trigger the decision to split (I&#x27;ve found that at 2000 LOC agents lose it, so give yourself a safety margin) and the target max size of a split file to be 500 LOC, but preferably more smaller files than 2x500 LOC files.<p>Enjoy

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49671509) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
