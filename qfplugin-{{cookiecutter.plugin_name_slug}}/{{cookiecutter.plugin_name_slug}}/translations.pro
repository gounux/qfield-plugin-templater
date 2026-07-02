SOURCES += main.qml

TRANSLATIONS += \
    {% for locale in cookiecutter.plugin_locales.split(',') %}main_{{ locale.strip() }}.ts {% endfor %}
