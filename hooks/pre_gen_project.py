import logging

logger = logging.getLogger(__name__)


def main():
    """Pre generation hook."""
    logger.info("Running pre generation hook...")


if __name__ == "__main__":
    main()
