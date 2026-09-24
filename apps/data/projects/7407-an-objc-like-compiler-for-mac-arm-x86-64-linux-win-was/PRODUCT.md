# PRODUCT.md — An ObjC-like compiler for Mac ARM, x86_64(Linux, Win), WASM, & others

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi folks,<p>So this is my announcement of a compiler[1] I&#x27;ve been working on for about 6 months now (so yes, to get the obvious out of the way early, this was written with Claude code).<p>The compiler is called &#x27;xc&#x27;, stands for &#x27;cross-C&#x27; or &#x27;extended-C&#x27; or whatever you want, really. It&#x27;s fairly similar to Objective-C in style (without the [] brackets), and in fact the first version of the language was written in ObjC.<p>It works on Mac M-series, Windows, and Linux - and any of these hosts can create binaries for any of {Mac M-series, Windows, Linux, Android, iOS, WASM, Arm9 (Zynq), m68k and even 6502}.<p>Building the compiler needs host-tools to bootstrap everything, either GNUStep on Linux, or a Mac with Xcode. Once built, however, the system is entirely self-contained, and you don&#x27;t need <i>any</i> platform tools. I have a binary running on my iPhone which was compiled and signed on a Linux box... The suite ships with 5 host-specific assemblers, 10 object&#x2F;executable writers, and a native Apple code-signer (we don&#x27;t shell out to &#x27;codesign&#x27;) Downloads are available at [3] for all three hosts (xcc-osx-0.6.tar.bz2, xcc-linux-0.6.tar.bz2, xcc-win64-0.6.zip). Linux and Windows are larger because of static linking to make sure things are easy to run.<p>The documentation for the language is all at [2], it goes into the language details, but you get ARC (Automatic reference counting, which automatically goes atomic when you have threads), blocks, callbacks, Classes, and Protocols. It&#x27;s an optimising compiler with a shared IR, deliberately not LLVM&#x27;s IR because one of the original targets was the 6502, and LLVM likes register-rich architectures. The compiler runs Vectorize, LICM, LoopRotate, LoopUnroll (fixed and variable trip), StrengthReduce, Inline, TailRecursion, NarrowIV, PointerIV, RedundantLoadCSE, IdiomMemset, LoopReductionCollapse,...<p>One major inter-operability feature is the ability to say #import &lt;GEM&gt; (or #use, which also promotes its statics into the bare-call space) and have the compiler read libGEM.so, parse its DWARF, and expose the functions, types and enum constants inside. Xc uses the platform&#x27;s native structure packing, so binding a C library is mostly just pointing -L at it.<p>The Licence for the compiler is GPL3, for the standard library there&#x27;s the &quot;standard&quot; library exception, since that code is bundled into most apps. Bottom line, you are free to create any applications you like, open or closed, without any licensing issues. If you make a fix to the compiler, I would appreciate the bug report&#x2F;patch.<p>A utility in the tools&#x2F; section is c2xc. This takes almost all C code (I used it on  Kundert&#x27;s Sparse 1.4 — sparse.sourceforge.net) and converts it to valid XC. It might not be the best XC possible, but it will compile, and if you&#x27;re trying to produce WASM code and can&#x27;t just #use a dynamic library, this is the important part :)<p>There&#x27;s also the beginnings of a cross-platform UI toolkit and Interface-Builder, though these are very early days.<p>There are 568 fixtures, 608 unit-tests, two simulators (6502 and 68k) and ~50 differential scripts to check output vs clang &#x2F; binutils. The compiler is written in its own language, forming a &quot;reference&quot; ObjC compiler and the &quot;shipped&quot; written-in-xc compiler (all 120k lines of it), meaning it has two chances to find obscure bugs. Other real-world tests have been:<p>- transpiling Kundert&#x27;s Sparse 1.4 to xc and diffing its test program&#x27;s output against a clang build of the same library<p>- a circuit simulator built on it, checked against ngspice-47 and against an independent numpy MNA implementation<p>- writing a &quot;test in anger&quot; application, a server that listens for incoming web requests, parses them, uses them to query a DB and then sends the results out to a web-client (written in XC, and compiled to WASM)<p>Enjoy :)<p>1: <a href="https:&#x2F;&#x2F;github.com&#x2F;ThrudTheBarbarian&#x2F;xc" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ThrudTheBarbarian&#x2F;xc</a><p>2: <a href="https:&#x2F;&#x2F;compile-xc.org&#x2F;" rel="nofollow">https:&#x2F;&#x2F;compile-xc.org&#x2F;</a><p>3: <a href="https:&#x2F;&#x2F;compile-xc.org&#x2F;compiler&#x2F;downloads" rel="nofollow">https:&#x2F;&#x2F;compile-xc.org&#x2F;compiler&#x2F;downloads</a>

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49730393) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
