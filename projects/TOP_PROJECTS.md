# TOP_PROJECTS.md — ProblemHunt ranked

> Auto-ranked by the `problemhunt-scraper` cronjob on 2026-08-09T23:38:21Z.
> Source: 340 projects in ~/Projects/ai-os/projects/
> Filtered: 36 discussion/repost stubs discarded, 4 new real projects scored this run (305, 306, 307, 317).

## Top 5 — Real Revenue Potential

1. **216-we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove** — score 8/10
   _We built a tool that fixes bugs. It couldn't always prove it._
   FetchSandbox mandates a "reproduce-on-real-code → apply fix → prove the test flips green" loop, with the explicit failure mode that the team could only fix bugs they'd scripted a repro for. B2B ICP (dev teams on real codebases), high switching cost once repro/fix is wired into a team's CI, and a fix-and-prove moat is hard for code-llm wrappers to clone. Concrete recurring-style value: fewer "trust me" patches on billing/security edges.

2. **222-shipped-a-shopify-app-into-a-platform-deprecation-windo** — score 8/10
   _Shipped a Shopify app into a platform deprecation window — live yesterday, 30 days before the deadline_
   Replenora ($29/mo Pro) launched into Shopify's Stocky deprecation on Aug 31, 2026 — a dated, time-boxed market window with a captive cohort of merchants who must move. POs with per-supplier lead times, partial-receipt receiving, days-of-cover reorder points, landed-cost allocation: a meaty operational wedge. Pricing bet is flat-rate against tiered incumbents, and the deprecation timeline is the closest thing to free CAC you'll get.

3. **213-we-helped-a-client-go-from-3k-to-12k-with-outbound-and-** — score 7/10
   _We helped a client go from $3K to $12K with outbound and now we're looking for 5 agency owners to help for free_
   Sumora: AI outbound workspace for B2B founders and agencies with a documented case study (client $3K→$12K) and live manual validation. ICP narrowing, signal harvesting, personalised openers, follow-up sequencing — all human-reviewed, which is the right ethical/safety story for an outbound tool. Agency/SMB is a known high-WTP segment for $99–$499/mo sales tooling.

4. **206-building-saas-got-10x-easier-getting-someone-to-care-so** — score 7/10
   _building saas got 10x easier. getting someone to care somehow got 10x harder. so we built this._
   Same Sumora outbound platform framed from the founder angle: "one Reddit post → 7 booked calls in a day" is concrete WTP proof on the indie-hackers launch. B2B SaaS with recurring agency subscriptions; founder/agency ICP is exactly the segment that buys outbound tooling without blinking, and the tool sits in the middle of an actively-monetising category (LinkedIn/IG prospecting + AI).

5. **228-i-built-a-command-center-for-teams-running-coding-agent** — score 7/10
   _I built a command center for teams running coding agents — BYOK, persistent sessions, agent mesh_
   Browser-based control plane for coding agents (BYOK across 17+ providers, persistent sessions that survive sleep, WebSocket agent mesh, three permission modes plus plan mode, MCP/skills/plugins/hooks). Sits on top of the hottest 2026 spend category — multi-agent coding — and sells to dev teams who need org/role/session-handoff the CLI tools don't give them. Recurring infra-style pricing is implied by the architecture.

## Top 5 — Learning Potential

1. **228-i-built-a-command-center-for-teams-running-coding-agent** — score 9/10
   _I built a command center for teams running coding agents — BYOK, persistent sessions, agent mesh_
   Forces hands-on with the bleeding edge: a local daemon, WebSocket mesh between native OS processes, BYOK routing across 17+ providers, three permission modes, MCP/skills/plugins/hooks, plan mode. No off-the-shelf open-source stack covers this — you build the protocol yourself, in real time, on top of the most volatile part of the AI ecosystem. Genuine breadth: full-stack + infra + agent-orchestration.

2. **216-we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove** — score 8/10
   _We built a tool that fixes bugs. It couldn't always prove it._
   Reproduce-on-real-code → fix → prove = a forced exercise in test scaffolding, sandboxed execution, and assertion-driven diff validation. Real engineering depth: you must design harnesses for arbitrary codebases, not just call a model. The lesson "we could only fix what we'd scripted a repro for" is a concrete failure mode you have to engineer around (scripted repros, fuzzing, property tests).

3. **235-prompt-to-brick-model-webapp** — score 8/10
   _Prompt to Brick Model Webapp_
   BrickForgerAI: prompt → 3D brick sculpture with structural weak-point detection and auto-repair, plus a downloadable LDR file with parts list for BrickLink. A genuinely novel generative-3D problem (mesh → brick tiling with structural validity) plus a 3D preview UI. Real-time rotation + ordering path makes it a one-of-a-kind build — generative 3D plus geometric constraint solving is a deep sub-problem.

4. **317-update-habibi-now-scrapes-the-actual-chatgptperplexityc** — score 8/10
   _update: habibi now scrapes the actual chatgpt/perplexity/claude apps too, not just apis (and it's cheaper now)_
   Habibi drives the real logged-in ChatGPT/Claude/Perplexity/Google-AI-Overview apps (not APIs) so the "what does the AI say about my brand?" answer matches what a human user actually sees. Novel infra: persistent browser sessions, anti-account-memory drift (ChatGPT runs in temp chat, Claude answers isolated from prior context), per-prompt scheduled re-runs across 4 engines, and self-hosted so the data never leaves your box. The "API vs real app" gap is a real failure mode most LLM-monitoring tools still ship with.

5. **307-building-realtime-chat-is-one-thing-making-it-reliable-** — score 8/10
   _Building realtime chat is one thing. Making it reliable is the hard part._
   Echo: Slack-clone on Postgres-as-event-bus with per-channel gapless sequence and event versioning as the reliability layer (no Redis/Kafka), schema-per-tenant multi-tenancy, stateless app servers ready for K8s horizontal scaling. Stack is deliberately lean — Express+TS on Bun, React+Vite, TanStack Query, Better Auth, Zod-everywhere with auto-generated API docs. Real breadth: realtime infra + multi-tenancy + dev ergonomics, with a live deployment and public repo to read.

## Top 5 — Fun to Build

1. **242-im-a-japanese-house-painter-25-years-on-the-job-i-built** — score 9/10
   _I'm a Japanese house painter (25 years on the job). I built a Zen fart-meditation app with AI in one day._
   Zen fart meditation built around Tempu Nakamura's "one-sound meditation" method. You picture someone you're angry at, listen to a fart, then sit in 8 seconds of forced silence and answer "Have you forgiven them?" — if not, another round, and the author refused to compromise on "cannot skip". When you finally forgive, a toilet sound plays and your anger goes to the sewer, followed by 無 (mu — nothingness). Pure novelty, immediate demo, hilarious to show, and a real design-philosophy question hiding inside.

2. **234-i-built-a-webcam-asl-coach-that-grades-your-hand-shape-** — score 8/10
   _I built a webcam ASL coach that grades your hand shape in real time — now testing whether the idea is even viable as a profitable product (its competitor is free)_
   You sit in front of your webcam, copy an ASL sign, and the page coaches you back in real time — "so close, lift your pinky 🤙". The visual feedback is immediate and embodied, the live hand-tracking overlay is satisfying, and shipping a free tool you can hand to anyone with a webcam is a great demo arc. Plus the meta-challenge of building a paid product whose competitor is free state-subsidised software.

3. **235-prompt-to-brick-model-webapp** — score 8/10
   _Prompt to Brick Model Webapp_
   You type "octopus" and watch a brick sculpture materialise, rotate it, and get an LDR file + parts list to actually build with real pieces. Generative 3D with structural-validity repair is a creative constraint that makes the results feel engineered rather than just generated — highly tactile output (real bricks, real order list). The pipeline is the interesting part and the part you can keep poking at for months.

4. **250-swipe-to-vote-app-for-deciding-where-to-eat-finally-end** — score 8/10
   _Swipe-to-vote app for deciding where to eat - finally ended the food debate with my wife!_
   TasteMate: a no-signup, link/QR-join, swipe-to-vote restaurant picker with private votes during swiping and a live leaderboard at the end. Real, demoable, instantly fun — the design constraint (private votes prevent bandwagoning) is sharp, and the couple-at-dinner use case is a great storytelling hook. The author's "the value is landing on one everyone actually liked, fast" insight is satisfying design thinking.

5. **305-built-a-tool-for-outreach-with-your-face-rather-than-ge** — score 7/10
   _Built a tool for outreach with your face rather than generic chunks of text_
   You record yourself once, and for every prospect the system regenerates a fully-personalised script + a fresh video of you delivering it — not lip-sync, not template swap. The "is this personalised video actually from a human?" moment when you open your inbox is a great demo beat, and the pipeline (research → script gen → avatar/lip-sync → host → sequence send) has many tweakable knobs you can spend a weekend poking at.

---

## Changelog

- **2026-08-09T23:38:21Z** — evaluated 40 new projects. 4 real, 36 discarded (stubs/reflections). New top picks: 317-update-habibi-now-scrapes-the-actual-chatgptperplexityc (learn 8), 307-building-realtime-chat-is-one-thing-making-it-reliable- (learn 8), 305-built-a-tool-for-outreach-with-your-face-rather-than-ge (fun 7). Money ranking unchanged. Scores across this batch: avg money 5.8, learn 7.3, fun 6.5.
- **2026-08-09T11:34:04Z** — evaluated 101 new projects. 49 real, 52 discarded. New top picks: 216-we-built-a-tool-that-fixes-bugs-it-couldnt-always-prove, 222-shipped-a-shopify-app-into-a-platform-deprecation-windo, 213-we-helped-a-client-go-from-3k-to-12k-with-outbound-and-, 206-building-saas-got-10x-easier-getting-someone-to-care-so, 228-i-built-a-command-center-for-teams-running-coding-agent, 235-prompt-to-brick-model-webapp, 226-do-multi-app-long-horizon-tasks-on-frontier-models-for-, 234-i-built-a-webcam-asl-coach-that-grades-your-hand-shape-, 242-im-a-japanese-house-painter-25-years-on-the-job-i-built, 250-swipe-to-vote-app-for-deciding-where-to-eat-finally-end. Scores: avg money 4.7, learn 5.6, fun 5.4.
- **2026-08-08T23:48:24Z** — initial ranking across 199 projects. Avg scores: money 3.4, learn 3.3, fun 4.1.
