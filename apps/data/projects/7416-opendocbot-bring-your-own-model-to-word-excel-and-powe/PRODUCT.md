# PRODUCT.md — OpenDocBot – bring your own model to Word, Excel and PowerPoint

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I got tired of the lock-in and black-box nature of AI inside MS Office. One vendor decides which models you can use, where your document data goes, and what the agent is actually allowed to do. And when it fails, you can&#x27;t see the code or send a PR to add a feature you may need.<p>Many people don&#x27;t have that choice: they&#x27;re forced to use these tools (MS Office) at work. For coding agents we already have open interfaces like OpenCode where you can bring your own key, swap providers and models, run local, inspect everything, etc. I thought &quot;agentic Office&quot; needs the same.<p>So I built OpenDocBot: an agent that runs inside Word, Excel and PowerPoint. Bring your own provider (OpenAI, Anthropic, Gemini, DeepSeek, OpenRouter, Ollama, or your own endpoint &#x2F; custom gateway). It&#x27;s client-side, so document data goes straight to the provider you configure, and the source is public so you can always audit the code and self-host it.<p>I added a few things I thought would be useful: human-in-the-loop approval before any action is applied; file uploads (e.g. building a slide deck from a PDF) with local OCR for scanned documents, and tunable model behavior.<p>Caveat: it&#x27;s early, and Microsoft Marketplace distribution isn&#x27;t live yet, so today you have to sideload it. I know that&#x27;s real friction, I&#x27;m fighting daily with the MS Support team to achieve MS Partner Center account validation. I wrote some scripts that automate the sideloading process, and recorded short videos to make it easier.<p>If you use Office heavily, I&#x27;d love your feedback.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;opendocbot&#x2F;opendocbot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;opendocbot&#x2F;opendocbot</a><p>Site + docs: <a href="https:&#x2F;&#x2F;opendocbot.com" rel="nofollow">https:&#x2F;&#x2F;opendocbot.com</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49729683) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
