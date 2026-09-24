# PRODUCT.md — How realistic is a modern-day era NLU

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I&#x27;m looking for people who are a bit more familiar with neural networks than me (I follow kaparthy&#x27;s tutorial once, that&#x27;s about it).<p>Lets say I like using LLMs for quality&#x2F;complex tool-calling to e.g. solve bugs, or just be a more sophisticated researcher.<p>But I don&#x27;t need it to write code for me. What would this look like? Would it just be a fancy NLU? Could you get a 3B tool that&#x27;s targeted towards tool-calling? or maybe a 1B?<p>It wouldn&#x27;t be more than just<p>```rust
USER:
cargo build fails with:
error[E0382]: borrow of moved value: `foo`<p>CONTEXT:
foo: Vec&lt;String&gt;<p>AVAILABLE TOOLS:
- read_file(path)
- ripgrep(pattern)
- rustc_explain(code)
- run_tests(...)<p>ASSISTANT:
&lt;tool&gt;rustc_explain {&quot;code&quot;:&quot;E0382&quot;}&lt;&#x2F;tool&gt;<p>TOOL:
Use of moved value...<p>ASSISTANT:
&lt;tool&gt;grep {&quot;pattern&quot;:&quot;foo&quot;}&lt;&#x2F;tool&gt;
```<p>I have a theory that scraping off the &quot;code-writing&quot; part would eat up a lot of time and size. I really don&#x27;t care that it writes code for me, it&#x27;s the best way to stay in the loop anyway, so off-loading this to a model is pretty useless for me. You could even test this against multiple tools. Maybe you could even use a frontier model to dig through earlier sessions and autoresearch better ways to improve this model.<p>Please let me know if something like this has been done before, and what the possibilities are today. I would love to dig deeper into this if there&#x27;s a slight chance this is possible.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49655550) · **Category:** ask-hn · **Tags:** Ask HN,Problem
