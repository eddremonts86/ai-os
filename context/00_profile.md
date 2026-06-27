# 00 — Profile

## Identidad

- **Nombre:** Eduardo (Edd)
- **Ubicación:** basado en Mac (macOS 26.5.1, Apple Silicon)
- **Idiomas:** Español (nativo,日常工作) + inglés (código, docs, commits)
- **Memoria clave en Hermes:** `~/.hermes/skills/imported/*` lee preferencias de estilo

## Estilo de comunicación

- Terse Spanish, lowercase, sin ceremonias.
- "ok crea todos los docs que necesitamos" → significa "crear ya, sin pedir permiso paso a paso".
- "dame un comando para..." → dame el comando, no la explicación.
- "luce como que funciona, continua" → sigues tú, no me pidas confirmación.
- Sin "as you can see", "I'd be happy to", "I cannot" al inicio.

## Autonomía

- **Máxima autonomía con guardrails.**
- Bloquean: sudo, browser interactivo, decisiones destructivas irreversibles.
- No bloquean: install de brew casks con justificación, crear archivos en `~/Projects/`, leer configs, ejecutar comandos reversibles.

## Tiempo

- Prefiero comandos batch > pasos manuales.
- Si algo toma > 5 min de espera → usar `background=true` con `notify_on_complete=true`.
- Reports concisos, no prosa extendida.

## Skills de usuario cargadas

- `~/.claude/skills/imported:using-superpowers` (routing de skills)
- `~/.hermes/skills/imported/*` (skills de Hermes)

## Git identity

- **Personal:** `eddremonts86@gmail.com` (carpeta `~/code/personal/`)
- **Trabajo:** `ei@schilling.dk` (carpeta `~/code/work/`)

**⚠️ Quirk:** Keychain agent a veces arranca con `HOME=/var/root` en lugar de `/Users/edd`. Si falla un comando ssh, hacer:
```bash
pkill ssh-agent
HOME=/Users/edd eval "$(ssh-agent)"
ssh-add ~/.ssh/id_ed25519  # absolute path
```