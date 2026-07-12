# Persistent & Indexed Memory for AI-OS — Research Synthesis

**Date:** 2026-07-02
**Status:** ✅ Research complete · awaiting user approval for Phase 1
**Author:** Edd (assisted by 3 sub-agents)

## 1. Question

How should AI-OS add a **persistent, indexed, cross-project memory layer** so the
AI agent (Hermes / Claude Code / Codex / Gemini / Antigravity / MiniMax) finds
project context, prior decisions, code structure, and session history faster
and more consistently than today's 4KB of hand-curated `MEMORY.md` + `USER.md`?

## 2. Findings (consolidated from 3 research reports)

Three sub-agents researched in parallel on 2026-07-02:

- `outputs/2026-07-02-research-agent-memory-architectures.md` (461 lines) — Letta,
  Mem0 (LoCoMo 91.6 / LongMemEval 94.8 / BEAM 1M 64.1), Cognee, LangGraph, Graphiti,
  GraphRAG, MCP memory servers.
- `outputs/2026-07-02-research-code-indexing.md` (416 lines) — Aider repo-map, Serena
  MCP, codanna, codebase-memory-mcp (158 langs, sub-ms, 3,400 vs 412,000 tokens),
  grepai + Ollama, voyage-code-3 (+13.80% over OpenAI-v3-large on 32 datasets),
  ripgrep.
- `outputs/2026-07-02-research-knowledge-graphs.md` (582 lines) — FalkorDB
  (recommended primary), Memgraph (production-grade), sqlite-vec (simplest),
  GraphRAG v3.1.0, HippoRAG 2, GLiNER2, Obsidian, Logseq, Foam, MCP knowledge
  graph servers, **complete schema for AI-OS** (9 node labels, 16 edge types, 2
  example cypher queries).

### Cross-cutting conclusions

1. **No "best" memory architecture exists.** The 2025-2026 consensus is **hybrid
   layered memory**: file-based ground truth at the bottom, semantic embeddings
   in the middle, graph traversal on top, all behind deterministic tool-layer
   retrieval the agent controls.
2. **Keep `context/` + `memories/` as the source of truth.** Git-versionable,
   diffable, grep-able, low-friction. Don't replace them — **index them**.
3. **MCP is the integration path.** Hermes already speaks MCP. Adding
   `mcp-memory`, `codebase-memory-mcp`, and `falkordb-mcp` is configuration, not
   architecture.
4. **For Edd's 4 active work projects + 1 AI-OS + 1 anySolutions + 60 legacy
   personal projects** the right scope is: indexing tool (AST + embeddings) +
   one graph DB (FalkorDB) + one MCP memory server (graphiti-mcp or the
   reference `mcp-memory`) + a weekly cron that re-indexes.

## 3. Recommended Phase 1 (for user approval)

| Layer | Tool | Why | Effort |
|---|---|---|---|
| **Indexing tool** (code) | `codebase-memory-mcp` (deusdata, 24.6k★) | 158 langs, sub-ms queries, 5× more token-efficient than file-by-file, MCP-native | 1 day |
| **Embeddings** (if semantic needed) | `nomic-embed-text` via local Ollama | Free, private, Apple Silicon native | 1 hour |
| **Graph DB** | `FalkorDB` (Docker) | AI-tuned, sparse-matrix adjacency, cypher, OpenCypher-compatible, ~4.7k stars active Jul 2026 | 1 day |
| **MCP memory server** (graph) | `getzep/graphiti` MCP server (drop-in) or the official `modelcontextprotocol/servers` Memory | Sub-second temporal graph, bi-temporal model for "last Thursday's decision" | 1 day |
| **Hybrid retrieval** | `ripgrep` (lexical, fallback) + tree-sitter (AST, via codebase-memory-mcp) + BM25 + graph | Tool-driven, deterministic, low-context-cost | Included |
| **File source of truth** | `context/`, `specs/`, `archive/`, `~/.hermes/memories/`, `~/.hermes/sessions/*.db` | Already correct, git-versioned, no rewrite | 0 (use as-is) |
| **Wiki authoring (optional)** | Obsidian (default) or Logseq (outliner) | Graph view + `[[wikilinks]]`, both AI-OS-friendly | 1 day |
| **Cron** | weekly `graphrag index` over the markdown corpus | Keeps embeddings + entities fresh | 0.5 day |

**Total Phase 1 effort estimate: 1 week part-time, with verification gates between
each step.**

## 4. What Phase 1 does NOT include (out of scope)

- Replacing `context/`, `MEMORY.md`, `USER.md` files (kept as source of truth).
- Touching other Hermes profiles.
- Cloud-hosted vendor memories (ChatGPT memory, Claude Projects) — single-project
  locked, opaque, multi-project substrate not fit.
- Self-hosting Mem0 (revisit if multi-session recall quality becomes a bottleneck).
- Kuzu (archived Oct 2025), OpenAI Assistants API (deprecated), Roo Code (shut
  down 2026-05-15).

## 5. Verification gates (between every step)

Apply `verifiers/source_check_prompt.md` + `verifiers/critic_prompt.md` to every
deliverable. Run `verification-before-completion` skill before claiming done.
End with concrete runtime evidence (URL + status if a service is started).

## 6. Risk register

- **Index staleness** — gitignored `node_modules/`, `dist/`, `build/`, `coverage/`
  MUST be excluded or the index balloons. Mitigation: `.gitignore` already
  covers them; add `.aiignore` if needed.
- **Embedding model churn** — `nomic-embed-text` is current as of 2026-07 but
  models change yearly. Mitigation: store raw corpus on disk, re-embed is a
  5-min cron.
- **Graph DB lock-in** — stick to cypher (FalkorDB, Memgraph, Neo4j, Kuzu 0.11.3
  archive) so a future swap is a config change.
- **Privacy** — sessions and memories contain private content. Keep DB on
  `localhost`, never expose publicly.

## 7. Open questions for user

- [ ] Approve Phase 1? (Y/N) — if Y, spawn 1-week spec
- [ ] Use FalkorDB (recommended) or Memgraph (alt) as the primary graph DB?
- [ ] Use codebase-memory-mcp (recommended) or Serena-mcp (alt) for code indexing?
- [ ] Adopt Obsidian (recommended) for daily authoring, or stick with plain
      markdown in `context/`?
- [ ] Do you want me to write the Phase-1 implementation spec in
      `specs/2026-07-02-persistent-memory-phase-1.md` next, or pause for more
      research?

## 8. References

- All citations are in the three research reports above. 80+ unique URLs across
  arXiv, GitHub READMEs, vendor blogs, and personal blogs. Stars and pushed dates
  verified via `api.github.com` on 2026-07-02.
- Cross-checked against AI-OS `CLAUDE.md` §9 (Memory), `context/02_projects.md`
  (project corpus), `context/03_preferences.md` (Spanish chat, English files).
- Local state inspected: `~/.hermes/memories/`, `~/.hermes/sessions/`, `state.db`
  (179MB), `ai-config/mcp/memory.yaml` (already configured `@modelcontextprotocol/server-memory`).