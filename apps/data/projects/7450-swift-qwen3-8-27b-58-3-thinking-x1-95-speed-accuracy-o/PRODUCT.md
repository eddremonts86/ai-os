# PRODUCT.md — Swift-Qwen3.8-27B, -58.3% thinking, x1.95 speed, accuracy of xhigh

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi everybody, we post-trained Qwen 3.8 27B to be more efficient by figuring out which tokens were linked to overthinking and penalizing them without &quot;attacking&quot; the reasoning length directly then fixed the accuracy with a bit of secret sauce (hint On-Policy Distillation) and achieved great results (-58% length, 1.95x speed up, &lt;1% accuracy loss) so we wanted to open-source it and hear the feedback of the community.<p>This is the link to the model: <a href="https:&#x2F;&#x2F;huggingface.co&#x2F;ukisai&#x2F;Swift-Qwen3.8-27b" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;ukisai&#x2F;Swift-Qwen3.8-27b</a> &#x2F; It&#x27;s at 80k downloads in 3 days with independent evals here: <a href="https:&#x2F;&#x2F;www.reddit.com&#x2F;r&#x2F;LocalLLaMA&#x2F;comments&#x2F;1wg7dd5&#x2F;ukisai_swiftqwen3827b_583_thinking_x195_speed&#x2F;" rel="nofollow">https:&#x2F;&#x2F;www.reddit.com&#x2F;r&#x2F;LocalLLaMA&#x2F;comments&#x2F;1wg7dd5&#x2F;ukisai_...</a><p>We are also providing a Free Research Purpose API (OpenAI compatible), courtesy of Nvidia who were kind enough to provide us with the GPUs. It&#x27;s limited at 5RPM. <a href="https:&#x2F;&#x2F;ukisai.com&#x2F;api&#x2F;swift&#x2F;v1&#x2F;models" rel="nofollow">https:&#x2F;&#x2F;ukisai.com&#x2F;api&#x2F;swift&#x2F;v1&#x2F;models</a><p>We also made a GGUF (Q1-Q8): <a href="https:&#x2F;&#x2F;huggingface.co&#x2F;ukisai&#x2F;Swift-Qwen3.8-27B-GGUF" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;ukisai&#x2F;Swift-Qwen3.8-27B-GGUF</a> and there&#x27;s also a few nice community quants with even lower&#x2F;higher precision (Bartowski: <a href="https:&#x2F;&#x2F;huggingface.co&#x2F;bartowski&#x2F;ukisai_Swift-Qwen3.8-27b-GGUF" rel="nofollow">https:&#x2F;&#x2F;huggingface.co&#x2F;bartowski&#x2F;ukisai_Swift-Qwen3.8-27b-GG...</a>). The community also created amazing MLX, NVFP4, W4A16 and Uncensored versions you can find on Huggingface.<p>IMPORTANT: Our training approach is not a replacement for the reasoning effort settings, chat templates or token caps but is complementary and targets a completely separate issue (overthinking and &quot;anxiety-like&quot; reasoning loops prior seen in PTQ, but as far as we identified also prominent in BF16 of this size class LLMs as well). Contrary to popular belief, these specific patterns do not contribute to answer quality when properly targeted. (our thesis being: reasoning length IS extremely important and should NOT be shortened by force, but rather optimized). This is also demonstrated bellow in our xhigh vs medium effort benchmark. The goal is to keep xhigh accuracy while reducing only the unnecessary part of thinking.<p>The TLDR of our thought process, research, training and a link to the Meta paper that inspired us is in the first comment.<p>The benchmarks:<p>Swift-27B vs Qwen3.8-27B (BF16, all benchmarks ran x5, thinking effort xhigh)<p>GPQA-Diamond: 88.4% -&gt; 88.3%, 58% fewer median tokens<p>LiveCodeBench v6: 76.8% -&gt; 81.6% (+4.8pp, due to default truncation in LCB it is not performance gain), 46% fewer median thinking tokens<p>Terminal-Bench 2.1: 66.7% -&gt; 65.8%, 39% fewer median tokens<p>MMLU-Pro: 85.5% -&gt; 85.0%, 28% fewer median tokens<p>C-Eval: 90.0% -&gt; 90.6%, 19% fewer median tokens<p>IFBench: 73.5% -&gt; 71.8%, 51% fewer median tokens<p>AIME 2026: 98.7% -&gt; 94.0%, 50% fewer median tokens<p>HMMT (Nov 2025): 99.3% -&gt; 96.0%, 46% fewer median tokens<p>ERQA (vision): 67.5% -&gt; 66.3%, 55% fewer median tokens<p>Token savings hold at every reasoning effort (mean thinking reduction): xhigh 41%, medium 23%, low 26% (albeit with accuracy loses of 1-4% on medium and 1-2% on low which we need further testing for)<p>Swift at xhigh vs the base&#x27;s own effort settings on GPQA-Diamond (198 questions x 5 seeds):<p>Base xhigh: 88.4%, 6,642 median tokens<p>Swift xhigh: 88.3%, 2,771 median tokens<p>Base medium: 84.1%, 1,753 median tokens<p>So Swift keeps xhigh accuracy at under half the tokens, and beats base-medium by 4pp at roughly 1.6x its tokens.<p>End note:<p>While we are keen on complete open-source, we still need to keep a part of our training and data private, being a new lab. The license is not Apache 2.0, but it only affects companies &gt;$1M. We hope this does not pose a problem for the community and are open to feedback on it.<p>We want to contribute as much as possible to the community and would really appreciate feedback on our work, quantization or Swift model requests. We are working on Swift 3.8 Flash Next and have so far gotten up to -53% thinking token usage. We have strong indicators our methodology is reproducible on other model families as well and are asking the community which ones you want us to optimize next.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49727511) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
