# Ask Before Doing

Acciones donde SIEMPRE debes pedirme confirmación explícita antes de ejecutar. Cada item incluye el formato esperado.

## Formato de pregunta

```
Voy a: <acción concreta>
Razón: <por qué es necesaria>
Reversible: sí/no (cómo deshacer si sí)
Alternativa: <si hay opción menos invasiva>
¿Procedo?
```

## Sistema / Instalación

- **Instalar tools globales nuevas** (brew, npm -g, pip, etc.)
  - Explicar qué hace y por qué la necesito.
- **Cambiar `~/.zshrc`, `~/.gitconfig`, `~/.bash_profile`, `~/.config/`, `~/.ssh/`**
  - Mostrar el diff propuesto antes.
- **Cambiar default shell, default editor, default browser.**
- **Modificar permisos del sistema** (`chmod 777`, `sudo`).
- **Modificar `.env` global** o `~/.hermes/.env`.

## Git / Version control

- **`git push --force`** o `--force-with-lease` (en cualquier rama).
- **`git reset --hard`** en commits que ya están pusheados.
- **`git rebase` interactivo** sobre commits compartidos.
- **Cambiar git config** (user.name, user.email, alias globales).
- **Cambiar remote URL.**
- **Borrar tags o branches remotos.**

## Datos / Archivos

- **`rm -rf`** sobre paths que no son `node_modules`, `dist`, `build`, `.cache`, `tmp`.
- **`DROP DATABASE`, `DROP TABLE`, `DELETE FROM`** sin WHERE en producción.
- **Mover o renombrar** archivos fuera del proyecto actual.
- **Sobrescribir** archivos existentes importantes (CLAUDE.md, README.md, configs).
- **Cambiar permisos** con `chmod -R`.

## Deploy / Producción

- **Deploy a producción** (cualquier comando que afecte ambiente prod).
- **Push a main/master** de un proyecto (puedo preferir PR + review).
- **Migrations en prod** sin backup previo.
- **Cambiar variables de entorno en prod.**
- **Modificar infrastructure as code** (terraform, pulumi, kubernetes manifests) en prod.

## Seguridad / Privacidad

- **Publicar commits** que contengan secrets, PII, o info personal.
- **Generar tokens** o API keys para servicios externos.
- **Logging de datos sensibles** (passwords, tokens, PII).
- **Compartir mi Mac con otros** vía VNC, sshd, o remote desktop.

## Otros

- **Modificar este AI-OS** (`CLAUDE.md`, `rules/`, `context/`) sin pedir.
- **Cambiar permisos de archivos** del sistema (excepto `chmod +x` para scripts propios).
- **Eliminar archivos en `~/Projects/ai-os/`** excepto `outputs/` y `archive/`.
- **Cualquier acción que afecte OTROS proyectos** fuera del scope de la tarea actual.

## Cómo pedir

- Una pregunta por chat es OK.
- Múltiples acciones relacionadas → agrupar en una sola pregunta.
- Si hay urgencia clara ("rompiste algo, fix ya") → ejecutar reversible, reportar.
- Si es ambigua → proponer 2-3 opciones numeradas, esperar elección.