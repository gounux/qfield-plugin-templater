---
icon: lucide/folder-tree
---

# What you get

After the plugin template is generated, here is what you get in the new directory:

- [x] a `main.qml` file: this is the QField plugin file. It contains the logic and UI components for the plugin, that add a button to the QField interface, as well as a Dialog to pick and zoom to a location in the map canvas. Browse [the QField API docs](https://api.qfield.org/) to enhance it.

- [x] a test setup allowing to write tests for the plugin, using [`pytest-qfield`](https://pypi.org/project/pytest-qfield/).

- [x] CICD jobs configured to run different elements around the new plugin in a CI: linting, tests, releases, etc. [GitHub Actions](https://docs.github.com/en/actions) and [GitLab CI](https://docs.gitlab.com/ci/) are currently supported.

- [x] a translation framework allowing you to translate the plugin to several languages, using the Qt tools and especially [`Qt Linguist`](https://doc.qt.io/qt-6/qtlinguist-index.html).

- [x] a [`pre-commit`](https://pre-commit.com/) configuration, that guarantees homogeneous formatting and linting across contributions.

- [x] _experimental_: a `docs` directory, based on [`zensical`](https://zensical.org/docs/get-started/) and pre-generated with basic documentation for the new plugin.

## Template structure

## QField plugin

## Tests

## CICD setup

### GitHub Actions

### GitLab CI

## Translations

## Tooling
