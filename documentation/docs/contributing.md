---
icon: lucide/heart-handshake
---

# Contributing

Thank you for considering contributing to the QField plugin templater! Contributions are highly appreciated and help improve the project for everyone.

Keep in mind that this project is still in its early stages, feedback and contributions are welcome to shape its development.  
Contributions of all kinds are welcome, including bug reports, feature requests, documentation improvements, and code contributions.

## Contributor Covenant Code of Conduct

> _We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, visible or invisible disability, ethnicity, sex characteristics, gender identity and expression, level of experience, education, socio-economic status, nationality, personal appearance, race, religion, or sexual identity and orientation._
>
> _We pledge to act and interact in ways that contribute to an open, welcoming, diverse, inclusive, and healthy community._

This project adheres to the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org).  
See [the version 2.0](https://www.contributor-covenant.org/version/2/0/code_of_conduct/) for more details.

## Contribution guidelines

If you intend to contribute to this project, you can follow these guidelines, which are not written in stone but are meant to help having a smooth and homogeneous contribution experience.

### Installation and setup

- [x] Install the necessary dependencies, e.g. on debian-based linux distributions:

```sh
sudo apt install -y python3-pip pre-commit
```

- [x] Clone or fork the repository locally.

- [x] Install the pre-commit hooks in the repository:

```sh
pre-commit install
```

### Making contributions

- [x] Create a new branch for your contribution, based on the `main` branch:

```sh
git checkout -b feat/add-my-new-super-fancy-feature
git checkout -b fix/fix-this-bug
git checkout -b docs/update-this-section-of-the-documentation
```

- [x] Make your changes, then commit them ideally using conventional commit messages:

```sh
git commit -m "feat: add my new super fancy feature"
git commit -m "fix: fix this bug"
git commit -m "docs: update this section of the documentation"
```

### Working on the doc

The documentation is built using [`uv`](https://docs.astral.sh/uv/getting-started/installation/#pypi) and [`zensical`](https://zensical.org/docs/get-started/).  

- [x] Install `uv` and sync the dependencies:

```sh
pipx install uv
uv sync
```

- [x] Serve the documentation locally:

```sh
uv run zensical serve -f documentation/zensical.toml
```

!!! important "Keep minimal space with the storage usage"
    Convert the added images to `webp` format and resize them to a reasonable size.  
    There is a script in this repository, that can help with that:  
    `./scripts/resize-image.sh documentation/docs/images/the_image.png 800`.
