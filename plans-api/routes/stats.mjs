// plans-api/routes/stats.mjs
//
// GET /api/stats
// Returns corpus totals + last refresh + distribution summary.

export default async function statsRoutes(app) {
  app.get('/stats', async () => {
    const plans = app.plans;
    const withWtp = plans.filter(p => p.wtp?.mrrMid != null).length;
    const withMoney = plans.filter(p => p.scores?.money != null).length;
    const withLearn = plans.filter(p => p.scores?.learn != null).length;
    const withFun   = plans.filter(p => p.scores?.fun   != null).length;
    const withTech  = plans.filter(p => (p.tech?.length ?? 0) > 0).length;
    const withCountry = plans.filter(p => p.country).length;
    return {
      total: plans.length,
      withWtp,
      withTech,
      withCountry,
      scores: { money: withMoney, learn: withLearn, fun: withFun },
      lastRefresh: app.dataMtime?.toISOString() ?? null,
      generatedAt: app.meta?.generatedAt ?? null,
      dataDir: app.dataDir
    };
  });
}
