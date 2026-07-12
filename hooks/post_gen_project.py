import logging
import os
import shutil


def clean_license_file():
    """Remove license file if no license is selected."""
    os.remove("LICENSE")
    logging.info("License file removed.")


def clean_github_elements():
    """Remove GitHub specific elements from the project."""
    shutil.rmtree(".github")
    shutil.rmtree("scripts/github")
    logging.info("GitHub configuration removed.")


def clean_gitlab_elements():
    """Remove GitLab specific elements from the project."""
    os.remove(".gitlab-ci.yml")
    logging.info("GitLab configuration removed.")


def main():
    """Post generation hook."""
    if "{{ cookiecutter.open_source_license }}".lower() == "none":
        clean_license_file()
    if "{{ cookiecutter.ci_platform }}".lower() != "github":
        clean_github_elements()
    if "{{ cookiecutter.ci_platform }}".lower() != "gitlab":
        clean_gitlab_elements()


if __name__ == "__main__":
    main()
