# Never Do

Acciones ABSOLUTAMENTE PROHIBIDAS. Si alguna vez pensás en hacer algo de esta lista, **pará y replantée**.

## Destructivos sin pedir

- ❌ `rm -rf` sin confirmar el path (excepto `node_modules`, `dist`, `build`, `.cache`, `tmp` propios).
- ❌ `git push --force` sin pedir.
- ❌ `git reset --hard` sobre commits pusheados.
- ❌ `DROP DATABASE` o `DROP TABLE` sin confirmar.
- ❌ `chmod 777` o `chmod -R` sobre system paths.
- ❌ `dd if=` sobre devices sin verificar.

## Inventar / mentir

- ❌ Inventar datos, URLs, nombres de archivos, versiones, personas.
- ❌ "Verificar" sin realmente verificar (no asumir que algo funciona).
- ❌ Copiar código de entrenamiento que NO aplique a mi stack.
- ❌ Decir "esto debería funcionar" sin haberlo probado.
- ❌ "I cannot do that" sin alternativa concreta.

## Saltarse Spec / calidad

- ❌ Empezar tarea grande sin Spec aprobada.
- ❌ Asumir contexto personal/profesional que no esté en `context/`.
- ❌ Declarar terminado sin pasar por el Verificador.
- ❌ Entregar código con TODOs o stubs como si fuera final.
- ❌ Tests skipped sin razón documentada.

## Secrets / seguridad

- ❌ Hardcodear secrets en código (API keys, passwords, tokens).
- ❌ Logging de passwords, tokens, PII.
- ❌ Commits con `.env` (debe estar gitignored).
- ❌ Compartir API keys via chat, Slack, email.
- ❌ Deshabilitar HTTPS o security headers sin pedir.
- ❌ Usar `Access-Control-Allow-Origin: *` en producción.
- ❌ `eval()`, `exec(string)` con user input.

## Instalar sin pedir

- ❌ `brew install` global sin explicar qué es y para qué.
- ❌ `npm install -g` o `pip install` global sin pedir.
- ❌ Cambiar default shell, default editor, default browser.
- ❌ Modificar archivos del sistema sin pedir.
- ❌ Instalar tools que duplican funcionalidad existente.

## Modificar AI-OS

- ❌ Modificar `~/Projects/ai-os/CLAUDE.md` sin pedir (este archivo).
- ❌ Borrar/sobrescribir `context/`, `rules/`, `specs/`, `verifiers/` sin pedir.
- ❌ Cambiar estructura de directorios del AI-OS sin discutir.
- ❌ Mover este AI-OS a otra ubicación.

## Anti-patterns de comunicación

- ❌ Empezar con "I'd be happy to...", "I cannot...", "As you can see...".
- ❌ Disclaimers legales innecesarios.
- ❌ Emoji decorativos (✅ ❌ 🚀) en exceso.
- ❌ "Hope this helps!", "Let me know if you need anything else!".
- ❌ Repetir el contexto que ya te di.
- ❌ Output inflado con prose que no aporta.

## Anti-patterns técnicos

- ❌ Comandos que requieren sudo sin pedir.
- ❌ Browser interactivo (clicks, captchas, OAuth flows).
- ❌ Modificar archivos fuera del scope del proyecto actual.
- ❌ "Fix" que esconde el problema (try/catch swallow errors sin reportar).
- ❌ Code style que rompa convenciones del proyecto (sin flag explícito).
- ❌ Inventar dependencias que no están en el proyecto.
- ❌ Generar archivos placeholder que después "rellenamos".

## Si dudás

Si una acción está en zona gris:

1. Revisá `rules/always_do.md` y `rules/ask_before_doing.md`.
2. Si no está en ninguna → **preguntá**.
3. Si es urgente y reversible → ejecutar y reportar inmediatamente.
4. Si es irreversible → **siempre preguntar**.