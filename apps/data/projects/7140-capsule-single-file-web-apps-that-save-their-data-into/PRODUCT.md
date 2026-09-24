# PRODUCT.md — Capsule – Single-file web apps that save their data into SQLite

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN,<p>I always had the problem that building HTML pages is really simple now, but trying to save data required hosting it somewhere, and sharing it afterwards was not easy. Over the last few months, I&#x27;ve been building an app called Capsule (it’s also the file extension name) written in Rust with Tauri 2.0 that allows packing an HTML app and its data into a single SQLite file.<p>The HTML file and any related assets are directly embedded in the database. User data can either be saved as a localStorage key&#x2F;value store or via a MongoDB-inspired collections API as documents, saved in a table in the file. You can also save other assets, like PDF files or images, directly in the database to keep different documents together. All data can be easily exported to CSV or JSON if needed.<p>Privacy and security were a big priority for me, so documents cannot do anything out of the box. They don’t have direct access to the file system and they require permission to access the internet. The permission model is still something I’m working to improve. Capsule documents can also use local or remote AI models for document specific AI features.<p>One downside with this approach is that multiple people working on it will create different copies. To make it possible to merge different copies of the same file, each data entry has a unique UUID and timestamp.<p>I’m planning to open up the file format specification for the 1.0 version of the app so other apps can read or write Capsule files.<p>You can try it out in the web preview at <a href="https:&#x2F;&#x2F;withcapsule.app&#x2F;preview" rel="nofollow">https:&#x2F;&#x2F;withcapsule.app&#x2F;preview</a> with pre-built templates or use any AI provider of your choice to create a custom, Capsule-optimized app by using the following prompt:<p>&quot;Please read the app wizard instructions at <a href="https:&#x2F;&#x2F;withcapsule.app&#x2F;prompt.txt" rel="nofollow">https:&#x2F;&#x2F;withcapsule.app&#x2F;prompt.txt</a> and help me design an app.“<p>I’m still working on the file format but there are migrations for each new version, so data should never be lost when using newer versions of the app in the future. Please let me know if you have any ideas or use cases where this might make sense or does not work.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49712278) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
