---
name: drupal8-pattern
description: Convenciones y patrones de Drupal 8/9/10 — módulos, theming, hooks, services, plugins. Aplica al trabajar en /Users/edd/Projects/eddremonts86/Drupal8-* o cualquier proyecto Drupal moderno.
license: Internal
---

# Drupal 8+ Development Patterns

## Estructura de proyecto (Composer-based)

```
project/
├── composer.json          # Drupal core + deps
├── composer.lock
├── drush/                 # Drush commands custom
├── config/
│   ├── sync/              # Config export (committed)
│   └── default/           # Active config (gitignored)
├── scripts/
│   ├── deploy.sh
│   └── update.sh
├── vendor/                # Composer deps (gitignored)
├── web/                   # Drupal root (en setups Bedrock)
│   ├── core/              # Drupal core
│   ├── modules/
│   │   ├── contrib/       # Vendor modules (composer require)
│   │   └── custom/        # Módulos propios
│   ├── themes/
│   │   ├── contrib/
│   │   └── custom/
│   ├── sites/default/
│   └── index.php
└── .gitignore
```

**Reglas críticas:**
- Drupal core SIEMPRE vía Composer. Nunca descargar manualmente.
- Configuración exportada a `config/sync/` y committed al repo.
- `web/sites/default/files/` y `settings.php` con secrets → gitignored.

## Módulo custom — Estructura

```
web/modules/custom/my_module/
├── my_module.info.yml
├── my_module.module              # Hooks
├── my_module.routing.yml         # Routes
├── my_module.permissions.yml     # Permisos
├── my_module.links.menu.yml      # Menu links
├── my_module.links.task.yml      # Local tasks
├── my_module.services.yml        # Services
├── my_module.install             # Install/uninstall hooks
├── src/
│   ├── Controller/
│   │   └── MyController.php
│   ├── Plugin/
│   │   ├── Block/                # Block plugins
│   │   ├── Field/                # Field widgets/formatters
│   │   └── views/                # Views plugins
│   ├── Form/                     # Form configs
│   ├── Service/
│   │   └── MyService.php
│   └── EventSubscriber/
├── config/
│   └── install/                  # Config defaults (al instalar)
│   └── schema/                   # Schema definitions
├── templates/                    # Twig templates
│   └── my-template.html.twig
├── css/
├── js/
├── images/
└── tests/
    └── src/
```

## .info.yml (módulo)

```yaml
name: 'My Module'
type: module
description: 'What this module does'
core_version_requirement: ^9 || ^10
package: 'Custom'
dependencies:
  - drupal:node
  - drupal:views
  - my_other_module
```

## Routing

**my_module.routing.yml:**
```yaml
my_module.user_profile:
  path: '/user/{user}/profile'
  defaults:
    _controller: '\Drupal\my_module\Controller\MyController::view'
    _title: 'Profile'
  requirements:
    _permission: 'access user profiles'
    user: \d+
  options:
    parameters:
      user:
        type: entity:user
```

## Controllers

```php
<?php

namespace Drupal\my_module\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\user\UserInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

class MyController extends ControllerBase {

  public function view(UserInterface $user): array {
    return [
      '#theme' => 'user_profile',
      '#user' => $user,
    ];
  }

  public function api(UserInterface $user): JsonResponse {
    return new JsonResponse([
      'id' => $user->id(),
      'name' => $user->getDisplayName(),
    ]);
  }
}
```

**Convenciones:**
- Namespace: `Drupal\<module_name>\<Type>`.
- Tipo de retorno tipado en PHP 7.4+.
- Usar parameter converters (`UserInterface $user`) en lugar de cargar manualmente.

## Services & Dependency Injection

**my_module.services.yml:**
```yaml
services:
  my_module.my_service:
    class: Drupal\my_module\Service\MyService
    arguments:
      - '@entity_type.manager'
      - '@logger.factory'
```

**MyService.php:**
```php
<?php

namespace Drupal\my_module\Service;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;

class MyService {
  
  public function __construct(
    protected EntityTypeManagerInterface $entityTypeManager,
    protected LoggerChannelFactoryInterface $loggerFactory,
  ) {}

  public function doSomething(int $id): ?array {
    $this->loggerFactory->get('my_module')->info('Processing @id', ['@id' => $id]);
    // ...
  }
}
```

**Reglas:**
- SIEMPRE dependency injection, nunca `\Drupal::service()` en clases (excepto estáticas).
- Type hints en todos los parámetros del constructor.
- `protected readonly` para dependencies que no se reassignan.

## Forms (ConfigFormBase / FormBase)

```php
<?php

namespace Drupal\my_module\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;

class MySettingsForm extends ConfigFormBase {

  protected function getEditableConfigNames(): array {
    return ['my_module.settings'];
  }

  public function getFormId(): string {
    return 'my_module_settings';
  }

  public function buildForm(array $form, FormStateInterface $form_state): array {
    $config = $this->config('my_module.settings');
    
    $form['api_key'] = [
      '#type' => 'textfield',
      '#title' => $this->t('API Key'),
      '#default_value' => $config->get('api_key'),
      '#required' => TRUE,
    ];

    return parent::buildForm($form, $form_state);
  }

  public function submitForm(array &$form, FormStateInterface $form_state): void {
    $this->config('my_module.settings')
      ->set('api_key', $form_state->getValue('api_key'))
      ->save();
    
    parent::submitForm($form, $form_state);
  }
}
```

**Reglas:**
- Extender `ConfigFormBase` para config forms, `FormBase` para entity forms.
- Validación en `validateForm()`, NO en `buildForm()`.
- Submit debe llamar `parent::submitForm()` al final.

## Hooks — Naming y firma

**my_module.module:**
```php
<?php

use Drupal\Core\Entity\EntityInterface;
use Drupal\node\NodeInterface;

/**
 * Implements hook_entity_presave().
 */
function my_module_entity_presave(EntityInterface $entity) {
  if ($entity instanceof NodeInterface && $entity->bundle() === 'article') {
    $entity->set('field_processed', TRUE);
  }
}

/**
 * Implements hook_form_alter().
 */
function my_module_form_alter(&$form, \Drupal\Core\Form\FormStateInterface $form_state, $form_id) {
  if ($form_id === 'node_article_edit_form') {
    $form['#attached']['library'][] = 'my_module/admin';
  }
}

/**
 * Implements hook_theme().
 */
function my_module_theme($existing, $type, $theme, $path) {
  return [
    'user_profile' => [
      'variables' => ['user' => NULL],
      'template' => 'user-profile',
    ],
  ];
}
```

**Reglas:**
- Hooks SIEMPRE en `.module` file (NO en clases).
- Cada hook documentado con `@implementes hook_NAME()`.
- `hook_theme()` registra templates. Template en `templates/<name>.html.twig`.
- `hook_form_alter()` con `$form_id` check antes de modificar.

## Twig templates

**templates/user-profile.html.twig:**
```twig
<div class="user-profile">
  <h2>{{ user.getDisplayName() }}</h2>
  {% if user.user_picture %}
    <img src="{{ file_url(user.user_picture.entity.uri.value) }}" alt="{{ user.getDisplayName() }}">
  {% endif %}
  {% for role in user.getRoles() %}
    <span class="role role--{{ role }}">{{ role }}</span>
  {% endfor %}
</div>
```

**Reglas:**
- Output automático escapado (XSS safe). Usar `{{ }}` siempre.
- `{% raw %}` solo para bloques con sintaxis Twig literal.
- Macros en `templates/_macros/`.

## Plugin system (Block example)

```php
<?php

namespace Drupal\my_module\Plugin\Block;

use Drupal\Core\Block\BlockBase;
use Drupal\Core\Plugin\ContainerFactoryPluginInterface;
use Drupal\my_module\Service\MyService;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * @Block(
 *   id = "my_module_info_block",
 *   admin_label = @Translation("My Info Block")
 * )
 */
class MyInfoBlock extends BlockBase implements ContainerFactoryPluginInterface {

  public function __construct(
    array $configuration,
    string $plugin_id,
    array $plugin_definition,
    protected MyService $myService,
  ) {
    parent::__construct($configuration, $plugin_id, $plugin_definition);
  }

  public static function create(ContainerInterface $container, array $configuration, $plugin_id, $plugin_definition): self {
    return new self(
      $configuration,
      $plugin_id,
      $plugin_definition,
      $container->get('my_module.my_service'),
    );
  }

  public function build(): array {
    return [
      '#markup' => $this->myService->getInfo(),
    ];
  }
}
```

## Permissions

**my_module.permissions.yml:**
```yaml
administer my module:
  title: 'Administer My Module'
  description: 'Access administration pages for My Module.'
  restrict access: true

view my content:
  title: 'View My Content'
  description: 'View content provided by My Module.'
```

## Theming

**Sub-tema (de classy/stable):**

```
themes/custom/my_theme/
├── my_theme.info.yml
├── my_theme.libraries.yml
├── css/
├── js/
├── templates/             # Override de templates del parent
└── logo.svg
```

**my_theme.info.yml:**
```yaml
name: 'My Theme'
type: theme
description: 'Custom theme'
base theme: stable9
core_version_requirement: ^10
libraries:
  - my_theme/global
regions:
  header: 'Header'
  content: 'Content'
  footer: 'Footer'
```

## Drush commands custom

**drush.services.yml:**
```yaml
services:
  my_module.commands:
    class: \Drupal\my_module\Drush\Commands\MyCommands
    tags:
      - { name: drush.command }
```

**MyCommands.php:**
```php
<?php

namespace Drupal\my_module\Drush\Commands;

use Drush\Commands\DrushCommands;

class MyCommands extends DrushCommands {

  /**
   @command my_module:process
   @aliases mmp
   @usage drush my_module:process 5
   */
  public function process(int $limit): void {
    $this->logger()->notice('Processing @limit items', ['@limit' => $limit]);
  }
}
```

## Testing

```php
<?php

namespace Drupal\Tests\my_module\Functional;

use Drupal\Tests\BrowserTestBase;

class MyModuleTest extends BrowserTestBase {
  protected static $modules = ['my_module', 'node'];
  protected $defaultTheme = 'stark';

  public function testBasicFunctionality(): void {
    $user = $this->drupalCreateUser(['administer my module']);
    $this->drupalLogin($user);

    $this->drupalGet('/admin/config/my-module');
    $this->assertSession()->statusCodeEquals(200);
  }
}
```

**Reglas:**
- `BrowserTestBase` para functional tests (full Drupal boot).
- `KernelTestBase` para kernel-level (más rápido, sin browser).
- `UnitTestBase` para unit tests puros.
- `setUp()` para fixtures pesadas, `provider()` para data providers.

## Setup local

```bash
# Requisitos
php >= 8.1
composer
drush (composer global require drush/drush)

# Setup
git clone <repo>
cd <repo>
composer install
drush site:install --existing-config
drush cr              # cache rebuild

# Workflow diario
drush cr              # SIEMPRE después de cambios en .yml
drush updb           # si hay updates pendientes
drush config:export   # ANTES de commit

# Verificar antes de commit
composer validate
drush status
phpcs --standard=Drupal web/modules/custom/
```

## Errores comunes a evitar

1. ❌ `\Drupal::service()` en clases → ✅ dependency injection.
2. ❌ `drupal_get_user()` (Drupal 7 function) → ✅ `\Drupal::currentUser()` o DI.
3. ❌ Hardcoded HTML en `render arrays` → ✅ `#markup` solo para texto plano, `#theme` para HTML.
4. ❌ Olvidar `drush cr` después de cambios en .yml → ✅ cache rebuild siempre.
5. ❌ Modificar `web/core/` directamente → ✅ usar hooks/plugins.
6. ❌ `db_query()` con concatenación → ✅ `db_select()` con placeholders (SQL injection).
7. ❌ No exportar config después de cambios en admin → ✅ `drush config:export` siempre.
8. ❌ `var_dump`/`dpm` en código production → ✅ `\Drupal::logger()` o kint en dev.
9. ❌ Cambiar `core_version_requirement` para forzar version → ✅ usar composer constraints.
10. ❌ No limpiar cache después de update → ✅ `drush cr` post-`composer update`.

## Security checklist

- ✅ User input via Form API (no `$_GET`/`$_POST` directos).
- ✅ SQL queries con placeholders (`->condition()`, `->fields()`).
- ✅ Output en Twig (auto-escape) o `Html::escape()`.
- ✅ Permisos en routes, NO check manual en controller.
- ✅ `check_access` en entity operations.
- ✅ CSRF token en forms (Form API lo hace auto).
- ✅ Secrets en `settings.php` (no committed), nunca en code.