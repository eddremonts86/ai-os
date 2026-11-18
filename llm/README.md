# llm — local chat router + tool-use harness

Two layers, both local-first, both provider-swappable to MiniMax when you want the
cloud model instead:

1. **`router.mjs`** — a plain chat client. No tool use, no file access. Good for
   classification, extraction, summarization — anything that's one prompt in, one
   answer out. **This is the one actually in use** — default model `gemma3:12b`
   (~8.1GB), picked specifically because it has no "thinking" mechanism (see
   "Model selection, final state" below for why that matters more than raw size).
2. **`opencode` (npm `opencode-ai`)** — a tool-use harness on top of the same local
   daemon. It can read/write files and run shell commands, following instructions
   across multiple steps. **Currently has no model configured and is not
   recommended** — every model tried (8B through 32B) failed the real multi-step
   agentic task tested against it; see "Plan-enrichment trial" below before
   reaching for this layer again.

Both point at the same native Ollama daemon AI-OS already runs for memory-stack
embeddings (`ai.os.ollama`, launchd, `:11500`), which also carries `nomic-embed-text`.

## Layer 1 — `router.mjs` (plain chat)

```bash
ai-os llm ask "summarize this in one line: ..."
ai-os llm ask "..." --provider minimax
ai-os llm test                 # smoke check against the default provider
```

```js
import { chat } from './llm/router.mjs'
const reply = await chat([{ role: 'user', content: 'hola' }])                       // AI_LLM_PROVIDER (default: local)
const reply = await chat([{ role: 'user', content: 'hola' }], { provider: 'minimax' })
```

| Var | Default | Meaning |
| --- | --- | --- |
| `AI_LLM_PROVIDER` | `local` | `local` \| `minimax` |
| `AI_OLLAMA_NATIVE_BASE_URL` | `http://localhost:11500/v1` | the native Ollama daemon |
| `AI_OLLAMA_NATIVE_MODEL` | `gemma3:12b` | model pulled on that daemon — see "Model selection, final state" below for why gemma3, not qwen3 |
| `MINIMAX_API_KEY` / `MINIMAX_BASE_URL` / `MINIMAX_MODEL` | — | same vars `dev-env/env-config/.env.example` section 1 already defines |

### Context window: 32768 — sized from real traffic

Ollama's default `num_ctx` (4096) is too small for anything beyond a toy prompt.
`llm/gemma3-12b.Modelfile` sets 32768. It was 131072 (Gemma 3's full native context, which
does load 100% on GPU here) until 2026-11-07, when the footprint was measured against what
the model is actually sent:

| `num_ctx` | `ollama ps` | Prompt read | Generation |
|---|---|---|---|
| 131072 | 9.0 GB | ~247 tok/s | ~25 tok/s |
| 32768 | 8.1 GB | same | same |
| 16384 | 7.1 GB | same | same |

Ollama reserves memory for the whole window on every load, so the size costs RAM, not speed.
The Ollama log's 38,607 requests had a p99 of ~3,500 tokens, a maximum of 17,560, and none
over 32K, so 32768 loses nothing. 16K was rejected: a prompt longer than `num_ctx` is cut
from its start with no warning (a 21,690-token prompt at 16K was read as its last 8,195
tokens, and the log still said `truncated = 0`), which in graphiti means facts from the start
of a long episode are never extracted. graphiti calls through `/v1`, which ignores
per-request `num_ctx`, so the Modelfile value is the one that applies.
`setup/install-mac.sh` (section 9d) re-applies this Modelfile after every pull —
idempotent, no re-download, just a manifest update — so a fresh
`ollama pull gemma3:12b` alone is not enough; run
`ollama create gemma3:12b -f llm/gemma3-12b.Modelfile` after it if not using the
install script.

### Chat UI

`ia-os-open-webui` (Docker, part of `memory/docker-compose.yml`'s `ia-os`
project) — because this model sits loaded in memory the whole time anyway once
something is actively using it, so it's worth being able to just talk to it from
a browser instead of only through `ai-os llm ask`.

- **http://127.0.0.1:3301** — also in this project's `.claude/launch.json`
  (`open-webui`), so `preview_start`/the Browser pane can attach to it directly.
- Talks to the *native* Ollama daemon (`host.docker.internal:11500`), not a
  separate instance — same model, same `ai-os llm` config.
- No login wall (`WEBUI_AUTH=False`) — fine bound to `127.0.0.1` only, not fine
  the day this ever binds `0.0.0.0`.
- Opt-in since 2026-11-07 (it held ~1.5 GB while idle): `cd memory && docker compose --profile chat up -d open-webui`; stop it with `docker compose stop open-webui`.
  `setup/install-mac.sh` starts it automatically with the rest of the `ia-os`
  stack (section 9b); `setup/verify.sh` checks it (section 5c).

**One-time manual fix after first setup:** open-webui auto-creates a model entry
for `gemma3:12b` with several Capabilities checked by default — Web Search, Code
Interpreter, Citations, Memory, Terminal, Image Generation, and critically
**Builtin Tools**. Any one of these makes open-webui attach a `tools` array to
every request, and Ollama rejects that outright for a model that doesn't support
tools (`gemma3:12b does not support tools`, HTTP 400) — every message fails,
every retry fails the same way, and it looks like the model or the daemon is
broken when neither is. Fix (Admin Panel → Models → `gemma3:12b` → edit →
Capabilities): uncheck everything except Vision, File Upload, File Context, and
Status Updates. Not scriptable via the compose file — it's stored in
open-webui's own database, so this is a manual step after the container's first
boot on a fresh machine. Confirmed as the actual root cause 2026-09-19 (not the
per-chat "Code Interpreter" toggle, not Admin → Settings → Interface's
generation toggles — both looked like plausible causes and were disabled first,
neither fixed it; the model-level Capabilities checkboxes were what fired every
time until unchecked).

**Adopting this in another app** (e.g. hunterready): copy `router.mjs` into that repo
(separate repo, no shared package here) and set the same env vars. No other wiring
needed — both providers speak the same `/chat/completions` shape.

## Layer 2 — `opencode` (tool-use harness)

Installed globally (`npm install -g opencode-ai`, binary at `opencode`) and persisted
as a background service — see "Reproducing this on another machine" below for the
exact commands per OS.

### Provider config

`~/.config/opencode/opencode.json` (global, not project-scoped, not in this repo).
Current state — `models` deliberately empty, no model pulled for this layer:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "ollama-native": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (AI-OS native, :11500)",
      "options": { "baseURL": "http://localhost:11500/v1" },
      "models": {}
    }
  }
}
```

To resume experimenting, add an entry back (`ollama pull <tag>` first), e.g.:

```json
"models": { "<tag>": { "name": "<label>" } }
```

Note `gemma3:12b` (this daemon's chat default) was never part of the tool-use
trial below — every row in that table is a `qwen3` variant. If you pick this
back up, that's an open question, not a ruled-out one.

### Security model — read this before pointing it at a real project

The persisted service is a headless HTTP server on `127.0.0.1:4096`. Two separate
questions, don't conflate them:

| Question | Answer |
| --- | --- |
| **Who can reach it?** | Only processes on this machine — bound to loopback, never `0.0.0.0`. |
| **Can anything on this machine drive it without a password?** | No, once installed via the scripts below — they generate `OPENCODE_SERVER_PASSWORD` and bake it into the service. Without a password, *any* local process (a script, an unrelated npm package, another app) could attach and tell it what to do. |
| **What can it touch by default?** | `~/.ai-os/opencode-sandbox` — a disposable directory, not this repo. This is a *default*, not a jail: `--dir <path>` on any call points a session at a different directory, and the daemon's own OS file permissions apply (same user, so it can touch anything you can). |
| **Does it ask before writing/editing/running shell?** | Yes, unless the caller passes `--auto` ("auto-approve permissions that are not explicitly denied — dangerous!"). The persisted service itself is started without `--auto`; individual `opencode run ...` calls opt into it per-call. |

The real hard boundary would be OS-level sandboxing (a separate user, `sandbox-exec`,
or a Docker container with explicit bind mounts — the pattern `containers-architecture`
already uses for the rest of the local-agent stack). What's here is "safe by
default, dangerous by explicit choice," not a jail.

### Pointing a session at a real project

Illustrative — `<tag>` is whatever model you've pulled and added to
`opencode.json` (none is configured by default, see "Model selection, final
state" below):

```bash
PASS="$(grep '^OPENCODE_SERVER_PASSWORD=' dev-env/env-config/.env | cut -d= -f2-)"
opencode run "..." -m ollama-native/<tag> \
  --attach http://127.0.0.1:4096 \
  --dir ~/Projects/hunterready \
  -p "$PASS" \
  --auto   # only once you trust what this task will do unattended
```

### Verified tool-use, and where it broke

Tested against a throwaway file with a "secret number": asked the agent to read it
and report the number back.

- **First attempt** (no explicit relative-path instruction): the model called
  `read` on `/hello.txt` (absolute, wrong) instead of `./hello.txt`. The harness
  executed the real tool call, got a real "file not found," and the model recovered
  with a coherent clarifying question instead of hallucinating an answer or crashing.
- **Second attempt** (explicit "relative path" instruction): `read ./hello.txt` →
  correct answer. Full loop confirmed: tool-calling protocol, permission gate
  (`external_directory: ask`, `read: allow`), and real file I/O all work end to end
  with `qwen3:8b-q4_K_M` as the model.
- **Root-caused an apparent `--attach -p` hang — corrected twice.** First pass: two
  attempts against the persisted, password-protected service showed no visible
  output, and probing the raw HTTP API directly (bypassing the CLI, POSTing a
  message without passing the `tools` field the CLI normally sends) reproduced a
  turn that reasoned about the right plan and then stopped without any tool call.
  I initially wrote that up as "the model sometimes plans but doesn't act." That
  was wrong, and re-running the *exact* repro (`opencode run --attach -p`, not the
  raw API) three more times showed why: my raw-API probe had omitted the `tools`
  schema the CLI includes, so the model had nothing it *could* call — a bug in my
  test, not a finding about the model. Re-run properly, 3/3 real CLI attempts DID
  emit a tool call every time (checked via full session/message history, not just
  the CLI's own terminal output, since `--attach` streaming is easy to misread —
  that was the original mistake).
- **The real, confirmed failure mode is wrong tool selection, not no tool call.**
  Of those 3 clean attempts: 2 called `read` with the right relative path and
  answered correctly ("4471"). 1 called `glob` with pattern `./hello.txt` instead
  of `read` — glob found 0 matches (a glob pattern isn't a literal path), and the
  model gave up with a clarifying question instead of retrying with `read`. Same
  underlying weakness as the earlier absolute-path miss (imprecise tool use on an
  8B model), expressed as wrong-tool-choice instead of wrong-argument this time —
  not "reasons but never acts," which was never really happening.

This is real evidence a small local model is meaningfully weaker at *precise* tool
use than Claude/GPT-frontier — wrong argument, wrong tool, roughly 1 in 3 in this
small sample — not that it fails to act at all. Anything unattended (a background
service processing real work with nobody watching) needs to verify the *outcome*
(did the file actually get read, is the number actually in the answer), not just
whether a tool call happened.

### What this does not fix (yet)

`apps/data/tools/plans-pipeline` (plansmith repo)'s 35-40M-token runs are still Task-tool /
`delegate_task` subagent dispatch, not wired to this harness. This proves the local
tool-use path *works* for simple, single-step reads — whether it can do the *real*
enrichment work was tested directly (below), not assumed.

### Plan-enrichment trial (2026-09-19): 5 attempts, 0% success — closed pending further work

Tested the real task, not a toy: copied one real draft plan
(`1133-releasaurus-software-versioning-and-release-automation-`) plus
`_schema.json` and `plan-authoring/SKILL.md` into an isolated sandbox (never
touched the real repo — verified by hash after every attempt), and asked the
harness to read all three and rewrite `SPEC.md`'s empty sections per the skill's
actual rules (no invented facts, `<!-- TODO -->` when the source is too thin).

| Attempt | Fix applied | Read the 3 files correctly? | Stayed on task? | Wrote anything? |
| --- | --- | --- | --- | --- |
| `qwen3:8b`, default (4096 ctx) | — | ❌ resolved `./file` against `$HOME`, not cwd | ❌ derailed into the unrelated `spec` skill | ❌ |
| `llama3-groq-tool-use:8b` (16k ctx) | swapped to a tool-calling-specialized fine-tune | ❌ never attempted a single tool call | ❌ just paraphrased the instruction back | ❌ |
| `qwen3:14b-q4_K_M` (16k ctx) | bigger model | ✅ all 3 reads correct | ❌ derailed into the same unrelated `spec` skill | ❌ |
| `qwen3:14b-q4_K_M --pure` | disabled external plugins (the `spec` skill was one) | ✅ all 3 reads correct | ❌ misread the plan's own placeholder text `` `ai-os plans enrich` `` as an invokable skill name, failed to invoke it, gave up and asked which of ~190 real skills to use | ❌ |
| `qwen3:32b-q4_K_M` (16k ctx) | went up another size tier (~20GB, closest Ollama tag to "27B") | n/a — never got the chance | n/a | ❌ **couldn't even answer "respond with pong"** — 22GB real footprint on a machine with ~17GB swap didn't fit; loaded 78% GPU / 22% CPU, swap hit 95% used, and the request timed out after 5 minutes. Not a reasoning failure — a hardware ceiling. |

Every fix solved the specific symptom the previous attempt had just shown — and
the model found a new way to avoid finishing the actual write every time, until
going up a full size tier stopped being about reasoning at all and became "this
doesn't fit in memory on this Mac." Five different combinations, zero task
completion. Not a single bug to patch; general fragility under ambiguous context
that model size (8B→14B) and noise reduction (`--pure`) each nibbled at without
resolving — and past 14B, the hardware itself is the wall, not the model's
judgment.

**Was this exhaustive? No — three concrete, untried, cheap levers remain:**

1. **Strip the skill tool entirely for this task.** The message-send API takes a
   `tools: {toolName: boolean}` map (see the raw API exploration above); setting
   `{"skill": false}` removes the *entire class* of derailment we hit twice, not
   just the one skill that happened to be in the way. Untried.
2. **Decompose the task.** Every attempt was one prompt asking for 3 reads + rule
   application + a full rewrite in one shot. Splitting into separate calls — read
   step, then a plan-only step, then a write-only step with the content already
   decided — plays to what small models are actually okay at (one clear thing at
   a time) instead of asking for sustained multi-step judgment. Untried.
3. **Try a coder-specialized model instead of a chat/tool-use one** (e.g.
   `qwen2.5-coder:7b`). Every model tried so far was general-purpose
   chat-plus-tools; a model trained specifically on file-editing patterns might be
   less prone to the conversational derailment (skill-invocation, giving up to ask
   a question) that killed all four attempts here. Untried.

None of these were tested because the pattern — "fix reveals a new failure mode,
not success" — made continuing to spend real downloads/time on it a judgment call,
not a technical dead end. If you pick this back up, start with lever 1 (free,
~30 seconds, directly targets both derailments seen so far) before spending another
9GB download on lever 3.

**Until one of those actually closes the loop, do not route real plans-pipeline
enrichment through a local model.** For the cheap triage sub-task (meta-vs-buildable
classification, dedup — single-step, low-ambiguity, matches what small models
handled fine in the earlier `hello.txt` tests) a local model is still a reasonable
bet; the multi-file rewrite with rules is the part that failed five times in a row.

### Model selection, final state (2026-09-19)

All five models pulled during the tool-use trial above were removed after
testing (`ollama rm`). `opencode`'s `~/.config/opencode/opencode.json` has an
empty `models` map: the tool-use layer has nothing configured and isn't
recommended per that trial.

`router.mjs` (plain chat, no tool use — a different, working use case) went
through two picks, not one:

1. **First pick: `qwen3:14b-q4_K_M`** — chosen as the best fit within a ~12GB
   budget for chat-only work (multiple 2026 sources call 14B "the sweet spot" at
   this budget; also the largest size confirmed to run here without swapping —
   see the 32B trial row above). Reasoning at the time: plain single-turn chat
   never hit the tool-use trial's multi-step derailment, so there was no reason
   to avoid the bigger model.
2. **That reasoning missed a real interaction, found in production the same
   day: Ollama serves one request at a time on this daemon (`-np 1`), and
   qwen3 is a "thinking" model.** A single verbose reasoning trace — triggered
   by an ordinary question typed into the open-webui chat below, nothing
   adversarial — occupies the only slot until it finishes, which blocked
   `router.mjs`, `opencode`, and open-webui itself, all at once, for as long as
   that one generation ran. Diagnosed live: `ollama ps` showed `llama-server`
   genuinely computing (37% CPU), not deadlocked — killing the stuck client
   connection (`docker restart ia-os-open-webui`) freed the slot instantly.
   **Revised pick: `gemma3:12b`.** Considered `gemma4:12b` first (newer, better
   benchmarks, native tool calling) and rejected it: gemma4 (every size except
   the e2b/e4b nanos) also has thinking, and `think: false` doesn't remove the
   phase — it still emits an empty think block. Gemma 3 has no thinking
   mechanism at all, at any size — structurally incapable of this failure mode,
   not just configured to avoid it. Confirmed directly: a real request against
   `gemma3:12b` returns `content` with no `thinking` field and `done: true` in
   ~1s of actual generation, no separate reasoning phase to get long.

## Reproducing this on another machine

### macOS (tested — this is what's running here)

```bash
brew install ollama                                   # if not already
bash memory/launchd/install-ollama.sh                  # embeddings daemon (:11500)
OLLAMA_HOST=127.0.0.1:11500 ollama pull gemma3:12b     # router.mjs's default (plain chat)
OLLAMA_HOST=127.0.0.1:11500 ollama create gemma3:12b -f llm/gemma3-12b.Modelfile   # 32768 ctx
```

That's the recommended setup: `router.mjs` for plain chat, `opencode`/tool-use
left unconfigured (see "Plan-enrichment trial" — not recommended today). If you
want the tool-use layer back for further experimentation anyway:

```bash
OLLAMA_HOST=127.0.0.1:11500 ollama pull <tag>          # your choice — see the trial results first
npm install -g opencode-ai
bash llm/launchd/install-opencode.sh                   # generates + persists the password
# then add that tag to ~/.config/opencode/opencode.json's "models" (see above)
```

`setup/install-mac.sh` installs the `opencode` service either way (section 9d,
model-less by default) unless `SKIP_OPENCODE=1`. `setup/verify.sh` checks it
(section 5c) — it'll report the service as up but no local model pulled, which is
the current intended state, not a failure.

### Linux (not yet tested on a real box — mirrors the macOS logic via systemd)

```bash
# install Ollama via its own official installer (sets up its own systemd unit,
# defaults to :11434 — override with `Environment=OLLAMA_HOST=127.0.0.1:11500`
# in that unit, or `systemctl --user edit ollama`, to match this repo's convention)
OLLAMA_HOST=127.0.0.1:11500 ollama pull gemma3:12b
npm install -g opencode-ai
bash llm/systemd/install-opencode.sh
```

Not wired into any install script yet — run it manually, and treat the first run
as a real test of `llm/systemd/install-opencode.sh`, not a known-good path.

### Windows

No native service story here (this repo's own Ollama-on-Windows path is
Docker-first for the same reason — see `setup/README-bootstrap.md`). Reuse the
`opencode` container already defined in `containers-architecture` (iaWorkSpace):
point its provider at Ollama the same way `pnpm od:provider ollama` does for
open-design, instead of trying to run `opencode-ai` as a native Windows service.
Not built or tested here — this is a pointer to existing, already-vetted
infrastructure, not a new script.

## Operational reference

```bash
bash llm/launchd/install-opencode.sh --status      # loaded? answering? password set?
bash llm/launchd/install-opencode.sh --uninstall
tail -f ~/.ai-os/opencode.log                       # service stdout/stderr
```
