#!/usr/bin/env node
import { chat, AVAILABLE_PROVIDERS } from './router.mjs';

const [cmd, ...rest] = process.argv.slice(2);

function usage() {
  console.log(`ai-os llm — local/cloud chat router (providers: ${AVAILABLE_PROVIDERS.join(', ')})

Usage:
  ai-os llm ask "<prompt>" [--provider local|minimax]
  ai-os llm test [--provider local|minimax]   # one-shot smoke check, exits non-zero on failure
`);
}

function flag(name, args) {
  const i = args.indexOf(`--${name}`);
  return i === -1 ? undefined : args[i + 1];
}

if (cmd === 'ask') {
  const prompt = rest.find((a) => !a.startsWith('--'));
  if (!prompt) {
    usage();
    process.exit(1);
  }
  const reply = await chat([{ role: 'user', content: prompt }], { provider: flag('provider', rest) });
  console.log(reply);
} else if (cmd === 'test') {
  const provider = flag('provider', rest) || process.env.AI_LLM_PROVIDER || 'local';
  const reply = await chat([{ role: 'user', content: 'reply with exactly one word: pong' }], { provider });
  const ok = reply.toLowerCase().includes('pong');
  console.log(`[${provider}] ${ok ? 'OK' : 'UNEXPECTED REPLY'} -> ${reply.trim()}`);
  process.exit(ok ? 0 : 1);
} else {
  usage();
  process.exit(cmd ? 1 : 0);
}
