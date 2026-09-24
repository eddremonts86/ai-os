# PRODUCT.md — Open-sourced jev architecture last year with model,paper and dataset

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Everyone now talks about the architecture  that&#x27;s not auto regressive and does lightning fast probability prediction with a json schema. I worked on this literally one year back in March 2025, published an arxiv paper, pushed the model to huggingface along with the pypi package and training dataset. And then one year later, a frontier lab came, proposing the same idea like literal breakthrough without technical papers, open weights and  no open dataset.  For anyones information the main guiding model is RL not embedding model or LLM<p>Paper: https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2503.23303<p>Model: https:&#x2F;&#x2F;huggingface.co&#x2F;DeepMostInnovations&#x2F;sales-conversion-model-reinf-learning<p>Dataset: https:&#x2F;&#x2F;huggingface.co&#x2F;datasets&#x2F;DeepMostInnovations&#x2F;saas-sales-conversations<p>Also the second work published in September 2025 was exactly the same one jev proposed now<p>Paper: https:&#x2F;&#x2F;arxiv.org&#x2F;abs&#x2F;2510.01237<p>My model uses PPO over sequence embeddings to output turn-by-turn conversion trajectories (probabilities from 0.0 to 1.0).<p>Jev uses parallel sampling (trained via RLCD) to output confidence distributions and schema choices.<p>It&#x27;s incredibly frustrating that the thing that you made with months of hard work, sweat and sleepless night is architecturally similar with the vertical use case and don&#x27;t get the support you deserve because frontier lab build something horizontal. The open-source story in general

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49736660) · **Category:** ask-hn · **Tags:** Ask HN,Problem
