# PRODUCT.md — Locksmith: Store Maven Secrets in the macOS Keychain (Or a Unix Socket)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hello HN,<p>In the age of LLMs sucking in random secrets, sandbox escapes, and RCE orbital bombardment, I thought it&#x27;d be a good idea to create a Maven Extension that defers to the MacOS keychain for resolving secrets. In general, it&#x27;s a good idea to not have any secrets (passwords, tokens, etc) stored in plaintext files. Also, this allows your machines to be FIPS-140 complaint, if thats a thing for your job.<p>Locksmith is a Maven Core Extension that defers to the MacOS Keychain. The entry format in settings.xml looks like:<p>`{[type=locksmith]nexus.superbiz.example.com&#x2F;username}`<p>This was a fun project and I used the Project Panama FFM with jextract for the first time. The FFM is a great iteration on JNI (which still has it&#x27;s place) and was pretty much brainless to use.<p>Setup is quick and easy and I tried to make the readme as friendly as possible.<p>As an aside, I&#x27;ve also architected the core Library indecently from the Maven bits, so if you do need to read from the MacOS keychain in a project, you could pull the core Library in without dragging in Maven.<p>Being 2026, of course Claude was used to assist in the creation of the project, however Locksmith is not vibecoded top-to-bottom. I personally loathe AI slop. I use LLMs as a tool, not a crutch.<p>Enjoy!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49628707) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
