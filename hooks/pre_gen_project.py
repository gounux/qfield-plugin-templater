import logging
import sys
from pathlib import Path


def main():
    """Pre generation hook."""
    # check if selected icon exists
    plugin_icon = Path("{{ cookiecutter.plugin_icon }}")
    if not plugin_icon.is_file():
        logging.info("Selected plugin icon doesn't exist.")
        sys.exit(1)


if __name__ == "__main__":
    main()
