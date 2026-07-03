import logging
import shutil


def clean_github_elements():
    """Remove GitHub specific elements from the project."""
    shutil.rmtree(".github")
    logging.info("GitHub configuration removed.")


def main():
    """Post generation hook."""
    if "{{ cookiecutter.ci_platform }}".lower() != "github":
        clean_github_elements()


if __name__ == "__main__":
    main()
