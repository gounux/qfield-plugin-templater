# {{ cookiecutter.plugin_name }} QField plugin

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://api.qfield.org/)

{{ cookiecutter.plugin_description }}

## Initial setup

This repository has been generated using [the `QField plugin templater`](https://github.com/gounux/qfield-plugin-templater).

Following parameters have been used to generate this plugin:

| Parameter | Value |
| --- | --- |
| Plugin name | {{ cookiecutter.plugin_name }} |
| Plugin name slug | {{ cookiecutter.plugin_name_slug }} |
| Plugin description | {{ cookiecutter.plugin_description }} |
| Plugin author | {{ cookiecutter.plugin_author }} |
| Plugin locales | {{ cookiecutter.plugin_locales }} |
| Repository URL base | {{ cookiecutter.repository_url_base }} |
| Open source license | {{ cookiecutter.open_source_license }} |
| CI platform | {{ cookiecutter.ci_platform }} |

## Development

### Translate the plugin

- install the required tools:

```sh
sudo apt install -y qt6-base-dev qt6-tools-dev-tools
```

- configure [the `translations.pro` file](./{{ cookiecutter.plugin_name_slug }}/translations.pro) with the languages you want to support. For instance, to support French and German, set the `TRANSLATIONS` variable to the following:

```sh
TRANSLATIONS += \
    main_de.ts \
    main_fr.ts
```

- generate the translations strings:

```sh
lupdate {{ cookiecutter.plugin_name_slug }}/translations.pro
```

[!NOTE]
If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/lupdate` on Linux.

- open the generated `.ts` files with [`Qt Linguist`](https://doc.qt.io/qt-6/qtlinguist-index.html), using the GUI or the command line:

```sh
linguist {{ cookiecutter.plugin_name_slug }}/main_fr.ts
```

[!NOTE]
If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/linguist` on Linux.

- compile the translations to `.qm` files:

```sh
lrelease {{ cookiecutter.plugin_name_slug }}/translations.pro
```

[!NOTE]
If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/lrelease` on Linux.
