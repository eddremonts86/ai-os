// apps/plans-api/server.mjs
//
// Fastify bootstrap. Loads plans.json + rankings.json + meta.json into
// memory at startup, registers CORS, mounts routes under /api/*, and
// listens on PLANS_API_PORT (default 8787).
//
// Auth: every /api/* route requires a Bearer token from PLANS_API_TOKEN
// (read from process.env at boot, or from ~/.hermes/.env). /health stays
// open so monitors and load balancers don't need credentials.
//
// Rate limit: /api/* is also capped per IP (RATE_LIMIT_MAX per
// RATE_LIMIT_WINDOW_MS). This is read-only — nothing here can be
// corrupted by a flood — but the token is a shared secret handed to at
// least one external consumer (builderhunt), and unlike submission-api's
// hand-rolled per-IP limiter this app already depends on Fastify, so
// @fastify/rate-limit is the one-line answer: same idea (per-IP, in
// memory, resets on restart), same TRUST_PROXY-gated proxy trust,
// exercised by Fastify's own well-tested request.ip resolution instead of
// a second XFF parser to keep in sync with the first.

import { readFileSync, existsSync } from 'node:fs';
import { homedir } from 'node:os';
import { join } from 'node:path';
import { timingSafeEqual } from 'node:crypto';
import Fastify from 'fastify';
import cors from '@fastify/cors';
import rateLimit from '@fastify/rate-limit';
import { loadAll } from './lib/data.js';
import plansRoutes from './routes/plans.mjs';
import planRoutes from './routes/plan.mjs';
import rankingsRoutes from './routes/rankings.mjs';
import facetsRoutes from './routes/facets.mjs';
import statsRoutes from './routes/stats.mjs';

const PORT = parseInt(process.env.PLANS_API_PORT, 10) || 8787;
const HOST = process.env.PLANS_API_HOST || '0.0.0.0';

// Token resolution order:
//   1. PLANS_API_TOKEN env var (preferred for systemd / launchd / CI)
//   2. ~/.hermes/.env key=value (for local dev — Hermes convention)
// If neither is set, the server refuses to start.
function resolveToken() {
  if (process.env.PLANS_API_TOKEN) return process.env.PLANS_API_TOKEN;
  const envPath = join(homedir(), '.hermes', '.env');
  if (!existsSync(envPath)) return null;
  const m = readFileSync(envPath, 'utf8').match(/^PLANS_API_TOKEN=(\S+)/m);
  return m ? m[1] : null;
}

const TOKEN = resolveToken();
if (!TOKEN) {
  console.error('PLANS_API_TOKEN is not set.');
  console.error('Generate one with:  node -e "console.log(require(\'crypto\').randomBytes(32).toString(\'hex\'))"');
  console.error('Then add to ~/.hermes/.env:  PLANS_API_TOKEN=<value>');
  process.exit(1);
}
const TOKEN_BUF = Buffer.from(TOKEN, 'utf8');

// Only when TRUST_PROXY is set — correct behind this box's Traefik, wrong
// anywhere the service is directly reachable, same rule submission-api's
// clientIp() follows for the same header. With it on, Fastify's own
// request.ip (and therefore the rate limiter's default keyGenerator)
// resolves from X-Forwarded-For instead of the socket, which would
// otherwise be Traefik's own address for every client.
const app = Fastify({
  trustProxy: process.env.TRUST_PROXY === '1',
  logger: {
    level: process.env.PLANS_API_LOG || 'info'
  }
});

await app.register(cors, {
  origin: '*',
  methods: ['GET'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  maxAge: 86400
});

// One-time data load at boot.
app.addHook('onReady', async () => {
  const snap = loadAll();
  app.plans = snap.plans;
  app.rankings = snap.rankings;
  app.meta = snap.meta;
  app.dataMtime = snap.mtime;
  app.dataDir = snap.dataDir;
  app.log.info({
    plans: snap.plans.length,
    dataDir: snap.dataDir,
    mtime: snap.mtime
  }, 'plans corpus loaded');
});

// Bearer-token check. Scoped via opts.prefix to /api/* so /health stays
// open. timingSafeEqual keeps the check constant-time.
app.addHook('onRequest', async (req, reply) => {
  if (!req.url.startsWith('/api/')) return;  // /health and friends stay open
  const auth = req.headers.authorization;
  if (!auth || !auth.startsWith('Bearer ')) {
    reply.header('WWW-Authenticate', 'Bearer realm="plans-api"');
    reply.code(401);
    return { error: 'unauthorized', detail: 'missing or malformed Authorization header' };
  }
  const provided = Buffer.from(auth.slice('Bearer '.length), 'utf8');
  if (provided.length !== TOKEN_BUF.length || !timingSafeEqual(provided, TOKEN_BUF)) {
    reply.header('WWW-Authenticate', 'Bearer realm="plans-api", error="invalid_token"');
    reply.code(401);
    return { error: 'unauthorized', detail: 'invalid token' };
  }
});

// Routes — mounted under /api/* so the auth hook above applies. Wrapped in
// one encapsulated context (Fastify's own scoping mechanism) so the rate
// limiter registered inside it decorates only these routes, not /health.
await app.register(async (api) => {
  await api.register(rateLimit, {
    max: Number(process.env.RATE_LIMIT_MAX || 60),
    timeWindow: Number(process.env.RATE_LIMIT_WINDOW_MS || 60_000)
  });
  await api.register(plansRoutes);
  await api.register(planRoutes);
  await api.register(rankingsRoutes);
  await api.register(facetsRoutes);
  await api.register(statsRoutes);
}, { prefix: '/api' });

// Liveness probe — public, no auth.
app.get('/health', async () => ({ status: 'ok', plans: app.plans?.length ?? 0 }));

// Default 5-min cache for successful GETs.
app.addHook('onSend', async (_req, reply, payload) => {
  if (reply.statusCode < 400) {
    reply.header('Cache-Control', 'public, max-age=300');
  }
  return payload;
});

try {
  await app.listen({ port: PORT, host: HOST });
} catch (err) {
  app.log.error(err);
  process.exit(1);
}
