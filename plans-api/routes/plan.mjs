// plans-api/routes/plan.mjs
//
// GET /api/plans/:id
// Optional ?docs=1 to inline SPEC/PRODUCT/PLAN/DESIGN/TASKS bodies.

import { loadPlanDocs } from '../lib/data.js';

export default async function planRoutes(app) {
  app.get('/plans/:id', async (req, reply) => {
    const { id } = req.params;
    const plan = app.plans.find(p => p.id === id);
    if (!plan) {
      reply.code(404);
      return { error: 'not_found', id };
    }
    if (req.query.docs === '1' || req.query.docs === 'true') {
      const docs = loadPlanDocs(id);
      return { ...plan, documents: docs ?? null };
    }
    return plan;
  });
}
