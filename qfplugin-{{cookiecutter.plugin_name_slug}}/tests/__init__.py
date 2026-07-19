from pathlib import Path

PLUGIN_QML_PATH = (
    Path(__file__).parent.parent / "{{ cookiecutter.plugin_name_slug }}" / "main.qml"
)
