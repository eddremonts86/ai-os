# PRODUCT.md — A writing coach that's not allowed to write your sentences

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,<p>I&#x27;m  the technical advisor and one of the co-founders for Oghmere (<a href="https:&#x2F;&#x2F;oghmere.com" rel="nofollow">https:&#x2F;&#x2F;oghmere.com</a>), a writing tool for people who care about the integrity and authenticity of their writing, including journalists, essayists, newsletter writers. Along with inkandops and notgrrly, we are bootstrapping this project to make sure we can focus on building AI tools that benefit authors without replacing them.  It is very easy today for anyone to fire up a chatbot or other AI tool to write for them, and it’s a really useful tool that I use every day at my $dayjob, or to summarize and review topics I am researching or working on, but those generated texts aren’t something I care about the authenticity because they are steps to getting a job done.  When I write my own opinions, fiction, or D&amp;D content, I don’t want to use generated text, I want to exercise my mind and creativity.<p>That is the constraint we care most about in Oghmere: the AI is not allowed to generate, autocomplete, or rewrite your prose. It can ask questions and point at things in a draft you already wrote, it can even suggest changes you can make, but that&#x27;s it. This isn&#x27;t a limitation of a capability - we use Anthropic models, and are experimenting with other providers as well; they are fully capable of writing the sentence or generating text for you, but building that authenticity and working to retain it is the core tenet of the product and platform that we enforce.<p>If you want to know how it actually holds together: there&#x27;s an authoring pipeline: Voice (built from writing that you provide, or an interview to define a target Voice) → Brief → Outline → Editor
Each stage is optional, but they all yield structured data from author interactions that steers the guidance that the coaches provide.<p>We enforce the constraints on AI authorship very simply; the AI tools that can provide coaching and feedback don’t have a mechanism to update the document directly, they can only provide review comments and feedback. There is a tooling surface for deterministic reviews like spellcheck and grammar check to recommend and apply changes, but if an author wants to leverage AI feedback, they have to rewrite their prose themselves.<p>In addition to the coaching and feedback, we are also building in research tooling, and project and document knowledge bases, and AI powered author feedback that assess how you are writing and where you can improve. We also have a weekly writing challenge that allows authors to stretch and grow!<p>Writing, editing, version history, and export are free and unmetered, with some AI powered wizards that can help customize and tailor the experience. There are no direct charges for basic editor features, but all AI and some other capabilities consume credits, all of which are indicated in the UX, examples include coaching passes, a voice-calibration pass, a research query.  We hope to change the dependency on credits in the future, but we are still working out the longer term billing&#x2F;pricing model.<p>You can try it without signing up using our test page (metered to 5 coaching passes):  <a href="https:&#x2F;&#x2F;app.oghmere.com&#x2F;try&#x2F;HACKERNEWS2026" rel="nofollow">https:&#x2F;&#x2F;app.oghmere.com&#x2F;try&#x2F;HACKERNEWS2026</a>
After you try it out, or if you want to skip trying it first, you can sign up for a free account (no card required) that includes a bundle of free credits at <a href="https:&#x2F;&#x2F;app.oghmere.com&#x2F;campaign&#x2F;HACKERNEWS2026" rel="nofollow">https:&#x2F;&#x2F;app.oghmere.com&#x2F;campaign&#x2F;HACKERNEWS2026</a><p>We would really love your feedback as we speed towards a general release, and we are happy to answer questions about how it was built and what we are planning for the future!<p>Yvan (ygjb), Monique (inkandops), and Sandhya (notgrrly)

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49716388) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
