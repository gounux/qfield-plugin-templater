# QField plugin templater

[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://qfield.org/)
[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-green.svg)](LICENSE)

**A templater for generating a new QField plugin from scratch.**

<img src="./documentation/docs/images/qf-plugin-templater-logo.png" alt="QField plugin templater logo" width="200">

## Quick start

Run the following command:

- with `pip`:

```sh
pipx run cookiecutter gh:gounux/qfield-plugin-templater
```

Or install `cookiecutter` and run:

```sh
pipx install cookiecutter
cookiecutter gh:gounux/qfield-plugin-templater
```

- with `uv`:

```sh
uvx cookiecutter gh:gounux/qfield-plugin-templater
```

Or install `cookiecutter` and run:

```sh
uv tool install cookiecutter
cookiecutter gh:gounux/qfield-plugin-templater
```

After a few prompts, there you go : you have a new QField plugin!

## References

Based on the [`cookiecutter`](https://github.com/cookiecutter/cookiecutter) templating engine:

<img src="https://raw.githubusercontent.com/cookiecutter/cookiecutter/main/logo/cookiecutter_medium.png" alt="Cookiecutter logo" width="360">

Built for the [QField plugins framework](https://api.qfield.org/):

<img src="https://qfield.org/images/qfield_for_qgis.png" alt="QField for QGIS logo" width="300">

Inspired by the [_QGIS plugin templater_](https://oslandia.gitlab.io/qgis/template-qgis-plugin/):

<img src="https://oslandia.gitlab.io/qgis/template-qgis-plugin/_static/cookiecutter_qgis_logo_128x128.png" alt="QGIS plugin templater logo" width="96">

## Local setup

### Tooling

- install the pre-commit hooks:

```sh
pre-commit install
```

### Documentation

[`uv`](https://docs.astral.sh/uv/getting-started/installation/#pypi) is needed to build and serve the doc static site locally.

- once installed, sync the dependencies:

```sh
uv sync
```

- serve the documentation:

```sh
uv run zensical serve -f documentation/zensical.toml
```

- resize and convert images to `webp`, for minimal storage usage:

```sh
./scripts/resize-image.sh documentation/docs/images/the_image.png sh
```
