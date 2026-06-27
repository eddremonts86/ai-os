Quiero que me ayudes a implementar en mi macOS un sistema de trabajo con IA basado en el método de Andrej Karpathy explicado en el video: Spec + Verificador + Entorno.

Tu objetivo es ayudarme a crear un “AI Operating System” local en mi Mac para que cada vez que trabaje contigo no tenga que repetir todo mi contexto desde cero.

Trabaja bajo esta carpeta principal:

~/Projects/ai-os

Quiero que me guíes paso a paso, pero no quiero teoría larga. Quiero que produzcas archivos útiles, estructura clara y prompts reutilizables.

Primero, entrevístame para descubrir mi objetivo real. Hazme preguntas sobre:

1. Quién soy y a qué me dedico.
2. Qué tipo de trabajo quiero delegar o acelerar con IA.
3. Qué proyectos tengo activos.
4. Qué estilo de respuesta prefiero.
5. Qué herramientas uso en macOS.
6. Qué cosas la IA siempre debe hacer.
7. Qué cosas debe preguntarme antes de hacer.
8. Qué cosas nunca debe hacer.
9. Qué criterios uso para decir que un resultado es bueno.
10. Qué tareas repetitivas debería convertir en “skills”.

Después de entrevistarme, crea esta estructura de carpetas:

~/Projects/ai-os/
  CLAUDE.md
  context/
    00_profile.md
    01_business_or_work.md
    02_projects.md
    03_preferences.md
    04_tools.md
    05_sources.md
  specs/
    spec_template.md
    current_spec.md
  verifiers/
    quality_checklist.md
    critic_prompt.md
    source_check_prompt.md
  skills/
    README.md
    skill_template.md
  rules/
    always_do.md
    ask_before_doing.md
    never_do.md
  workflows/
    daily_start.md
    project_start.md
    content_creation.md
    research.md
    coding.md
  outputs/
  archive/

Luego crea el contenido inicial de cada archivo.

El archivo más importante será:

~/Projects/ai-os/CLAUDE.md

Debe funcionar como el archivo principal de instrucciones del sistema. Quiero que incluya:

1. Quién soy.
2. Cómo debes trabajar conmigo.
3. Qué contexto debes leer siempre.
4. Qué contexto debes leer solo bajo demanda.
5. Cómo debes crear una Spec antes de trabajar.
6. Cómo debes dividir tareas grandes en subtareas pequeñas.
7. Cómo debes pedirme confirmación en decisiones importantes.
8. Cómo debes verificar tu trabajo.
9. Cómo debes usar mis fuentes y documentos.
10. Qué acciones siempre debes hacer.
11. Qué acciones siempre debes preguntarme antes de hacer.
12. Qué acciones nunca debes hacer.
13. Cómo debes crear o actualizar skills cuando detectes tareas repetitivas.

Reglas de trabajo obligatorias:

- No empieces una tarea grande sin crear antes una Spec.
- No asumas contexto personal, profesional o técnico si no está documentado.
- Si falta información importante, pregúntame.
- Divide todo proyecto grande en bloques pequeños.
- Después de cada bloque, genera una revisión breve.
- Antes de entregar algo final, pásalo por el Verificador.
- Si una tarea se repite más de dos veces, sugiere convertirla en una skill.
- No borres, muevas ni sobrescribas archivos importantes sin preguntarme.
- No ejecutes comandos destructivos.
- No instales herramientas en mi Mac sin explicarme para qué sirven y pedirme permiso.
- Usa lenguaje claro, directo y accionable.

Quiero que también me des los comandos de Terminal para crear esta estructura en macOS usando zsh.

Empieza ahora con la entrevista inicial. No crees todavía los archivos hasta que tengas mis respuestas.
