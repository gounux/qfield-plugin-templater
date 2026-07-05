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

- Download a version of a QField build, pick a recent version [from the recent releases](https://github.com/opengisch/qfield/releases).

If you are on Linux, you may need to set the `+x` permission on the downloaded QField build:

```sh
chmod +x qfield-X.Y.Z-linux-x64.AppImage
```

- Open this QField build, go to [the Plugins Manager](https://docs.qfield.org/how-to/advanced-how-tos/plugins/#application-plugins) and install the `QField plugin reloader`.

- Create a symbolic link from the generated plugin directory into the QField plugins directory:

```sh
ln -s qfplugin-{{ cookiecutter.plugin_name_slug }}/{{ cookiecutter.plugin_name_slug }} \
    "~/Documents/QField Documents/QField/plugins"
```

!!! note
    - The QField plugins directory is located in the `QField Documents` directory, which is created in your home when you first run QField. If you have changed the location of this directory, please adapt the command above accordingly.
    - The symbolic link must point to the plugin directory, not the parent directory. In this example, the plugin directory is `{{ cookiecutter.plugin_name_slug }}`, which is inside the generated directory `qfplugin-{{ cookiecutter.plugin_name_slug }}`.

### Test locally

> [!note]
> QGIS4 must be installed on the machine for testing! See [installation instructions](https://qgis.org/resources/installation-guide/#linux).

- Install `uv` locally:

```sh
python3 -m pip install uv --break-system-packages
```

- Create local virtualenv with system packages and sync:

```sh
uv venv --system-site-packages
uv sync
```

- Add system packages to local virtual env (hacky):

```sh
SITE_PACKAGES=$(uv run python -c "import site; print(site.getsitepackages()[0])")
echo "/usr/share/qgis/python" > "$SITE_PACKAGES/qgis.pth"
```

- Test that imports are fine:

```sh
uv run python -c "import qgis; print(qgis.__file__)"
uv run python -c "import PyQt6; print(PyQt6.__file__)"
uv run python -c "from PyQt6.QtCore import QT_VERSION_STR; print(QT_VERSION_STR)"
```

- Clone QField locally, e.g.:

```sh
git clone --depth 1 [--branch release-4_2] https://github.com/opengisch/QField.git
```

- Run tests:

```sh
uv run pytest tests -v --qgis_disable_gui
```

### Translate the plugin

- Install the required tools:

```sh
sudo apt install -y qt6-base-dev qt6-tools-dev-tools
```

- Configure [the `translations.pro` file](./{{ cookiecutter.plugin_name_slug }}/translations.pro) with the languages you want to support. For instance, to support French and German, set the `TRANSLATIONS` variable to the following:

```sh
TRANSLATIONS += \
    main_de.ts \
    main_fr.ts
```

- Generate the translations strings:

```sh
lupdate {{ cookiecutter.plugin_name_slug }}/translations.pro
```

> [!note]
> If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/lupdate` on Linux.

- Open the generated `.ts` files with [`Qt Linguist`](https://doc.qt.io/qt-6/qtlinguist-index.html), using the GUI or the command line:

```sh
linguist {{ cookiecutter.plugin_name_slug }}/main_fr.ts
```

> [!note]
> If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/linguist` on Linux.

- Compile the translations to `.qm` files:

```sh
lrelease {{ cookiecutter.plugin_name_slug }}/translations.pro
```

> [!note]
> If you have both Qt5 and Qt6 tools installed, make sure you use the Qt6 ones, e.g. by using `/usr/lib/qt6/bin/lrelease` on Linux.
