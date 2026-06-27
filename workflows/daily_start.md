# Daily Start

Workflow para arrancar cualquier sesión de trabajo conmigo.

> **Prerrequisito:** tener las 14 superpowers skills instaladas (ver `~/Projects/ai-os/CLAUDE.md` sección 16). Sin ellas, este workflow se ejecuta de forma incompleta.

## Cuándo usar

- Inicio de sesión en cualquier CLI (Claude Code, Hermes, Codex, Gemini, Antigravity).
- Cuando vuelvo de un descanso y retomo trabajo.
- Cuando cambio de proyecto o contexto.

## Pasos

### 1. Cargar AI-OS

Lee en este orden:

1. `~/Projects/ai-os/CLAUDE.md` — instrucciones maestras.
2. `~/Projects/ai-os/context/00_profile.md` — quién soy.
3. `~/Projects/ai-os/context/02_projects.md` — proyectos activos (si vamos a tocar uno).
4. `~/Projects/ai-os/context/03_preferences.md` — estilo.
5. `~/Projects/ai-os/rules/never_do.md` — reglas absolutas.
6. `~/Projects/ai-os/specs/current_spec.md` — si hay Spec activa.

**Tiempo objetivo:** < 2 min para tener el contexto cargado.

### 2. → Load skill `using-superpowers`

**Siempre** al inicio. Esta skill es el router que decide qué otras superpowers skills cargar según la tarea que pida el user.

**Si no está instalada →** workflow degradado: el agente decide solo qué skill cargar (menos confiable).

### 3. Verificar Spec activa

- Si `current_spec.md` tiene contenido → preguntar: "¿continuamos con la Spec activa o arrancamos algo nuevo?"
- Si está vacía → "¿qué tarea querés hacer hoy?"

### 4. Cargar skills relevantes

Basado en el tipo de tarea anticipada, cargar **en este orden**:

| Tarea | Skills a cargar (orden) |
|---|---|
| Frontend React/TypeScript | `using-superpowers` → `react-patterns` + `tanstack-patterns` + `shadcn-patterns` + `typescript-advanced` + `frontend-design` |
| Wave/Schilling | `wave-template-conventions` + `tanstack-patterns` + `react-patterns` |
| Backend Node | `env-config-and-secrets` + `debugging-and-error-recovery` + `code-review-and-quality` |
| Drupal | `drupal8-pattern` + `debugging-and-error-recovery` |
| Deploy/Coolify | `coolify-deploy` + `coolify-env-sync-and-postdeploy` + `prod-deploy-verification` + `pnpm-docker-deploy` |
| Hetzner | `hetzner-cloud-cli` + `prod-fleet-register` |
| Code review | `code-review-and-quality` + `owasp-security` |
| Debugging | → load `debugging-and-error-recovery` + `systematic-debugging` |
| Setup nuevo proyecto | `wave-template-conventions` + `pnpm-docker-deploy` + `tanstack-start-coolify-deploy` |
| Diseño/UX | `frontend-design` + `taste-skill` (si aplica) + `impeccable` |
| Open-design | `open-design-integration` + `frontend-design` |
| Múltiples skills | `using-superpowers` primero (routing) |
| Tarea ambigua | → load `brainstorming` antes de decidir skills específicas |

**Regla:** la primera skill siempre es `using-superpowers` (router). Las demás son específicas del área.

### 5. Verificar entorno

```bash
# Estado del shell
zsh --version
echo $ZSH_THEME  # debería ser powerlevel10k/powerlevel10k

# Paths
which brew node pnpm uv hcloud

# Sin Spec activa → preguntar: "¿qué tarea querés hacer?"
```

### 6. Preguntar la tarea

Si no hay Spec activa:

```
"Hola. Contexto cargado. ¿Qué tarea querés hacer hoy?"

Opciones que puedo proponer:
- "Tenemos Spec activa en current_spec.md, ¿continuamos?"
- "Veo <proyecto activo>, ¿trabajamos ahí?"
- "Empezamos con algo nuevo? Te ayudo a crear la Spec."
```

### 7. Briefing final

Antes de empezar, hacer un briefing de 1-2 frases:

```
"Listo. Tengo cargado: contexto, reglas, skills para <área>. Voy a <primer paso>."
```

---

## Output esperado al final

```markdown
## Sesión iniciada

- **Contexto:** CLAUDE.md + 6 archivos de context + rules loaded.
- **Skills:** <lista de skills cargadas>
- **Spec activa:** <sí/no, link si sí>
- **Tarea:** <resumen en 1 frase>

¿Empezamos?
```

## Notas

- Si el user dice "ok arranca" o "go" sin más contexto → interpretar como "ir a paso 6, preguntar tarea".
- Si el user empieza con un comando directo → skip pasos 1-4 (asumir que ya cargó contexto).
- Si el user ya está en medio de una Spec → skip a paso 3.
- **Si `using-superpowers` no carga** → avisar: "workflow degradado, sin router; dame la tarea directo."