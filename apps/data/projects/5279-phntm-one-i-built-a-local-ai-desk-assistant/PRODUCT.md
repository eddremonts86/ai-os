# PRODUCT.md — Phntm-ONE: I built a local AI desk assistant

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;ve spent the past several months building something I call PHNTM-One. And I am really curious what HN thinks of the idea and the product I&#x27;ve built. The basic concept is an AI appliance that lives on your desk, is your personal assistant and is totally local running on your own hardware with the option for a boosted mode to reach claude for more demanding tasks. The idea is to have your own local AI assistant that gets to know you and your tasks personally. The entire system runs on a Raspberry Pi5 8gb with Gemma 3 4B through Ollama, it has whisper.cpp for speech to text, piper for speech, a local RAG for documents and it also has a persistent memory. What I found interesting throughout the project wasn&#x27;t just getting it to successfully answer questions, but rather make it feel like a real appliance over feeling like Raspberry pi5 project or demo. That meant dealing with a long list of different tasks which turned out to be exactly what is was missing the entire time from making &quot;forget this&quot; actually remove a memory from SQlite to making document citations truthful when the memory and RAG disagree. I have spent a lot of time trying to break the system I&#x27;ve built with test after test being ran, service kills, state corruption, you name it ive tested it. One thing I will not claim is that the 4B model can compete with large cloud models, that not really the point of the project or my idea. Your trade off is capability for ownership and thats why I built this product. I am extremely interested in what AI can look like when the user owns the hardware, the memory, the files, and the recovery path. The biggest constraints are what you might expect, a cold model does load slower when dealing with a Pi5 and the 4B model still has some reasoning and knowledge limits. What Ive done to compensate for that is build the system around that by being honest about uncertain items, grounding document answers and ive kept memory bounded and ive all made it failures recoverable. I&#x27;d be open to feedback and questions and Im more than happy to answer any technical questions regarding the memory&#x2F;RAG design, the testing I&#x27;ve done, or the hardware in general. For more context the raspberry pi5 is install in its own 10.1 inch 5 finger touch monitor. The monitor has a cooling fan, and a speaker. Its powered by a PSU not a battery. Please reach out if you have any additional questions.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49580654) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
