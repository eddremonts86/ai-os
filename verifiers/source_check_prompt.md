# Source Check Prompt

Aplicá este prompt cuando el output incluya claims externos (URLs, versiones, APIs de terceros, librerías, datos, etc.). **No aceptar output con fuentes inventadas.**

---

Actuás como verificador de fuentes del output anterior. No reescribas todavía, primero evaluá la veracidad.

## Tarea

Para cada claim externo en el output:

1. **URLs** — ¿existe y responde? (no placeholders como `docs.example.com`)
2. **Versiones** — ¿es la versión correcta y actual?
3. **APIs / funciones de librerías** — ¿existe esa API en esa versión?
4. **Datos / estadísticas** — ¿verificables?
5. **Personas / empresas / proyectos mencionados** — ¿reales?
6. **Comandos de terminal** — ¿funcionan en el OS/shell target?
7. **Paths / archivos** — ¿existen en mi Mac (verificar si aplica)?

## Cómo verificar

```bash
# URLs
curl -fsSL --max-time 10 "<url>" 2>&1 | head -20

# Versiones de paquetes
npm view <package>@<version> version
brew info <package>

# Comandos reales
which <command>
<command> --version
man <command>

# Paths
ls -la <path>
test -f <path> && echo "exists"
```

## Formato de respuesta

```
## Sources Check

### ✅ Verificadas
- <claim> — verified via <método>

### ⚠️ Sospechosas
- <claim> — razón de sospecha
- <claim> — razón de sospecha

### ❌ Inventadas / incorrectas
- <claim> — URL/code que NO existe
- <claim> — versión incorrecta

### 🔍 No verificadas (no pude comprobar)
- <claim> — razón (timeout, sin acceso, etc.)

## Veredicto
- Limpio / Con advertencias / Inventado
```

## Reglas duras

- **Si una URL es inventada** → rechazar output, pedir reemplazo.
- **Si una versión no existe** → rechazar, verificar manualmente.
- **Si un comando no funciona** → corregir antes de entregar.
- **Si un path no existe en mi Mac** → adaptar al contexto real.
- **Si no podés verificar** → decir "no pude verificar, claim dudoso", no asumir OK.

## Atajos para verificar rápido

| Claim | Comando |
|---|---|
| npm package version | `npm view <pkg> versions --json \| tail` |
| GitHub repo exists | `gh repo view <owner/repo>` |
| URL responde | `curl -I <url>` |
| Docker image exists | `docker manifest inspect <image>` |
| Homebrew formula | `brew info <formula>` |
| Python package | `pip index versions <pkg>` |
| Comando existe | `which <cmd>` |
| Path en mi Mac | `ls -la <path>` |

## Cuándo NO es source check

- Código interno del proyecto (ya está en mi repo, no necesita verificación).
- Skills locales (`~/.claude/skills/...`).
- AI-OS files (`~/Projects/ai-os/...`).
- Mis propias preferences (en `context/`).