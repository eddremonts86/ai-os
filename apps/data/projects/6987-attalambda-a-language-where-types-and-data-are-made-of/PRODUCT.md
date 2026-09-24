# PRODUCT.md — AttaLambda: a language where types and data are made of untyped lambdas

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I made a programming language!<p>I call it AttaLambda.<p>The idea is this: a usable Lisp-shaped language where all the meaningful computation is done in untyped lambda calculus. Logic, arithmetic, data structures, control flow, even the types — all untyped lambdas. A small, explicit Racket layer sits at the boundary to handle the outside world, plus some macros for syntactic sugar.<p>This is its story:<p>A couple years ago, I wanted to play with untyped lambda calculus and go beyond where tutorials usually stop. They show booleans, numbers, arithmetic, maybe the Y-combinator — and then stop. I wanted them to keep going.<p>So I started a project called All The Lambdas. Using Racket set to lazy, I used only one Racket construct for actual computation — lambda — and built integers, rationals, lists, binary digit-list number encodings, search algorithms, and more.<p>Then I found Functional Programming Through Lambda Calculus by Greg Michaelson. In it, Michaelson sketches the bones of a language built in untyped lambda calculus, including a type system where typed objects are themselves pair functions containing a type tag and value.<p>I found that intriguing and implemented and extended the idea, still entirely with untyped lambdas. I don&#x27;t have a background in programming language theory, so I was figuring it out as I went.<p>Then I stopped tinkering with it for a while.<p>Recently I came back and thought: why not turn this into a real usable language with the help of coding agents? I reused most of All The Lambdas as the foundation.<p>Thus AttaLambda was born.<p>Some additional details:<p>* Rat, its number type, uses binary digit-list encodings instead of Church numerals, so numbers scale with their number of binary digits rather than their value<p>* errors are lambda-encoded values, not Racket exceptions, and propagate through the language like ordinary data<p>* the Racket host only performs irreducibly external operations; even things like HTTP parsing, routing, and response construction stay in the pure lambda world<p>* recursion uses lambda-calculus recursion: no loops or true self-reference, just the Y-combinator underneath<p>* automated purity checks catch accidental cheating, like native computation leaking into the pure parts<p>* syntax like multi-argument lambdas, let, cond, and list is just macro sugar that reduces to unary lambdas and application<p>A couple code examples:
(short of print, every single thing here reduces to unary untyped lambdas)<p>Factorial:<p><pre><code>  #lang attalambda

  (rec factorial n =
    (cond
      ((eq n 0) 1)
      (else (mult n (factorial (sub n 1))))))

  (print (factorial 10))
</code></pre>
Which prints:<p><pre><code>  3628800

</code></pre>
Or an exact harmonic sum:<p><pre><code>  #lang attalambda

  (print
    (reduce add 0
      (map (lambda (n)
             (unwrap-ok (div 1 n)))
           (range 1 8))))
</code></pre>
Which prints exactly:<p><pre><code>  363&#x2F;140
</code></pre>
As far as I know, no programming language combines all these features: Michaelson-style type tags built from untyped lambdas, exact rationals backed by binary digit lists, errors as lambda values, and real-world programs where almost all computation stays inside the lambda core. None of those pieces are individually new, but I don&#x27;t know of another language combining them this way.<p>Download:
<a href="https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;attalambda&#x2F;releases&#x2F;tag&#x2F;v0.7.0" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;attalambda&#x2F;releases&#x2F;tag&#x2F;v0.7.0</a><p>Code:
<a href="https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;attalambda" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;attalambda</a><p>Original All The Lambdas:
<a href="https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;all_the_lambdas" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;kserrec&#x2F;all_the_lambdas</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49699477) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
