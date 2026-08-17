// plans-api/server.mjs
//
// Fastify bootstrap. Loads plans.json + rankings.json + meta.json into
// memory at startup, registers CORS, mounts routes under /api/*, and
// listens on PLANS_API_PORT (default 8787).

import Fastify from 'fastify';
import cors from '@fastify/cors';
import { loadAll } from './lib/data.js';
import plansRoutes from './routes/plans.mjs';
import planRoutes from './routes/plan.mjs';
import rankingsRoutes from './routes/rankings.mjs';
import facetsRoutes from './routes/facets.mjs';
import statsRoutes from './routes/stats.mjs';

const PORT = parseInt(process.env.PLANS_API_PORT, 10) || 8787;
const HOST = process.env.PLANS_API_HOST || '0.0.0.0';

const app = Fastify({
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

// One-time data load at boot. Snapshot is shared across requests via
// app.plans / app.rankings / app.meta (set in onLoad below).
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

await app.register(plansRoutes, { prefix: '/api' });
await app.register(planRoutes, { prefix: '/api' });
await app.register(rankingsRoutes, { prefix: '/api' });
await app.register(facetsRoutes, { prefix: '/api' });
await app.register(statsRoutes, { prefix: '/api' });

// Liveness probe — separate from /api so monitors don't need to know the
// data shape.
app.get('/health', async () => ({ status: 'ok', plans: app.plans?.length ?? 0 }));

// Default 5-min cache for all GETs (data refreshes on scraper cron, not in
// real-time; the explorer app re-builds plans.json and we re-snapshot on
// next start).
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
