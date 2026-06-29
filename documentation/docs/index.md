---
icon: lucide/smartphone-charging
---

# QField plugin templater

[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://qfield.org/)
[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-green.svg)](https://github.com/gounux/qfield-plugin-templater/blob/main/LICENSE)

**A templater for generating a new QField plugin from scratch.**

![QField plugin templater logo](./images/qf-plugin-templater-logo.png){ width="200" }

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

After a few prompts, there you go : you have a new QField plugin!

## References

Based on the `cookiecutter` templating engine:

[![Cookiecutter logo](https://raw.githubusercontent.com/cookiecutter/cookiecutter/main/logo/cookiecutter_medium.png){ width="360" }](https://github.com/cookiecutter/cookiecutter)

Built for the QField plugins framework:

[![QField for QGIS logo](https://qfield.org/images/qfield_for_qgis.png){ width="300" }](https://api.qfield.org/)

Inspired by the _QGIS plugin templater_:

[![QGIS plugin templater logo](https://oslandia.gitlab.io/qgis/template-qgis-plugin/_static/cookiecutter_qgis_logo_128x128.png){ width="96" }](https://oslandia.gitlab.io/qgis/template-qgis-plugin/)

## How to's

- [x] See [how to use the templater and fine-tune the plugin generation](./how_to_use.md).

- [x] See [what exactly this QField plugin templater generates](./what_you_get.md).

- [x] See [how to setup a QField plugin dev workflow](./dev_workflow.md).

- [x] See [how to contribute to this QField plugin templater](./contributing.md).
