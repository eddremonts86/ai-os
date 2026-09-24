# PRODUCT.md — Why serialize documents to disk instead of memory-mapping runtime state?

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Opening files like docx requires heavy string parsing and pointer allocation. After an OS swaps active RAM pages out as to flash disk as virtual memory, it can restore them almost instantly. Using 2X more flash disk space is worth if we can achieve millisecond loads. Why hasn&#x27;t direct memory dumping&#x2F;reloading replaced file parsing for complex document models?<p>I started a company in 2000 to build a commercial cross-platform desktop suite in Java. To achieve seamless live-data-linking across text, sheets and slides, we stored data objects into a 3D coordinate space (Sheet_Num,Row_Num,Column_Num) and reference&#x2F;access them instead of pointers. This scheme enable us open a 50,000-pages document in 8 seconds, compared to 300+ seconds by a competing suite requiring parsing andan array of pointer construction.<p>Recently, some suggested that our 3D design without referencing data by pointers can possibly use OS provided mmap to restore back the entire document image as loaded into the RAM to flash disk. Instead of opening the file again with all those parsing&#x2F;pointer-building work, the memory mapped buffers can be simply be brought back into RAM in milliseconds.<p>Our senior engineers have confirmed the feasibility and tries to prove it, but, they have encountered numerous problems to save using OpenJDK and CRaC on Linux. They told me that OpenSDK has stated that it can be done but probably did not test this part thoroughly because they never expected it be actually used.<p>Has any one successfully decouple a complex document substrate into off-heap memory to achieve true zero-copy mmap load or does the JVM runtime always get in the way?

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49720159) · **Category:** ask-hn · **Tags:** Ask HN,Problem
