#!/usr/bin/env node
/**
 * Provider-swappable chat client: local Ollama (gemma3:12b, on the same native
 * daemon AI-OS already runs for memory-stack embeddings, :11500) or MiniMax's
 * OpenAI-compatible endpoint. Both speak the same /chat/completions shape, so
 * switching providers is a base URL + key, not a different client.
 *
 * gemma3, not qwen3: this daemon runs a single request slot (Ollama's default
 * concurrency), and qwen3 is a "thinking" model — one verbose reasoning trace
 * blocks every other caller (router.mjs, opencode, open-webui) until it
 * finishes, observed for real on 2026-09-19 (a stuck open-webui chat froze the
 * whole daemon). gemma3 has no thinking mechanism at all — structurally
 * incapable of that failure mode, not just configured to avoid it (gemma4 has
 * the same problem: `think: false` still emits an empty think block, it
 * doesn't remove the phase). See llm/README.md's "Model selection, final
 * state" for the full reasoning and the earlier qwen3 tool-use trial this
 * model is unrelated to (plain chat only, no tool use here either way).
 *
 * This is the reference implementation for the AI_LLM_PROVIDER convention in
 * dev-env/env-config/.env.example — copy this file into another app to reuse
 * the same switch there.
 */

const PROVIDERS = {
  local: () => ({
    baseUrl: process.env.AI_OLLAMA_NATIVE_BASE_URL || 'http://localhost:11500/v1',
    model: process.env.AI_OLLAMA_NATIVE_MODEL || 'gemma3:12b',
    apiKey: null,
  }),
  minimax: () => ({
    baseUrl: process.env.MINIMAX_BASE_URL || 'https://api.minimaxi.chat/v1',
    model: process.env.MINIMAX_MODEL || 'MiniMax-M3',
    apiKey: process.env.MINIMAX_API_KEY || null,
  }),
};

export const AVAILABLE_PROVIDERS = Object.keys(PROVIDERS);

export async function chat(messages, { provider, model, ...opts } = {}) {
  const name = provider || process.env.AI_LLM_PROVIDER || 'local';
  const build = PROVIDERS[name];
  if (!build) {
    throw new Error(`unknown llm provider "${name}" (expected: ${AVAILABLE_PROVIDERS.join(', ')})`);
  }
  const cfg = build();
  if (name === 'minimax' && !cfg.apiKey) {
    throw new Error('MINIMAX_API_KEY is not set (dev-env/env-config/.env section 5)');
  }

  const res = await fetch(`${cfg.baseUrl}/chat/completions`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      ...(cfg.apiKey ? { Authorization: `Bearer ${cfg.apiKey}` } : {}),
    },
    body: JSON.stringify({ model: model || cfg.model, messages, ...opts }),
  });

  if (!res.ok) {
    throw new Error(`${name} llm call failed: ${res.status} ${await res.text()}`);
  }
  const json = await res.json();
  return json.choices?.[0]?.message?.content ?? '';
}
