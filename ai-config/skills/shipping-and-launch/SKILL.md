---
name: shipping-and-launch
description: Pre-launch checklist, feature flags con lifecycle completo, staged rollouts (canary/gradual), monitoring post-deploy, rollback plan documentado ANTES. Aplica a cualquier deploy que afecte usuarios (no triviales).
license: Internal
---

# Shipping & Launch

## Mentalidad

> "El deploy más arriesgado es el que no tiene plan de rollback."

Nunca ships a producción sin:
1. Checklist pre-launch completa.
2. Feature flags con lifecycle definido.
3. Monitoring activo en primera hora.
4. Plan de rollback documentado ANTES del deploy.
5. Triggers numéricos para rollback (no "feeling").

## Pre-launch checklist (6 secciones)

### 1. Code quality

- [ ] PR reviewed y approved
- [ ] CI pasa: lint, typecheck, unit, integration, build
- [ ] Coverage >= baseline (no bajó)
- [ ] No `console.log`, `debugger`, `TODO` en código de prod
- [ ] No secrets committed (`gitleaks detect` → 0)
- [ ] Conventional Commits message
- [ ] Branch actualizado con `main`

### 2. Security

- [ ] `pnpm audit` con 0 Critical y 0 High
- [ ] CSP configurado (Content-Security-Policy header)
- [ ] HSTS habilitado (Strict-Transport-Security)
- [ ] Rate limiting en endpoints públicos
- [ ] CORS con whitelist explícita (no `*`)
- [ ] XSS sanitization (DOMPurify antes de dangerouslySetInnerHTML)
- [ ] CSRF tokens en forms state-changing
- [ ] Inputs validados server-side (no solo client)
- [ ] Auth check en todas las rutas protegidas
- [ ] No secrets en logs ni en URLs

### 3. Performance

- [ ] Core Web Vitals dentro de presupuesto (LCP < 2.5s, FID < 100ms, CLS < 0.1)
- [ ] Bundle size < budget (ej. main chunk < 200KB gzipped)
- [ ] Images con `loading="lazy"` y formatos modernos (WebP/AVIF)
- [ ] Code splitting en rutas grandes
- [ ] DB queries con índices (no full table scans)
- [ ] N+1 queries eliminadas
- [ ] Cache apropiado (in-memory LRU para data caliente, Redis para distributed)
- [ ] CDN para assets estáticos

### 4. Accessibility

- [ ] WCAG AA compliance (color contrast >= 4.5:1 para texto normal)
- [ ] Keyboard navigation funcional (tab, enter, escape)
- [ ] ARIA labels en icon buttons
- [ ] Form labels asociados a inputs
- [ ] Focus indicators visibles
- [ ] `prefers-reduced-motion` respetado
- [ ] Screen reader test (NVDA o VoiceOver)
- [ ] No contenido solo por color

### 5. Infrastructure

- [ ] Env vars nuevas agregadas a `.env.example`
- [ ] DB migrations probadas en staging
- [ ] DB migrations son backwards-compatible (expand → contract)
- [ ] DNS configurado (si dominio nuevo)
- [ ] SSL/TLS cert válido (no expired)
- [ ] Health check endpoint (`/api/health`) responde 200
- [ ] Health check verifica dependencias (DB, Redis, external APIs)
- [ ] Auto-scaling config revisado (si aplica)
- [ ] Backup antes de migrations destructivas
- [ ] Rollback plan documentado

### 6. Documentation

- [ ] CHANGELOG actualizado
- [ ] API docs actualizadas (si endpoints cambiaron)
- [ ] README actualizado (si setup o usage cambió)
- [ ] Runbooks actualizados (si hay nuevos alerts o procedures)
- [ ] Team notificado del cambio (Slack #deploys)

## Feature flag lifecycle

```
DEPLOY OFF
   ↓ (código deployed pero feature inactiva)
ENABLE beta (5% de users internos / beta testers)
   ↓ (métricas OK por 24-48h)
CANARY 5% (5% de producción)
   ↓ (métricas OK por 24h)
GRADUAL 25% → 50% → 100%
   ↓ (métricas OK por 1 semana)
CLEAN UP (remove flag y código del feature)
```

**Reglas:**
- Cada step tiene minimum dwell time (24-48h para beta, 24h para canary, 24h entre graduales).
- Cleanup debe ocurrir **dentro de 2 semanas** post-full-rollout (sino queda como deuda).
- Flag en **default OFF** siempre (deploy sin exposición).
- Flag removible sin re-deploy (config-only).

### Implementación

```typescript
// Feature flag system (custom o vendor: LaunchDarkly, Unleash, PostHog)

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

// Uso
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
# Después de 24h OK:
vercel alias set my-deployment-url-2.vercel.app my-domain.com  # 100%
```

```bash
# AWS / Coolify con load balancer
# Agregar nueva versión al target group con weight=5
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

## Monitoring post-deploy (primera hora)

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
- Request rate (req/sec) — sudden spike o drop = problem
- Error rate (5xx %) — > 2x baseline = rollback
- P50, P95, P99 latency — > 50% increase = rollback

**USE Method (Utilization, Saturation, Errors):**
- CPU utilization — sustained > 80% = scale up
- Memory utilization — sustained > 80% = scale up o leak
- Disk I/O — saturation = slow DB
- Network I/O — saturation = DDoS o leak

### Alerts (sobre síntomas, no causas)

```yaml
# Ej: Datadog / Grafana / Sentry alerts
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

**Principio:** alertar sobre **síntomas user-facing** (high error rate), no **causas** (high DB CPU). El síntoma te dice que hay problema user-facing; la causa puede o no ser real.

## Rollback plan (ANTES del deploy)

### Trigger conditions

```yaml
rollback_triggers:
  - condition: "error_rate > 2x baseline (sostenido 5min)"
    action: "rollback automatic via Coolify / Vercel"
  - condition: "p95_latency > 1.5x baseline (sostenido 10min)"
    action: "rollback automatic"
  - condition: "security_vuln discovered"
    action: "rollback immediate, fix forward in patch"
  - condition: "data_corruption reported"
    action: "rollback + freeze writes"
  - condition: "user_complaints > 5 in first hour"
    action: "manual review, rollback si confirma"
```

### Time-to-rollback target: < 5 minutes

### Rollback procedures (una por entorno)

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
pnpm drizzle-kit rollback  # o migrate:rollback manual
# Prisma
npx prisma migrate resolve --rolled-back <migration-name>
```

### Post-rollback

- [ ] Verificar health check vuelve a OK
- [ ] Verificar error rate vuelve a baseline
- [ ] Post-mortem: ¿qué falló? ¿cómo prevenir?
- [ ] Crear ticket de follow-up
- [ ] Notificar al equipo

## NEVER ship Friday afternoon

Razón: si algo falla a las 6pm viernes, nadie está para rollback. El fin de semana se pasa en llamas.

Reglas:
- Lunes-Jueves: deploys OK
- Viernes: solo hotfixes críticos, con todo el equipo presente
- Sábado-Domingo: zero deploys (salvo emergencias)

## Errores comunes

1. ❌ Deploy sin rollback plan → 3am rollback manual caótico.
2. ❌ Feature flag default ON → exposición total al primer deploy.
3. ❌ Cleanup de flag pospuesto > 2 semanas → deuda técnica crece.
4. ❌ Health check shallow (solo "app started") → DB down no se detecta.
5. ❌ Alerts sobre causas (DB CPU high) en vez de síntomas (error rate) → alert fatigue.
6. ❌ No monitorear primera hora → bug crítico descubre user, no monitoring.
7. ❌ "Looks right, ship it" sin checklist → bug obvio en prod.
8. ❌ No tener rollback plan tested → cuando falla, no sabés cómo volver.
9. ❌ Deploy sin avisar al equipo → incidente sin comunicación.
10. ❌ Friday afternoon deploy → weekend on-call nightmare.

## Plantilla de runbook

```markdown
# Runbook: <feature-name>

## Pre-deploy
- [ ] Pre-launch checklist completa
- [ ] Rollback plan revisado
- [ ] Equipo notificado en #deploys

## Deploy
- [ ] Merge a main → CI pasa → auto-deploy
- [ ] Verificar health check 200
- [ ] Smoke tests (3-5 endpoints críticos)
- [ ] Verificar logs sin errores nuevos

## Monitor (primera hora)
- [ ] Error rate < baseline + 10%
- [ ] P95 latency < baseline + 50%
- [ ] No user complaints en #support
- [ ] No nuevos alerts

## Si rollback necesario
1. Ejecutar: `vercel rollback` / `kubectl rollout undo` / `curl POST /deploy?commit_sha=<prev>`
2. Esperar 2min, verificar health
3. Post-mortem dentro de 24h

## Contactos
- Tech lead: @user
- On-call: PagerDuty
- #deploys: https://slack.com/deploys
```

## Recursos

- [Google SRE Book — Release Engineering](https://sre.google/sre-book/release-engineering/)
- [Feature flag best practices](https://launchdarkly.com/blog/feature-flag-best-practices/)
- [RED/USE methods](https://www.brendangregg.com/methodology.html)
- Skill relacionada: `prod-deploy-verification` (pre-flight)
- Skill relacionada: `coolify-deploy` / `tanstack-start-coolify-deploy`
- Skill relacionada: `code-review-and-quality` (workspace)