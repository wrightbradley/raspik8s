# Welcome to raspik8s

This site holds the documentation necessary to configure and deploy Kubernetes on Raspberry Pi boards.

## Contributing

### Documentation

#### Commands for contributing to documentation

* `make` - Sets up python3 virtual environment
* `source .venv/bin/active` - Activates python3 virtual environment
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.
* `mkdocs gh-deploy` - Deploy documentation updates to gh-deploy branch

#### Documentation layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
