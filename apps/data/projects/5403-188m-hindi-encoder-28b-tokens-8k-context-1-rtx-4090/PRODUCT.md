# PRODUCT.md — 188M Hindi encoder, 28B tokens, 8K context, 1× RTX 4090

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I wanted to improve Hindi retrieval quality, particularly for longer documents ( as the current architectures don&#x27;t really have a longer context length ), and was curious how far can I push a 4090 haha :)<p>So I trained a Hindi-first ModernBERT from scratch:<p>188M parameters
~28.5B Hindi tokens
8,192-token context, one of the first Hindi encoders to support 8K context ( directly benefits the retrieval capacity, for which encoder models are used for )<p>1× RTX 4090 (24GB) ~5 days of training<p>After DPR fine-tuning, it achieves SOTA on the Hindi retrieval benchmarks I evaluated:<p>mMARCO Hindi: 0.2825 nDCG@10
MLDR Hindi: 0.2635 nDCG@10<p>The MLDR result is particularly interesting because it evaluates long-document retrieval, where the 8K context window can actually be used.<p>It also achieves:<p>Hindi NER: 0.8001 F1
MASSIVE Hindi intent: 0.4731 Macro-F1<p>Model and evaluation details:<p><a href="https:&#x2F;&#x2F;huggingface.co&#x2F;kkkamur07&#x2F;hindi-modernbert" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;kkkamur07&#x2F;hindi-modernbert</a><p><a href="https:&#x2F;&#x2F;github.com&#x2F;kkkamur07&#x2F;indic-modernBERT" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kkkamur07&#x2F;indic-modernBERT</a><p>My goal is to extend this to a lot of low resource languages, I would be really grateful for feedback and collaboration opportunities ;) so that I can improve this even further.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49587099) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
