# QField plugin templater

[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://qfield.org/)
[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-green.svg)](LICENSE)

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/gounux/qfield-plugin-templater/main.svg)](https://results.pre-commit.ci/latest/github/gounux/qfield-plugin-templater/main)

<img src="./documentation/docs/images/qf-plugin-templater-logo.png" alt="QField plugin templater logo" width="192">

**A templater that generates a QField plugin with fancy tooling.**

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

After a few prompts, there you go: you have a new QField plugin with a ready-to-go dev workflow and fancy tooling!

## References

Based on the [`cookiecutter`](https://github.com/cookiecutter/cookiecutter) templating engine:

<img src="https://raw.githubusercontent.com/cookiecutter/cookiecutter/main/logo/cookiecutter_medium.png" alt="Cookiecutter logo" width="320">

Built for the [QField plugins framework](https://api.qfield.org/):

<img src="https://qfield.org/images/qfield_for_qgis.png" alt="QField for QGIS logo" width="260">

Inspired by the [_QGIS plugin templater_](https://oslandia.gitlab.io/qgis/template-qgis-plugin/):

<img src="https://oslandia.gitlab.io/qgis/template-qgis-plugin/_static/cookiecutter_qgis_logo_128x128.png" alt="QGIS plugin templater logo" width="80">

Featuring icons from [the Lucide icon set](https://lucide.dev/), and sounds from [pixabay](https://pixabay.com/sound-effects/) - see [terms of license](https://pixabay.com/service/license-summary/).

## Contributing

See [Contribution guidelines](documentation/docs/contributing.md) for details on how to contribute to this project.

TL;DR:

- See [the Contributor Covenant Code of Conduct v2](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).
- After cloning the repository, install the pre-commit hooks via `pre-commit install`.
- Install [`uv`](https://docs.astral.sh/uv/getting-started/installation/) then dependencies via `uv sync`.
- Serve the doc locally via `uv run zensical serve -f documentation/zensical.toml`.
- Resize the documentation images to `webp` format via `./scripts/resize-image.sh documentation/docs/images/the_image.png 800`.
