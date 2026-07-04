---
icon: lucide/smartphone-charging
---

# QField plugin templater

[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://qfield.org/)
[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-green.svg)](https://github.com/gounux/qfield-plugin-templater/blob/main/LICENSE)

**A templater that generates a QField plugin with fancy tooling.**

![QField plugin templater logo](./images/qf-plugin-templater-logo.png){ width="192" }

## Quick start

Run the following command:

=== "with `pip`"

    ```sh
    pipx run cookiecutter gh:gounux/qfield-plugin-templater
    ```

=== "with `uv`"

    ```sh
    uvx cookiecutter gh:gounux/qfield-plugin-templater
    ```

After a few prompts, there you go: you have a new QField plugin with a ready-to-go dev workflow and fancy tooling!

## References

Based on [the `cookiecutter` templating engine](https://github.com/cookiecutter/cookiecutter):

[![Cookiecutter logo](https://raw.githubusercontent.com/cookiecutter/cookiecutter/main/logo/cookiecutter_medium.png){ width="320" }](https://github.com/cookiecutter/cookiecutter)

Built for [the QField plugins framework](https://api.qfield.org/):

[![QField for QGIS logo](https://qfield.org/images/qfield_for_qgis.png){ width="260" }](https://api.qfield.org/)

Inspired by the [_QGIS plugin templater_](https://oslandia.gitlab.io/qgis/template-qgis-plugin/):

[![QGIS plugin templater logo](https://oslandia.gitlab.io/qgis/template-qgis-plugin/_static/cookiecutter_qgis_logo_128x128.png){ width="80" }](https://oslandia.gitlab.io/qgis/template-qgis-plugin/)

Featuring a few icons coming from [the Lucide icon set](https://lucide.dev/).

Featuring a few sounds coming from [pixabay](https://pixabay.com/sound-effects/) - see [terms of license](https://pixabay.com/service/license-summary/).

## How to's

- [x] See [how to use the templater and fine-tune the plugin generation](./how_to_use.md).

- [x] See [what you get with this QField plugin templater](./what_you_get.md).

- [x] See [how to setup a QField plugin dev workflow](./dev_workflow.md).

- [x] See [how to contribute to this project](./contributing.md).
