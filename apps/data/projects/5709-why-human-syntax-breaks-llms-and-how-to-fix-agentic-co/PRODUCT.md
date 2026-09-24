# PRODUCT.md — Why human syntax breaks LLMs (and how to fix agentic coding)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Full technical essay with benchmarks &amp; AST breakdowns:
https:&#x2F;&#x2F;aslang.dev&#x2F;blog&#x2F;why-llms-struggle-with-python-and-rust<p>Over the past two years, watching coding agents generate code, we kept noticing an identical failure pattern: models spend 32% to 41% of their inference compute trapped in syntax repair loops.<p>When we investigated the information theory behind this, we realized the problem is not model scale—it is the computational geometry of transformer attention heads when confronted with human-centric grammars:
1. Python&#x27;s off-side rule: Lexing requires an internal LIFO indentation stack. Closing 3 blocks emits 0 characters. A single whitespace token split silently re-parents AST subtrees.
2. Rust&#x27;s borrow checker: Validity depends on non-local constraint solving across lifetimes and CFGs. Autoregressive generation is strictly forward causal (O(1) feedforward); it cannot backpropagate lifetime conflicts backward during generation.<p>We built AgentScript (ASL): an open-source, statically typed language using single-pass S-expressions that compiles directly to native Rust, Go, TypeScript, and WebAssembly (wasm32-wasip1).<p>Key properties enforced by construction:
* Balanced parentheses by grammar: Left-to-right attention heads always know parent scope.
* Closed vocabulary (prelude.json): 100% of builtins are type-checked and evaluated; no unmodeled foreign calls.
* Sub-millisecond Wasm sandboxing: In-memory WASI preview1 execution in 0.038ms without Docker&#x2F;microVM spin-up.
* Syntax repair collapse: Models spend 46.5% of generated tokens fixing syntax in Rust (our hard baseline) and 34.2% in Python. In AgentScript, repair iterations drop by 98.3% vs Rust baseline (from 4.8 cycles to 0.08), cutting syntax repair waste to just 1.2%.<p>Our Mission: The Best Harness for Local Development with Small Models
While frontier models on cloud clusters partially brute-force messy human grammars, our mission is to build the most effective autonomous harness for local development with small models (SLMs: 3B to 31B like Qwen, Gemma, Llama) running directly on developer machines.<p>On Apple Silicon or laptops, memory and attention are precious. A single-pass, parenthesis-balanced language combined with resident AST batch RPC eliminates the syntax churn and context rot that derail small models.<p>Pre-Release Alpha &amp; Active Development:
AgentScript is in early pre-release alpha—we do not have a tagged v0.1 release yet and are actively migrating to a 100% self-hosted compiler &amp; WASI runtime. But even at this stage, empirical results inside agent loops are remarkably compelling.<p>Try It Locally &amp; In Your Agent Skills:
We do not offer an in-browser playground—test the real thing directly in realistic agent workflows:
1. CLI toolchain: curl -fsSL https:&#x2F;&#x2F;aslang.dev&#x2F;install.sh | bash (or clone GenSEAM&#x2F;asl &amp; cargo build --release)
2. Equip agent skills (Claude Code, Cursor, Antigravity) with AST verification and batch RPC:
   asl rpc &#x27;(:batch (:out &quot;src&#x2F;main.asl&quot;) (:sym &quot;my_func&quot;))&#x27;<p>Terminal-Bench 4.0 Baseline (Macro Results, Not Cherry-Picked):
We packaged our baseline submission on Terminal-Bench 4.0 (tested on Gemma 4 31B under strict airgap boundaries):
* Macro Pass Rate: 13.5% across all 89 evaluated tasks (12 verified passes &#x2F; 89 total tasks).
* Baseline Comparison: Common harnesses (Claude Code, Codex, CLI loops) score 0.0% on this suite when paired with open-weights models due to subshell state loss, quoting drift, and context blowup. Pure ASL achieves 13.5% on Gemma 31B in airgap.
* Token Economy: 77.3% token savings vs standard agent CLI baselines.<p>Transcripts &amp; submission tarball: https:&#x2F;&#x2F;github.com&#x2F;GenSEAM&#x2F;harness
Core compiler &amp; runtime repo: https:&#x2F;&#x2F;github.com&#x2F;GenSEAM&#x2F;asl<p>We would love critical feedback from compiler engineers, language designers, and systems builders on the grammar design and agent steering architecture!

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49609821) · **Category:** ask-hn · **Tags:** Ask HN,Problem
