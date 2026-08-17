// plans-api/routes/facets.mjs
//
// GET /api/facets
// Returns unique values + counts for tech[], tags[], category, country.
// Used by faceted UIs to populate filter chips.

import { buildFacets } from '../lib/data.js';

export default async function facetsRoutes(app) {
  app.get('/facets', async () => {
    return buildFacets(app.plans);
  });
}
