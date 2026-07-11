---
icon: lucide/list-collapse
---

# How to use the QField plugin templater

The quickest way to generate a QField plugin template is with `pipx` / `uvx`:

=== "`pip`"

    ```sh
    pipx run cookiecutter gh:gounux/qfield-plugin-templater
    ```

=== "`uv`"

    ```sh
    uvx cookiecutter gh:gounux/qfield-plugin-templater
    ```

You can also install `cookiecutter` via:

=== "`pip`"

    ```sh
    pipx install cookiecutter
    ```

=== "`uv`"

    ```sh
    uv tool install cookiecutter
    ```

Then run the templater:

```sh
cookiecutter gh:gounux/qfield-plugin-templater
```

!!! note
    Consider creating a new empty repository [on GitLab](https://gitlab.com/projects/new#blank_project) or [on GitHub](https://github.com/new), **before** generating a new QField plugin with the templater. This will directly and properly bind the repository with the generated QField plugin.

## CLI usage

You can give arguments to the `cookiecutter` CLI, to bypass the prompts:

```sh
cookiecutter gh:gounux/qfield-plugin-templater "plugin_name=My Topologizer"
```

!!! info
    You can browse all the possible arguments accepted by the QField plugin templated in the accurate section: [**template parameters**](#template-parameters).

If running in a CI, you can give the `--no-input` option:

```sh
cookiecutter gh:gounux/qfield-plugin-templater --no-input "plugin_name=My Topologizer"
```

## Template parameters

When generating a QField plugin template, the following values are asked:

- `plugin_name`:

> Plugin name, used to populate the `metadata.txt` file essentially.

Example: _`My Topologizer`_

- `plugin_name_slug`:

> Slugified name, will be used to create the directory for the source code. Default value deduced from the plugin name.

Example: _`my-topologizer`_

- `plugin_description`:

> Plugin description, preferably short.

Example: _This QField plugin will make you map the moon!_

- `plugin_author`:

> Plugin author.

Example: _Jane Doe_

- `plugin_locales`:

> Comma-separated list of locales to support translations for the plugin. Can also be configured later.

Example: _de,es,fr,it_

- `ci_platform`:

> CI platform to configure for this plugin.

Available values: `GitHub`, `GitLab` or _None_

- `repository_url_base`:

> Base URL of the repository for this plugin.

Example: _<https://github.com/gounux/my-topologizer/>_

- `open_source_license`:

> License to use for the plugin.

Available values: `GPLv2+`, `GPLv3`, `MIT` or _None_
