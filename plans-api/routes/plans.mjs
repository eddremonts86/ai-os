// plans-api/routes/plans.mjs
//
// GET /api/plans
// Query params: q, tech, category, tag, country, wtp_min, wtp_max,
//               sort, limit, offset

import { filterPlans } from '../lib/data.js';

export default async function plansRoutes(app) {
  app.get('/plans', async (req, reply) => {
    const out = filterPlans(app.plans, req.query);
    return out;
  });
}
