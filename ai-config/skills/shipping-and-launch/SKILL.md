---
name: shipping-and-launch
description: Pre-launch checklist, feature flags with full lifecycle, staged rollouts (canary/gradual), post-deploy monitoring, rollback plan documented BEFORE. Applies to any deploy that affects users (non-trivial).
license: Internal
---

# Shipping & Launch

## Mindset

> "The riskiest deploy is the one without a rollback plan."

Never ship to production without:
1. Complete pre-launch checklist.
2. Feature flags with defined lifecycle.
3. Active monitoring during the first hour.
4. Rollback plan documented BEFORE the deploy.
5. Numeric triggers for rollback (not "feeling").

## Pre-launch checklist (6 sections)

### 1. Code quality

- [ ] PR reviewed and approved
- [ ] CI passes: lint, typecheck, unit, integration, build
- [ ] Coverage >= baseline (did not drop)
- [ ] No `console.log`, `debugger`, `TODO` in prod code
- [ ] No secrets committed (`gitleaks detect` → 0)
- [ ] Conventional Commits message
- [ ] Branch updated with `main`

### 2. Security

- [ ] `pnpm audit` with 0 Critical and 0 High
- [ ] CSP configured (Content-Security-Policy header)
- [ ] HSTS enabled (Strict-Transport-Security)
- [ ] Rate limiting on public endpoints
- [ ] CORS with explicit whitelist (no `*`)
- [ ] XSS sanitization (DOMPurify before dangerouslySetInnerHTML)
- [ ] CSRF tokens on state-changing forms
- [ ] Inputs validated server-side (not only client)
- [ ] Auth check on all protected routes
- [ ] No secrets in logs or URLs

### 3. Performance

- [ ] Core Web Vitals within budget (LCP < 2.5s, FID < 100ms, CLS < 0.1)
- [ ] Bundle size < budget (e.g. main chunk < 200KB gzipped)
- [ ] Images with `loading="lazy"` and modern formats (WebP/AVIF)
- [ ] Code splitting on large routes
- [ ] DB queries with indexes (no full table scans)
- [ ] N+1 queries eliminated
- [ ] Appropriate cache (in-memory LRU for hot data, Redis for distributed)
- [ ] CDN for static assets

### 4. Accessibility

- [ ] WCAG AA compliance (color contrast >= 4.5:1 for normal text)
- [ ] Functional keyboard navigation (tab, enter, escape)
- [ ] ARIA labels on icon buttons
- [ ] Form labels associated with inputs
- [ ] Visible focus indicators
- [ ] `prefers-reduced-motion` respected
- [ ] Screen reader test (NVDA or VoiceOver)
- [ ] No content conveyed by color alone

### 5. Infrastructure

- [ ] New env vars added to `.env.example`
- [ ] DB migrations tested in staging
- [ ] DB migrations are backwards-compatible (expand → contract)
- [ ] DNS configured (if new domain)
- [ ] SSL/TLS cert valid (not expired)
- [ ] Health check endpoint (`/api/health`) responds 200
- [ ] Health check verifies dependencies (DB, Redis, external APIs)
- [ ] Auto-scaling config reviewed (if applicable)
- [ ] Backup before destructive migrations
- [ ] Rollback plan documented

### 6. Documentation

- [ ] CHANGELOG updated
- [ ] API docs updated (if endpoints changed)
- [ ] README updated (if setup or usage changed)
- [ ] Runbooks updated (if there are new alerts or procedures)
- [ ] Team notified of the change (Slack #deploys)

## Feature flag lifecycle

```
DEPLOY OFF
   ↓ (code deployed but feature inactive)
ENABLE beta (5% of internal users / beta testers)
   ↓ (metrics OK for 24-48h)
CANARY 5% (5% of production)
   ↓ (metrics OK for 24h)
GRADUAL 25% → 50% → 100%
   ↓ (metrics OK for 1 week)
CLEAN UP (remove flag and feature code)
```

**Rules:**
- Each step has minimum dwell time (24-48h for beta, 24h for canary, 24h between graduals).
- Cleanup must occur **within 2 weeks** post-full-rollout (otherwise it becomes debt).
- Flag in **default OFF** always (deploy without exposure).
- Flag removable without re-deploy (config-only).

### Implementation

```typescript
// Feature flag system (custom or vendor: LaunchDarkly, Unleash, PostHog)

interface FeatureFlags {
  'new-dashboard': boolean;
  'beta-search': { enabled: boolean; cohortPercent: number };
  'experimental-ai': false;  // default OFF
}

const flags: FeatureFlags = {
  'new-dashboard': getBool('FF_NEW_DASHBOARD', false),
  'beta-search': {
    enabled: getBool('FF_BETA_SEARCH', false),
    cohortPercent: getInt('FF_BETA_SEARCH_COHORT', 5),
  },
  'experimental-ai': false,
};

function isFeatureEnabled(flag: keyof FeatureFlags, userId: string): boolean {
  const flagConfig = flags[flag];
  
  if (typeof flagConfig === 'boolean') return flagConfig;
  if (typeof flagConfig === 'object' && 'enabled' in flagConfig) {
    if (!flagConfig.enabled) return false;
    return hashUserId(userId) % 100 < flagConfig.cohortPercent;
  }
  return false;
}

// Usage
if (isFeatureEnabled('new-dashboard', user.id)) {
  return <NewDashboard />;
}
return <OldDashboard />;
```

## Staged rollouts

### Canary (5% traffic)

```bash
# Vercel
vercel --target production
vercel alias set my-deployment-url.vercel.app my-domain.com  # 5%
# After 24h OK:
vercel alias set my-deployment-url-2.vercel.app my-domain.com  # 100%
```

```bash
# AWS / Coolify with load balancer
# Add new version to target group with weight=5
aws elbv2 modify-listener --listener-arn ... --default-actions Type=forward,ForwardConfig={TargetGroups=[{TargetGroupArn=$OLD,Weight=95},{TargetGroupArn=$NEW,Weight=5}]}
```

### Gradual (25% → 50% → 100%)

```bash
# Day 1: 25%
aws elbv2 modify-listener --listener-arn ... --default-actions '...Weight=75,Weight=25...'

# Day 2: 50%
aws elbv2 modify-listener --listener-arn ... --default-actions '...Weight=50,Weight=50...'

# Day 3: 100%
aws elbv2 modify-listener --listener-arn ... --default-actions '...Weight=0,Weight=100...'
```

## Post-deploy monitoring (first hour)

### Health endpoint

```typescript
// Deep health check
app.get('/api/health', async (req, res) => {
  const checks = {
    app: { status: 'ok' },
    db: { status: 'unknown' },
    redis: { status: 'unknown' },
  };
  
  try {
    await db.ping();
    checks.db.status = 'ok';
  } catch (e) {
    checks.db.status = 'error';
    checks.db.error = e.message;
  }
  
  try {
    await redis.ping();
    checks.redis.status = 'ok';
  } catch (e) {
    checks.redis.status = 'error';
    checks.redis.error = e.message;
  }
  
  const allOk = Object.values(checks).every(c => c.status === 'ok');
  res.status(allOk ? 200 : 503).json(checks);
});
```

### Metrics to watch

**RED Method (Rate, Errors, Duration):**
- Request rate (req/sec) — sudden spike or drop = problem
- Error rate (5xx %) — > 2x baseline = rollback
- P50, P95, P99 latency — > 50% increase = rollback

**USE Method (Utilization, Saturation, Errors):**
- CPU utilization — sustained > 80% = scale up
- Memory utilization — sustained > 80% = scale up or leak
- Disk I/O — saturation = slow DB
- Network I/O — saturation = DDoS or leak

### Alerts (on symptoms, not causes)

```yaml
# Example: Datadog / Grafana / Sentry alerts
- alert: HighErrorRate
  condition: error_rate > 0.05 (5%) for 5min
  severity: page
  runbook: https://wiki/runbooks/high-error-rate

- alert: HighLatencyP95
  condition: p95_latency > 1000ms for 10min
  severity: warn
  runbook: https://wiki/runbooks/high-latency

- alert: HealthCheckFailed
  condition: health_check.status != 200 for 2min
  severity: page
  runbook: https://wiki/runbooks/health-check-failed
```

**Principle:** alert on **user-facing symptoms** (high error rate), not **causes** (high DB CPU). The symptom tells you there is a user-facing problem; the cause may or may not be real.

## Rollback plan (BEFORE the deploy)

### Trigger conditions

```yaml
rollback_triggers:
  - condition: "error_rate > 2x baseline (sustained 5min)"
    action: "rollback automatic via Coolify / Vercel"
  - condition: "p95_latency > 1.5x baseline (sustained 10min)"
    action: "rollback automatic"
  - condition: "security_vuln discovered"
    action: "rollback immediate, fix forward in patch"
  - condition: "data_corruption reported"
    action: "rollback + freeze writes"
  - condition: "user_complaints > 5 in first hour"
    action: "manual review, rollback if confirmed"
```

### Time-to-rollback target: < 5 minutes

### Rollback procedures (one per environment)

**Vercel:**
```bash
vercel rollback  # rolls back to previous deployment
```

**Coolify:**
```bash
# Dashboard: Application → Deployments → click previous → Redeploy
# API:
curl -X POST "http://<server>/api/v1/deploy?uuid=<app-uuid>&commit_sha=<previous-commit>"
```

**Kubernetes:**
```bash
kubectl rollout undo deployment/app
```

**Database migrations:**
```bash
# Drizzle
pnpm drizzle-kit rollback  # or migrate:rollback manual
# Prisma
npx prisma migrate resolve --rolled-back <migration-name>
```

### Post-rollback

- [ ] Verify health check returns to OK
- [ ] Verify error rate returns to baseline
- [ ] Post-mortem: what failed? how to prevent?
- [ ] Create follow-up ticket
- [ ] Notify the team

## NEVER ship Friday afternoon

Reason: if something fails at 6pm Friday, no one is around for rollback. The weekend is spent on fire.

Rules:
- Monday-Thursday: deploys OK
- Friday: only critical hotfixes, with the whole team present
- Saturday-Sunday: zero deploys (except emergencies)

## Common mistakes

1. ❌ Deploy without rollback plan → 3am chaotic manual rollback.
2. ❌ Feature flag default ON → full exposure on first deploy.
3. ❌ Flag cleanup postponed > 2 weeks → tech debt grows.
4. ❌ Shallow health check (only "app started") → DB down not detected.
5. ❌ Alerts on causes (DB CPU high) instead of symptoms (error rate) → alert fatigue.
6. ❌ Not monitoring first hour → critical bug discovered by user, not monitoring.
7. ❌ "Looks right, ship it" without checklist → obvious bug in prod.
8. ❌ No tested rollback plan → when it fails, you don't know how to revert.
9. ❌ Deploy without notifying team → incident without communication.
10. ❌ Friday afternoon deploy → weekend on-call nightmare.

## Runbook template

```markdown
# Runbook: <feature-name>

## Pre-deploy
- [ ] Pre-launch checklist complete
- [ ] Rollback plan reviewed
- [ ] Team notified in #deploys

## Deploy
- [ ] Merge to main → CI passes → auto-deploy
- [ ] Verify health check 200
- [ ] Smoke tests (3-5 critical endpoints)
- [ ] Verify logs without new errors

## Monitor (first hour)
- [ ] Error rate < baseline + 10%
- [ ] P95 latency < baseline + 50%
- [ ] No user complaints in #support
- [ ] No new alerts

## If rollback necessary
1. Run: `vercel rollback` / `kubectl rollout undo` / `curl POST /deploy?commit_sha=<prev>`
2. Wait 2min, verify health
3. Post-mortem within 24h

## Contacts
- Tech lead: @user
- On-call: PagerDuty
- #deploys: https://slack.com/deploys
```

## Resources

- [Google SRE Book — Release Engineering](https://sre.google/sre-book/release-engineering/)
- [Feature flag best practices](https://launchdarkly.com/blog/feature-flag-best-practices/)
- [RED/USE methods](https://www.brendangregg.com/methodology.html)
- Related skill: `prod-deploy-verification` (pre-flight)
- Related skill: `coolify-deploy` / `tanstack-start-coolify-deploy`
- Related skill: `code-review-and-quality` (workspace)