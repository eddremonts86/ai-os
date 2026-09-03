# PRODUCT.md — I wrote a small CLI to inspect and remove Cursor chat sessions

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Cursor stores chat session history in SQLite but lacks a way to delete individual chat sessions or by folder or repository.<p>After accumulating hundreds of sessions, I needed a way to clean up specific conversations and even chat sessions from specific folders.<p>With that in mind I built a small Python CLI that let you do that.<p>It can be installed with brew:<p><pre><code>    brew install vilaca&#x2F;tap&#x2F;cursor-chat-cleaner
</code></pre>
pip:<p><pre><code>    pip install cursor-chat-cleaner
</code></pre>
by cloning the repo:<p><pre><code>    https:&#x2F;&#x2F;github.com&#x2F;vilaca&#x2F;cursor-chat-cleaner

</code></pre>
For safety there&#x27;s a --dry-run parameter and chat sessions are only deleted when --yes is present in the command.<p>Chats are deleted from the both the database and the file system and there&#x27;s a possibility of doing backups (but no restore command yet).<p>As a bonus there&#x27;s a &#x27;stats&#x27; sub command that shows the models and tokens spent for each chat session.<p>This was exclusively tested in MacOs (Sequoia) with the latest Cursor version but should be fairly simple to port to other operating systems.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49520816) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
