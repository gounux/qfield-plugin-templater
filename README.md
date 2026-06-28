# QField plugin templater

[![QField](https://img.shields.io/badge/QField-plugin-green?logo=qgis)](https://qfield.org/)
[![License: GPL v2](https://img.shields.io/badge/License-GPLv2-green.svg)](LICENSE)

**A cookiecutter-based templater for generating a QField plugin skeleton with CI & integrated tooling.**

![QField plugin templater logo](./documentation/docs/images/qf-plugin-templater-logo.png){ width="200" }

## Local setup

### Tooling

- install pre-commit hooks:

```sh
pre-commit install
```

### Documentation

[`uv`](https://docs.astral.sh/uv/getting-started/installation/#pypi) is needed to build and server the doc locally.

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
