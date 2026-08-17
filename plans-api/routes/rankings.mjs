// plans-api/routes/rankings.mjs
//
// GET /api/rankings
// Returns the top-5 plans for money / learn / fun axes from
// plans-explorer/rankings.json.

export default async function rankingsRoutes(app) {
  app.get('/rankings', async () => app.rankings);
}
