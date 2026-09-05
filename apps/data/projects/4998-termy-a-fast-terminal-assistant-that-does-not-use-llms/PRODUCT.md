# PRODUCT.md — TERMy – A fast terminal assistant that does not use LLMs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I love research and development, you may have heard of me because of PJON (Padded Jittering Operative Network). It is a network protocol I started developing in 2010, which was recently implemented in silicon by the ETH Zurich university thanks to the research of Pius Sieber.<p>I am excited to share with you TERMy, a terminal assistant built on top of the NPC-Forge framework. Unlike everything else being built today, TERMy does not use embeddings, machine-learning or LLMs. It runs on the CPU (even on a Raspberry Pi Zero) both in the terminal or client-side in a browser tab and responds in milliseconds. It is a cynical but very knowledgeable Linux terminal assistant that translates your natural language into shell commands without relying on a single artificial neuron.<p>I had a chance to focus for 2 months on my personal projects since early July, during the strange times of AI price hikes and the end of subsidized tokenmaxing. I was curious to see if I could develop from scratch a terminal assistant capable of handling simple natural language requests. I have a bad memory and got used to ask to copilot &quot;activate the virtual environment&quot; or similar trivial operations spending a non negligible sum every month. I started thinking, maybe I can do something to make my workflow more efficient? Do I really need trillions of parameters to accomplish those tasks?<p>How it Works<p>When you type a prompt, it goes through a lightweight NLU pipeline written in ~1000 lines of Python that implement the following steps:<p>1. Strip expletives, interjections, encouraging, discouraging and thanking words (remove noise)<p>2. Sentiment analysis<p>3. Exact Match (very fast)<p>4. Template Match (slower)<p>5. Probabilistic Match (even slower)<p>Step 5 relies on:<p>1. IDF (Inverse Document Frequency) to identify rare words.<p>2. BOW (Bag Of Words) to accommodate word inversions.<p>3. IDF weighted Levenshtein to safely handle typos.<p>Permission gating is hardcoded into the dataset and enforced for all potentially destructive commands, so it&#x27;s inherently safer than letting an unpredictable LLM run wild on your machine.<p>- TERMy in operation: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg</a><p>- Variance and typo tolerance: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=tQvGDk6fkk0" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=tQvGDk6fkk0</a><p>- Copilot integration: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=Wzzouhq2a8A" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=Wzzouhq2a8A</a><p>- Advanced features: <a href="https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg" rel="nofollow">https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=qeIp0xePLBg</a><p>- Source Code: <a href="https:&#x2F;&#x2F;github.com&#x2F;gioblu&#x2F;NPC-Forge" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;gioblu&#x2F;NPC-Forge</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49562219) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
