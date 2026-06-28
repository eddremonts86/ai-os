---
name: drupal8-pattern
description: Conventions and patterns for Drupal 8/9/10 — modules, theming, hooks, services, plugins. Applies when working on /Users/edd/Projects/eddremonts86/Drupal8-* or any modern Drupal project.
license: Internal
---

# Drupal 8+ Development Patterns

## Project structure (Composer-based)

```
project/
├── composer.json          # Drupal core + deps
├── composer.lock
├── drush/                 # Custom Drush commands
├── config/
│   ├── sync/              # Config export (committed)
│   └── default/           # Active config (gitignored)
├── scripts/
│   ├── deploy.sh
│   └── update.sh
├── vendor/                # Composer deps (gitignored)
├── web/                   # Drupal root (in Bedrock setups)
│   ├── core/              # Drupal core
│   ├── modules/
│   │   ├── contrib/       # Vendor modules (composer require)
│   │   └── custom/        # Custom modules
│   ├── themes/
│   │   ├── contrib/
│   │   └── custom/
│   ├── sites/default/
│   └── index.php
└── .gitignore
```

**Critical rules:**
- Drupal core ALWAYS via Composer. Never download manually.
- Configuration exported to `config/sync/` and committed to the repo.
- `web/sites/default/files/` and `settings.php` with secrets → gitignored.

## Custom module — Structure

```
web/modules/custom/my_module/
├── my_module.info.yml
├── my_module.module              # Hooks
├── my_module.routing.yml         # Routes
├── my_module.permissions.yml     # Permissions
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
│   └── install/                  # Config defaults (on install)
│   └── schema/                   # Schema definitions
├── templates/                    # Twig templates
│   └── my-template.html.twig
├── css/
├── js/
├── images/
└── tests/
    └── src/
```

## .info.yml (module)

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

**Conventions:**
- Namespace: `Drupal\<module_name>\<Type>`.
- Typed return type in PHP 7.4+.
- Use parameter converters (`UserInterface $user`) instead of loading manually.

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

**Rules:**
- ALWAYS dependency injection, never `\Drupal::service()` in classes (except statics).
- Type hints on all constructor parameters.
- `protected readonly` for dependencies that aren't reassigned.

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

**Rules:**
- Extend `ConfigFormBase` for config forms, `FormBase` for entity forms.
- Validation in `validateForm()`, NOT in `buildForm()`.
- Submit must call `parent::submitForm()` at the end.

## Hooks — Naming and signature

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

**Rules:**
- Hooks ALWAYS in `.module` file (NOT in classes).
- Each hook documented with `@implements hook_NAME()`.
- `hook_theme()` registers templates. Template in `templates/<name>.html.twig`.
- `hook_form_alter()` with `$form_id` check before modifying.

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

**Rules:**
- Output auto-escaped (XSS safe). Always use `{{ }}`.
- `{% raw %}` only for blocks with literal Twig syntax.
- Macros in `templates/_macros/`.

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

  public static function create(ContainerInterface $container, array $configuration, string $plugin_id, array $plugin_definition): self {
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

**Sub-theme (from classy/stable):**

```
themes/custom/my_theme/
├── my_theme.info.yml
├── my_theme.libraries.yml
├── css/
├── js/
├── templates/             # Override parent templates
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

## Custom Drush commands

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

**Rules:**
- `BrowserTestBase` for functional tests (full Drupal boot).
- `KernelTestBase` for kernel-level (faster, no browser).
- `UnitTestBase` for pure unit tests.
- `setUp()` for heavy fixtures, `provider()` for data providers.

## Local setup

```bash
# Requirements
php >= 8.1
composer
drush (composer global require drush/drush)

# Setup
git clone <repo>
cd <repo>
composer install
drush site:install --existing-config
drush cr              # cache rebuild

# Daily workflow
drush cr              # ALWAYS after .yml changes
drush updb           # if pending updates
drush config:export   # BEFORE commit

# Verify before commit
composer validate
drush status
phpcs --standard=Drupal web/modules/custom/
```

## Common errors to avoid

1. ❌ `\Drupal::service()` in classes → ✅ dependency injection.
2. ❌ `drupal_get_user()` (Drupal 7 function) → ✅ `\Drupal::currentUser()` or DI.
3. ❌ Hardcoded HTML in `render arrays` → ✅ `#markup` only for plain text, `#theme` for HTML.
4. ❌ Forgetting `drush cr` after .yml changes → ✅ always rebuild cache.
5. ❌ Modifying `web/core/` directly → ✅ use hooks/plugins.
6. ❌ `db_query()` with concatenation → ✅ `db_select()` with placeholders (SQL injection).
7. ❌ Not exporting config after admin changes → ✅ `drush config:export` always.
8. ❌ `var_dump`/`dpm` in production code → ✅ `\Drupal::logger()` or kint in dev.
9. ❌ Changing `core_version_requirement` to force a version → ✅ use composer constraints.
10. ❌ Not clearing cache after update → ✅ `drush cr` post-`composer update`.

## Security checklist

- ✅ User input via Form API (no direct `$_GET`/`$_POST`).
- ✅ SQL queries with placeholders (`->condition()`, `->fields()`).
- ✅ Output in Twig (auto-escape) or `Html::escape()`.
- ✅ Permissions on routes, NOT manual checks in controller.
- ✅ `check_access` on entity operations.
- ✅ CSRF token in forms (Form API does this automatically).
- ✅ Secrets in `settings.php` (not committed), never in code.