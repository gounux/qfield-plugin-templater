SOURCES += main.qml \
    FamousPlacesDialog.qml

TRANSLATIONS += \
    {% for locale in cookiecutter.plugin_locales.split(',') %} main_{{ locale.strip() }}.ts{% endfor %}
